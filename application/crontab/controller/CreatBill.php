<?php

namespace app\crontab\controller;

class CreatBill extends BaseCron {

    /**
     * 默认方法
     */
    public function index() {
        //搜索商家结算日期小于当前时间减结算周期的所有商家，每次100个
        $store_ids = db('store')->where(array('store_bill_time' => array('<', TIMESTAMP - intval(config('store_bill_cycle')) * 86400)))->limit(100)->column('store_id');
        $storemoneylog_mod = model('storemoneylog');
        $orderinviter_model = model('orderinviter');
        $bill_model = model('bill');
        $trade_model = model('trade');
        $order_refund_day = intval($trade_model->getMaxDay('order_refund'));
        $order_refund_time=TIMESTAMP - $order_refund_day * 86400;
        $vr_order_refund_day = intval(config('code_invalid_refund'));
        $vr_order_refund_time=TIMESTAMP - $vr_order_refund_day * 86400;
        foreach ($store_ids as $store_id) {
            $storemoneylog_mod->startTrans();
            $store_info = db('store')->where('store_id', $store_id)->field('store_id,store_name,seller_name,is_platform_store,store_bill_time')->lock(true)->find();
            if ($store_info) {
                try {
                    $data = array();
                    //如果店铺没有结算过，则查询与结算单相关项目的最小时间作为结算单开始时间
                    if(!$store_info['store_bill_time']){
                        $ob_startdate=0;
                        $storecost_time=db('storecost')->where(array('storecost_store_id' => $store_id, 'storecost_state' => 0, 'storecost_time' => array('<', TIMESTAMP - intval(config('store_bill_cycle')) * 86400)))->order('storecost_time asc')->lock(true)->value('storecost_time');
                        //取结算时间和退款过期时间的较小者
                        $temp_time=$order_refund_time;
                        if($temp_time>(TIMESTAMP - intval(config('store_bill_cycle')) * 86400)){
                            $temp_time=TIMESTAMP - intval(config('store_bill_cycle')) * 86400;
                        }
                        $order_time=db('order')->where(array('store_id' => $store_id, 'order_state' => ORDER_STATE_SUCCESS, 'delay_time' => array('<', $temp_time), 'payment_code' => array('<>', 'offline'), 'ob_no' => 0))->order('delay_time asc')->lock(true)->value('delay_time');
                        //不允许退款且超过使用期限的、允许退款且超过可退款期限、允许退款并且全部完成退款的虚拟订单
                        $vr_order_time=db('vrorder')->where(array('store_id'=>$store_id,'order_state'=>ORDER_STATE_SUCCESS,'finnshed_time'=>array('<',TIMESTAMP - intval(config('store_bill_cycle')) * 86400), 'ob_no' => 0))->where('((vr_invalid_refund=0) || (vr_invalid_refund=1 AND vr_indate<'.$vr_order_refund_time.') || (vr_invalid_refund=1 AND refund_state=2))')->order('finnshed_time asc')->lock(true)->value('finnshed_time');
                        
                        $ob_startdate = (!$ob_startdate || ($ob_startdate && $storecost_time<$ob_startdate))?$storecost_time:$ob_startdate;
                        $ob_startdate = (!$ob_startdate || ($ob_startdate && $order_time<$ob_startdate))?$order_time:$ob_startdate;
                        $ob_startdate = (!$ob_startdate || ($ob_startdate && $vr_order_time<$ob_startdate))?$vr_order_time:$ob_startdate;
                        
                    }else{
                        $ob_startdate=$store_info['store_bill_time'];
                    }
                    if($ob_startdate){
                        $ob_enddate=$ob_startdate+intval(config('store_bill_cycle')) * 86400;
                    //店铺促销活动费用
                    $storecost_sum = db('storecost')->where(array('storecost_store_id' => $store_id, 'storecost_state' => 0, 'storecost_time' => array('<', $ob_enddate)))->field('SUM(storecost_price) AS ob_store_cost_totals,COUNT(*) AS count')->lock(true)->find();
                    
                    //取结算时间和退款过期时间的较小者
                        $temp_time=$order_refund_time;
                        if($temp_time>$ob_enddate){
                            $temp_time=$ob_enddate;
                        }
                    $order_ids = db('order')->where(array('store_id' => $store_id, 'order_state' => ORDER_STATE_SUCCESS, 'delay_time' => array('<', $temp_time), 'payment_code' => array('<>', 'offline'), 'ob_no' => 0))->lock(true)->column('order_id');
                    $vr_order_ids = db('vrorder')->where(array('store_id'=>$store_id,'order_state'=>ORDER_STATE_SUCCESS,'finnshed_time'=>array('<', $temp_time), 'ob_no' => 0))->where('((vr_invalid_refund=0) || (vr_invalid_refund=1 AND vr_indate<'.$vr_order_refund_time.') || (vr_invalid_refund=1 AND refund_state=2))')->lock(true)->column('order_id');
                    if($storecost_sum && $storecost_sum['count']){
                        $data['ob_store_cost_totals'] = $storecost_sum['ob_store_cost_totals'];
                    }
                    if ($order_ids) {
                        //查看相关订单是否有未完成的退款
                        $r_order_ids = db('refundreturn')->where(array('order_id' => array('in', $order_ids), 'refund_state' => array('<>', 3)))->lock(true)->column('order_id');
                        if ($r_order_ids) {
                            $order_ids = array_diff($order_ids, $r_order_ids);
                        }
                        //如果全部为待处理退款的订单，则不生成结算单，等退款完成再处理
                        if ($order_ids) {
                            //结算订单金额，结算运费，结算退单金额
                            $order_sum = db('order')->where(array('order_id' => array('in', $order_ids)))->field('SUM(order_amount) AS ob_order_totals,SUM(shipping_fee) AS ob_shipping_totals,SUM(refund_amount) AS ob_order_return_totals')->lock(true)->find();
                            //结算佣金金额
                            $ordergoods_sum = db('ordergoods')->where(array('order_id' => array('in', $order_ids)))->field('SUM(ROUND(goods_pay_price*commis_rate/100,2)) AS ob_commis_totals')->lock(true)->find();
                            //结算退还佣金，部分退款的
                            $refundreturn_sum_1 = db('refundreturn')->alias('refundreturn')->join('__ORDERGOODS__ ordergoods', 'refundreturn.order_goods_id = ordergoods.rec_id')->where(array('refundreturn.order_id' => array('in', $order_ids), 'refundreturn.refund_state' => 3, 'refundreturn.order_goods_id' => array('>', 0)))->field('SUM(ROUND(refundreturn.refund_amount*ordergoods.commis_rate/100,2)) AS ob_commis_return_totals')->lock(true)->find();
                            $refundreturn_sum_2 = array();
                            $refundreturn_rec_ids_2 = db('refundreturn')->where(array('order_id' => array('in', $order_ids), 'refund_state' => 3, 'order_goods_id' => 0))->lock(true)->column('order_goods_id');
                            if ($refundreturn_rec_ids_2) {
                                $refundreturn_sum_2 = db('ordergoods')->where(array('rec_id' => array('in', $refundreturn_rec_ids_2)))->field('SUM(ROUND(goods_pay_price*commis_rate/100,2)) AS ob_commis_return_totals')->lock(true)->find();
                            }
                            foreach ($order_ids as $order_id) {
                                $orderinviter_model->giveMoney($order_id, 0);
                            }
                            //分销的佣金
                            $orderinviter_sum = db('orderinviter')->where(array('orderinviter_order_id' => array('in', $order_ids), 'orderinviter_valid' => 1, 'orderinviter_order_type' => 0))->field('SUM(orderinviter_money) AS ob_inviter_totals')->lock(true)->find();
                            $data['ob_order_totals']=$order_sum['ob_order_totals'];
                            $data['ob_shipping_totals']=$order_sum['ob_shipping_totals'];
                            $data['ob_order_return_totals']=$order_sum['ob_order_return_totals'];
                            $data['ob_commis_totals']=$ordergoods_sum['ob_commis_totals'];
                            $data['ob_commis_return_totals']=bcadd(((!empty($refundreturn_sum_1)) ? $refundreturn_sum_1['ob_commis_return_totals'] : 0), ((!empty($refundreturn_sum_2)) ? $refundreturn_sum_2['ob_commis_return_totals'] : 0), 2);
                            $data['ob_inviter_totals']=(!empty($orderinviter_sum)) ? $orderinviter_sum['ob_inviter_totals'] : 0;
                          
                        }
                    }
                    if ($vr_order_ids) {
                        foreach ($vr_order_ids as $order_id) {
                            $orderinviter_model->giveMoney($order_id, 1);
                        }
                        //分销的佣金
                        $orderinviter_sum = db('orderinviter')->where(array('orderinviter_order_id' => array('in', $vr_order_ids), 'orderinviter_valid' => 1, 'orderinviter_order_type' => 1))->field('SUM(orderinviter_money) AS ob_vr_inviter_totals')->lock(true)->find();
                        $vr_order_sum = db('vrorder')->where(array('order_id' => array('in', $vr_order_ids)))->field('SUM(order_amount) AS ob_vr_order_totals,SUM(ROUND(order_amount*commis_rate/100,2)) AS ob_vr_commis_totals,SUM(refund_amount) AS ob_vr_order_return_totals,SUM(ROUND(refund_amount*commis_rate/100,2)) AS ob_vr_commis_return_totals')->lock(true)->find();
                        $data['ob_vr_order_totals']=$vr_order_sum['ob_vr_order_totals'];
                        $data['ob_vr_commis_totals']=$vr_order_sum['ob_vr_commis_totals'];
                        $data['ob_vr_order_return_totals']=$vr_order_sum['ob_vr_order_return_totals'];
                        $data['ob_vr_commis_return_totals']=$vr_order_sum['ob_vr_commis_return_totals'];
                        $data['ob_vr_inviter_totals']=(!empty($orderinviter_sum)) ? $orderinviter_sum['ob_vr_inviter_totals'] : 0;
                    }
                    if (!empty($data)) {
                        $data['ob_createdate'] = TIMESTAMP;
                        $data['ob_startdate'] = $ob_startdate;
                        $data['ob_enddate'] = $ob_enddate;
                        $data['ob_store_id'] = $store_id;
                        $data['ob_store_name'] = $store_info['store_name']; //平台自营店铺不需要增加店铺资金
                        $data['ob_state'] = ($store_info['is_platform_store'] == 1) ? 4 : 1;
                        if (!isset($data['ob_order_totals'])) {
                            $data['ob_order_totals'] = 0;
                        }
                        if (!isset($data['ob_store_cost_totals'])) {
                            $data['ob_store_cost_totals'] = 0;
                        }
                        if (!isset($data['ob_inviter_totals'])) {
                            $data['ob_inviter_totals'] = 0;
                        }
                        if (!isset($data['ob_order_return_totals'])) {
                            $data['ob_order_return_totals'] = 0;
                        }
                        if (!isset($data['ob_commis_totals'])) {
                            $data['ob_commis_totals'] = 0;
                        }
                        if (!isset($data['ob_commis_return_totals'])) {
                            $data['ob_commis_return_totals'] = 0;
                        }
                        if (!isset($data['ob_vr_order_totals'])) {
                            $data['ob_vr_order_totals'] = 0;
                        }
                        if (!isset($data['ob_vr_order_return_totals'])) {
                            $data['ob_vr_order_return_totals'] = 0;
                        }
                        if (!isset($data['ob_vr_commis_totals'])) {
                            $data['ob_vr_commis_totals'] = 0;
                        }
                        if (!isset($data['ob_vr_commis_return_totals'])) {
                            $data['ob_vr_commis_return_totals'] = 0;
                        }
                        if (!isset($data['ob_vr_inviter_totals'])) {
                            $data['ob_vr_inviter_totals'] = 0;
                        }
                        //计算实际可得金额
                        $data['ob_result_totals'] = round($data['ob_order_totals'] - $data['ob_store_cost_totals'] - $data['ob_inviter_totals'] - $data['ob_order_return_totals'] - $data['ob_commis_totals'] + $data['ob_commis_return_totals'] + $data['ob_vr_order_totals'] - $data['ob_vr_order_return_totals'] - $data['ob_vr_commis_totals'] + $data['ob_vr_commis_return_totals'] - $data['ob_vr_inviter_totals'], 2);
                        //插入到结算账单
                        $ob_no = $bill_model->addOrderbill($data);
                        if (!$ob_no) {
                            exception('新增结算单失败');
                        }

                        if ($order_ids) {
                            //订单更新结算单号
                            if (!db('order')->where(array('order_id' => array('in', $order_ids)))->update(array('ob_no' => $ob_no))) {
                                exception('更新实物订单结算单号失败');
                            }
                        }

                        if ($vr_order_ids) {
                            //订单更新结算单号
                            if (!db('vrorder')->where(array('order_id' => array('in', $vr_order_ids)))->update(array('ob_no' => $ob_no))) {
                                exception('更新虚拟订单结算单号失败');
                            }
                        }
                    }
                    //店铺活动改成已结算
                    if (!empty($storecost_sum) && $storecost_sum['count'] && !db('storecost')->where(array('storecost_store_id' => $store_id, 'storecost_state' => 0, 'storecost_time' => array('<', $ob_enddate)))->update(array('storecost_state' => 1))) {
                        exception('更新店铺活动结算单号失败');
                    }
                }else{
                    $ob_enddate=TIMESTAMP - intval(config('store_bill_cycle')) * 86400;
                }
                    //更新店铺结算时间
                    if (!db('store')->where('store_id', $store_id)->update(array('store_bill_time' => $ob_enddate))) {
                        exception('更新店铺结算时间失败');
                    }
                } catch (\Exception $e) {
                    $storemoneylog_mod->rollback();
                    $this->log('[店铺名称：' . $store_info['store_name'] . ']' . $e->getMessage());
                }
            }
            $storemoneylog_mod->commit();
        }
        //如果还有未更新结算日期的店铺，则重定向继续生产结算单
        if (db('store')->where(array('store_bill_time' => array('<', TIMESTAMP - intval(config('store_bill_cycle')) * 86400)))->count() > 0) {
            $this->redirect('creat_bill/index');
        }
    }


}

?>
