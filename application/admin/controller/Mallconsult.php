<?php

/**
 * 平台客服
 * Date: 2017/7/17
 * Time: 11:58
 */

namespace app\admin\controller;

use think\Validate;

class Mallconsult extends AdminControl {

    public function _initialize() {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 咨询管理
     */
    public function index() {
        $condition = array();
        $member_name = trim(input('param.member_name'));
        if ($member_name != '') {
            $condition['member_name'] = array('like', '%' . $member_name . '%');
            $this->assign('member_name', $member_name);
        }
        $mallconsulttype_id = intval(input('param.mctid'));
        if ($mallconsulttype_id > 0) {
            $condition['mallconsulttype_id'] = $mallconsulttype_id;
            $this->assign('mctid', $mallconsulttype_id);
        }
        $mallconsult_model = model('mallconsult');
        $consult_list = $mallconsult_model->getMallconsultList($condition, '*', 10);
        $this->assign('show_page', $mallconsult_model->page_info->render());
        $this->assign('consult_list', $consult_list);


        // 咨询类型列表
        $type_list = model('mallconsulttype')->getMallconsulttypeList(array(), 'mallconsulttype_id,mallconsulttype_name', 'mallconsulttype_id');
        $this->assign('type_list', $type_list);

        // 回复状态
        $state = array('0' => '未回复', '1' => '已回复');
        $this->assign('state', $state);
        $this->setAdminCurItem('index');
        return $this->fetch();
    }

    /**
     * 回复咨询
     */
    public function consult_reply() {
        $mallconsult_model = model('mallconsult');
        if (request()->isPost()) {
            $mallconsult_id = intval(input('post.mallconsult_id'));
            $reply_content = trim(input('post.reply_content'));
            if ($mallconsult_id <= 0 || $reply_content == '') {
                $this->error(lang('param_error'));
            }
            $update['mallconsult_isreply'] = 1;
            $update['mallconsult_reply_content'] = $reply_content;
            $update['mallconsult_replytime'] = TIMESTAMP;
            $update['admin_id'] = $this->admin_info['admin_id'];
            $update['admin_name'] = $this->admin_info['admin_name'];
            $result = $mallconsult_model->editMallconsult(array('mallconsult_id' => $mallconsult_id), $update);
            if ($result) {
                $consult_info = $mallconsult_model->getMallconsultInfo(array('mallconsult_id' => $mallconsult_id));
                // 发送用户消息
                $param = array();
                $param['code'] = 'consult_mall_reply';
                $param['member_id'] = $consult_info['member_id'];
                $param['param'] = array(
                    'consult_url' => url('/Home/Membermallconsult/mallconsult_info', ['id' => $mallconsult_id])
                );
                \mall\queue\QueueClient::push('sendMemberMsg', $param);

                dsLayerOpenSuccess('回复成功');
            } else {
                $this->error('回复失败');
            }
        } else {
            $id = intval(input('param.id'));
            if ($id <= 0) {
                $this->error(lang('param_error'));
            }

            $consult_info = $mallconsult_model->getMallconsultDetail($id);
            $this->assign('consult_info', $consult_info);
            return $this->fetch();
        }
    }

    /**
     * 删除平台客服咨询
     */
    public function del_consult() {
        $mallconsult_id = input('param.mallconsult_id');
        $mallconsult_id_array = ds_delete_param($mallconsult_id);
        if ($mallconsult_id_array == FALSE) {
            ds_json_encode('10001', lang('param_error'));
        }
        $condition = array();
        $condition['mallconsult_id'] = array('in',$mallconsult_id_array);
        
        $result = model('mallconsult')->delMallconsult($condition);
        if ($result) {
            $this->log('删除平台客服咨询' . '[ID:' . $mallconsult_id . ']');
            ds_json_encode('10000', lang('ds_common_del_succ'));
        } else {
            ds_json_encode('10001', lang('ds_common_del_fail'));
        }
    }


    /**
     * 咨询类型列表
     */
    public function type_list() {
        $mallconsulttype_model = model('mallconsulttype');
        $type_list = $mallconsulttype_model->getMallconsulttypeList(array(), 'mallconsulttype_id,mallconsulttype_name,mallconsulttype_sort');
        $this->assign('type_list', $type_list);
        $this->setAdminCurItem('type_list');
        return $this->fetch();
    }

    /**
     * 新增咨询类型
     */
    public function type_add() {
        if (request()->isPost()) {
            // 验证
            $obj_validate = new Validate();
            $data = [
                'mallconsulttype_name' => input('post.mallconsulttype_name'),
                'mallconsulttype_sort' => input('post.mallconsulttype_sort')
            ];
            $rule = [
                ['mallconsulttype_name', 'require', '请填写咨询类型名称'],
                ['mallconsulttype_sort', 'require|number', '请正确填写咨询类型排序']
            ];

            $error = $obj_validate->check($data, $rule);
            if (!$error) {
                $this->error(lang('ds_common_op_fail') . $obj_validate->getError());
            }
            $insert = array();
            $insert['mallconsulttype_name'] = trim(input('post.mallconsulttype_name'));
            $insert['mallconsulttype_introduce'] = input('post.mallconsulttype_introduce');
            $insert['mallconsulttype_sort'] = intval(input('post.mallconsulttype_sort'));
            $result = model('mallconsulttype')->addMallconsulttype($insert);
            if ($result) {
                $this->log('新增咨询类型', 1);
                dsLayerOpenSuccess(lang('ds_common_save_succ'));
            } else {
                $this->log('新增咨询类型', 0);
                $this->error(lang('ds_common_save_fail'));
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑咨询类型
     */
    public function type_edit() {
        $mallconsulttype_model = model('mallconsulttype');
        if (request()->isPost()) {
            // 验证
            $obj_validate = new Validate();
            $data = [
                'mallconsulttype_name' => input('post.mallconsulttype_name'),
                'mallconsulttype_sort' => input('post.mallconsulttype_sort')
            ];
            $rule = [
                ['mallconsulttype_name', 'require', '请填写咨询类型名称'],
                ['mallconsulttype_sort', 'require|number', '请正确填写咨询类型排序']
            ];

            $error = $obj_validate->check($data, $rule);
            if (!$error) {
                $this->error(lang('ds_common_op_fail') . $obj_validate->getError());
            }
            $where = array();
            $where['mallconsulttype_id'] = intval(input('post.mallconsulttype_id'));
            $update = array();
            $update['mallconsulttype_name'] = trim(input('post.mallconsulttype_name'));
            $update['mallconsulttype_introduce'] = input('post.mallconsulttype_introduce');
            $update['mallconsulttype_sort'] = intval(input('post.mallconsulttype_sort'));
            $result = $mallconsulttype_model->editMallconsulttype($where, $update);
            if ($result>=0) {
                $this->log('编辑平台客服咨询类型 ID:' . $where['mallconsulttype_id'], 1);
                dsLayerOpenSuccess(lang('ds_common_op_succ'));
            } else {
                $this->log('编辑平台客服咨询类型 ID:' . $where['mallconsulttype_id'], 0);
                $this->error(lang('ds_common_op_fail'));
            }
        }

        $mallconsulttype_id = intval(input('param.mallconsulttype_id'));
        if ($mallconsulttype_id <= 0) {
            $this->error(lang('param_error'));
        }
        $mallconsulttype_info = $mallconsulttype_model->getMallconsulttypeInfo(array('mallconsulttype_id' => $mallconsulttype_id));
        $this->assign('mallconsulttype_info', $mallconsulttype_info);
        return $this->fetch();
    }

    /**
     * 删除咨询类型
     */
    public function type_del() {
        $mallconsulttype_id = input('param.mallconsulttype_id');
        $mallconsulttype_id_array = ds_delete_param($mallconsulttype_id);
        if ($mallconsulttype_id_array == FALSE) {
            ds_json_encode('10001', lang('param_error'));
        }
        $condition = array();
        $condition['mallconsulttype_id'] = array('in',$mallconsulttype_id_array);
        $result = model('mallconsulttype')->delMallconsulttype($condition);
        if ($result) {
            $this->log('删除平台客服咨询类型 ID:' . $mallconsulttype_id, 1);
            ds_json_encode('10000', lang('ds_common_del_succ'));
        } else {
            $this->log('删除平台客服咨询类型 ID:' . $mallconsulttype_id, 0);
            ds_json_encode('10001', lang('ds_common_del_fail'));
        }
    }

    protected function getAdminItemList() {
        $menu_array = array(
            array(
                'name' => 'index', 'text' => '平台客服咨询列表', 'url' => url('Mallconsult/index')
            ), array(
                'name' => 'type_list', 'text' => '平台咨询类型', 'url' => url('Mallconsult/type_list')
            ), array(
                'name' => 'type_add', 'text' => '新增类型', 'url' =>"javascript:dsLayerOpen('".url('Mallconsult/type_add')."','新增类型')"
            ),
        );
        if (request()->action() == 'type_edit')
            $menu_array[] = array(
                'name' => 'type_edit', 'text' => '编辑类型', 'url' => ''
            );
        return $menu_array;
    }

}