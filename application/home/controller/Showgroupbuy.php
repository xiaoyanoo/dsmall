<?php

namespace app\home\controller;
use think\Lang;

class Showgroupbuy extends BaseMall
{
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        Lang::load(APP_PATH . 'home/lang/'.config('default_lang').'/groupbuy.lang.php');
        //检查抢购功能是否开启
        if (intval(config('groupbuy_allow')) !== 1){
            $this->error(lang('groupbuy_unavailable'),'index');
        }
        if (request()->action() != 'groupbuy_detail') {
            // 抢购价格区间
            $this->groupbuy_price = rkcache('groupbuyprice', true);
            $this->assign('price_list', $this->groupbuy_price);

            $groupbuy_model = model('groupbuy');

            // 线上抢购分类
            $this->groupbuy_classes = $groupbuy_model->getGroupbuyClasses();
            
            $this->assign('groupbuy_classes', $this->groupbuy_classes);

            // 虚拟抢购分类
            $this->groupbuy_vr_classes = $groupbuy_model->getGroupbuyVrClasses();
            $this->assign('groupbuy_vr_classes', $this->groupbuy_vr_classes);

        }
    }

    /**
     * 抢购聚合页
     */
    public function index()
    {
        $groupbuy_model = model('groupbuy');

        // 线上抢购
        $groupbuy = $groupbuy_model->getGroupbuyOnlineList(array('groupbuy_recommended' => 1, 'groupbuy_is_vr' => 0,), 9);

        $this->assign('groupbuy', $groupbuy);

        // 虚拟抢购
        $vr_groupbuy = $groupbuy_model->getGroupbuyOnlineList(array('groupbuy_recommended' => 1, 'groupbuy_is_vr' => 1,), 9);

        $this->assign('vr_groupbuy', $vr_groupbuy);

        // 轮播图片
        $picArr = array();

        foreach (range(1, 4) as $i) {
            $a = config('live_pic' . $i);
            if ($a) {
                $picArr[] = array($a, config('live_link'. $i));
            }
        }

        $this->assign('picArr', $picArr);

        $this->assign('current', 'online');
        return $this->fetch($this->template_dir.'index');
    }

    /**
     * 进行中的虚拟抢购
     */
    public function vr_groupbuy_list()
    {
        $this->assign('current', 'online');
        $this->assign('buy_button', lang('groupbuy_buy'));
        $this->_show_vr_groupbuy_list('getGroupbuyOnlineList');
        return $this->fetch($this->template_dir.'groupbuy_vr_list');
    }

    /**
     * 即将开始的虚拟抢购
     */
    public function vr_groupbuy_soon()
    {
        $this->assign('current', 'soon');
        $this->assign('buy_button', lang('not_at_the'));
        $this->_show_vr_groupbuy_list('getGroupbuySoonList');
        return $this->fetch($this->template_dir.'groupbuy_vr_list');
    }

    /**
     * 往期虚拟抢购
     */
    public function vr_groupbuy_history()
    {
        $this->assign('current', 'history');
        $this->assign('buy_button', lang('has_ended'));
        $this->_show_vr_groupbuy_list('getGroupbuyHistoryList');
        return $this->fetch($this->template_dir.'groupbuy_vr_list');
    }

    /**
     * 获取抢购列表
     */
    private function _show_vr_groupbuy_list($function_name)
    {
        $groupbuy_model = model('groupbuy');

        $condition = array(
            'groupbuy_is_vr' => 1,
        );

        $order = '';

        // 分类筛选条件
        if (($vr_class_id = (int) input('vr_class')) > 0) {
            $condition['vr_class_id'] = $vr_class_id;

            if (($vr_s_class_id = (int) input('vr_s_class')) > 0)
                $condition['vr_s_class_id'] = $vr_s_class_id;
        }


        // 价格区间筛选条件
        if (($price_id = intval(input('groupbuy_price'))) > 0
            && isset($this->groupbuy_price[$price_id])) {
            $p = $this->groupbuy_price[$price_id];
            $condition['groupbuy_price'] = array('between', array($p['gprange_start'], $p['gprange_end']));
        }

        // 排序
        $groupbuy_order_key = trim(input('groupbuy_order_key'));
        $groupbuy_order = input('groupbuy_order') == '2' ? 'desc' : 'asc';
        if (!empty($groupbuy_order_key)) {
            switch ($groupbuy_order_key) {
                case '1':
                    $order = 'groupbuy_price ' . $groupbuy_order;
                    break;
                case '2':
                    $order = 'groupbuy_rebate ' . $groupbuy_order;
                    break;
                case '3':
                    $order = 'groupbuy_buyer_count ' . $groupbuy_order;
                    break;
            }
        }

        $groupbuy_list = $groupbuy_model->$function_name($condition, 20, $order);
        $this->assign('groupbuy_list', $groupbuy_list);
        $this->assign('show_page', $groupbuy_model->page_info->render());

        $this->assign('html_title', lang('text_groupbuy_list'));

        $this->_assign_seo(model('seo')->type('group')->show());

        /* 引用搜索相关函数 */
        require_once(APP_PATH . '/home/common_search.php');
        $this->assign('groupbuyMenuIsVr', 1);
    }

    /**
     * 进行中的抢购抢购
     **/
    public function groupbuy_list() {
        $this->assign('current', 'online');
        $this->assign('buy_button', lang('groupbuy_buy'));
        $this->_show_groupbuy_list('getGroupbuyOnlineList');
        return $this->fetch($this->template_dir.'groupbuy_list');
    }

    /**
     * 即将开始的抢购
     **/
    public function groupbuy_soon() {
        $this->assign('current', 'soon');
        $this->assign('buy_button', lang('not_at_the'));
        $this->_show_groupbuy_list('getGroupbuySoonList');
        return $this->fetch($this->template_dir.'groupbuy_list');
    }

    /**
     * 往期抢购
     **/
    public function groupbuy_history() {
        $this->assign('current', 'history');
        $this->assign('buy_button', lang('has_ended'));
        $this->_show_groupbuy_list('getGroupbuyHistoryList');
        return $this->fetch($this->template_dir.'groupbuy_list');
    }

    /**
     * 获取抢购列表
     **/
    private function _show_groupbuy_list($function_name) {
        $groupbuy_model = model('groupbuy');

        $condition = array(
            'groupbuy_is_vr' => 0,
        );
        $order = '';

        // 分类筛选条件
        if (($gclass_id = (int) input('class')) > 0) {
            $condition['gclass_id'] = $gclass_id;

            if (($s_gclass_id = (int) input('s_class')) > 0)
                $condition['s_gclass_id'] = $s_gclass_id;
        }

        // 价格区间筛选条件
        if (($price_id = intval(input('groupbuy_price'))) > 0
            && isset($this->groupbuy_price[$price_id])) {
            $p = $this->groupbuy_price[$price_id];
            $condition['groupbuy_price'] = array('between', array($p['gprange_start'], $p['gprange_end']));
        }

        // 排序
        $groupbuy_order_key = trim(input('groupbuy_order_key'));
        $groupbuy_order = input('groupbuy_order') == '2'?'desc':'asc';
        if(!empty($groupbuy_order_key)) {
            switch ($groupbuy_order_key) {
                case '1':
                    $order = 'groupbuy_price '.$groupbuy_order;
                    break;
                case '2':
                    $order = 'groupbuy_rebate '.$groupbuy_order;
                    break;
                case '3':
                    $order = 'groupbuy_buyer_count '.$groupbuy_order;
                    break;
            }
        }

        $groupbuy_list = $groupbuy_model->$function_name($condition, 20, $order);
        $this->assign('groupbuy_list', $groupbuy_list);
        $this->assign('show_page', $groupbuy_model->page_info->render());

        $this->assign('html_title', lang('text_groupbuy_list'));

        $this->_assign_seo(model('seo')->type('group')->show());

        /* 引用搜索相关函数 */
        require_once(APP_PATH . '/home/common_search.php');
        $this->assign('groupbuyMenuIsVr', 0);

    }

    /**
     * 抢购详细信息
     **/
    public function groupbuy_detail() {
        $group_id = intval(input('param.group_id'));

        $groupbuy_model = model('groupbuy');
        $store_model = model('store');

        //获取抢购详细信息
        $groupbuy_info = $groupbuy_model->getGroupbuyInfoByID($group_id);
        if(empty($groupbuy_info)) {
            $this->error(lang('param_error'),'showgroupbuy/index');
        }
        $this->assign('groupbuy_info',$groupbuy_info);

        $this->assign('groupbuyMenuIsVr', (bool) $groupbuy_info['groupbuy_is_vr']);

        if ($groupbuy_info['groupbuy_is_vr']) {
            $goods_info = model('goods')->getGoodsInfoByID($groupbuy_info['goods_id']);
            $buy_limit = max(0, (int) $goods_info['virtual_limit']);
            $upper_limit = max(0, (int) $groupbuy_info['groupbuy_upper_limit']);
            if ($buy_limit < 1 || ($buy_limit > 0 && $upper_limit > 0 && $buy_limit > $upper_limit)) {
                $buy_limit = $upper_limit;
            }

            $this->assign('goods_info', $goods_info);
            $this->assign('buy_limit', $buy_limit);
        } else {
            $this->assign('buy_limit', $groupbuy_info['groupbuy_upper_limit']);
        }

        // 输出店铺信息
        $store_info = $store_model->getStoreInfoByID($groupbuy_info['store_id']);
        $this->assign('store_info', $store_info);

        // 浏览数加1
        $update_array = array();
        $update_array['groupbuy_views'] = array('exp', 'groupbuy_views+1');
        $groupbuy_model->editGroupbuy($update_array, array('groupbuy_id'=>$group_id));


        //获取店铺推荐商品
        $commended_groupbuy_list = $groupbuy_model->getGroupbuyCommendedList(8);
        $this->assign('commended_groupbuy_list', $commended_groupbuy_list);

        // 好评率
        $evaluategoods_model = model('evaluategoods');
        $evaluate_info = $evaluategoods_model->getEvaluategoodsInfoByCommonidID($groupbuy_info['goods_commonid']);
        $this->assign('evaluate_info', $evaluate_info);

        $this->_assign_seo(model('seo')->type('group_content')->param(array('name'=>$groupbuy_info['groupbuy_name']))->show());
        /* 引用搜索相关函数 */
        require_once(APP_PATH . '/home/common_search.php');
        return $this->fetch($this->template_dir.'groupbuy_detail');
    }

    /**
     * 购买记录
     */
    public function groupbuy_order() {
        $group_id = intval(input('group_id'));
        if ($group_id > 0) {
            if (!input('is_vr')) {
                //获取购买记录
                $order_model = model('order');
                $condition = array();
                $condition['goods_type'] = 2;
                $condition['promotions_id'] = $group_id;
                $order_goods_list = $order_model->getOrdergoodsList($condition, '*', 0 , 10);
                $this->assign('order_goods_list', $order_goods_list);
                $this->assign('show_page', $order_model->page_info->render());
                if (!empty($order_goods_list)) {
                    $orderid_array = array();
                    foreach ($order_goods_list as $value) {
                        $orderid_array[] = $value['order_id'];
                    }
                    $order_list = $order_model->getNormalOrderList(array('order_id' => array('in', $orderid_array)), '', 'order_id,buyer_name,add_time');
                    $order_list = array_under_reset($order_list, 'order_id');
                    $this->assign('order_list', $order_list);
                }
            } else {
                $vrorder_model = model('vrorder');
                $condition = array();
                $condition['order_promotion_type'] = 1;
                $condition['promotions_id'] = $group_id;
                $order_goods_list = $vrorder_model->getVrorderAndOrderGoodsSalesRecordList($condition, '*', 10);
                $this->assign('order_goods_list', $order_goods_list);
                $this->assign('show_page', $vrorder_model->page_info->render());
            }
        }
        echo $this->fetch($this->template_dir.'groupbuy_order');
    }

    /**
     * 商品评价
     */
    public function groupbuy_evaluate() {
        $goods_commonid = intval(input('commonid'));
        if ($goods_commonid > 0) {
            $condition = array();
            $condition['goods_commonid'] = $goods_commonid;
            $goods_list = model('goods')->getGoodsList($condition, 'goods_id');
            if (!empty($goods_list)) {
                $goodsid_array = array();
                foreach ($goods_list as $value) {
                    $goodsid_array[] = $value['goods_id'];
                }
                $evaluategoods_model = model('evaluategoods');
                $where = array();
                $where['geval_goodsid'] = array('in', $goodsid_array);
                $evaluate_list = $evaluategoods_model->getEvaluategoodsList($where, 10);
                $this->assign('goodsevallist',$evaluate_list);
                $this->assign('show_page',$evaluategoods_model->page_info->render());
            }
        }
        echo $this->fetch($this->template_dir.'groupbuy_evaluate');
    }

}