<?php

namespace app\seller\controller;

use think\Lang;
use think\Validate;

class Sellerbrand extends BaseSeller {

    public function _initialize() {
        parent::_initialize(); // TODO: Change the autogenerated stub
        Lang::load(APP_PATH . 'home/lang/'.config('default_lang').'/sellerbrand.lang.php');
    }

    /**
     * 品牌列表
     */
    public function index() {
        $brand_model = model('brand');
        $condition = array();
        $condition['store_id'] = session('store_id');
        if (!empty(input('param.brand_name'))) {
            $condition['brand_name'] = array('like', '%' . input('param.brand_name') . '%');
        }

        $brand_list = $brand_model->getBrandList($condition, '*', 10);
        $this->assign('brand_list', $brand_list);
        $this->assign('show_page', $brand_model->page_info->render());

        $this->setSellerCurMenu('seller_brand');
        $this->setSellerCurItem('brand_list');
        return $this->fetch($this->template_dir . 'index');
    }

    /**
     * 品牌添加页面
     */
    public function brand_add() {
        $brand_model = model('brand');
        if (input('param.brand_id') != '') {
            $brand_array = $brand_model->getBrandInfo(array(
                'brand_id' => input('param.brand_id'),
                'store_id' => session('store_id')
            ));
            if (empty($brand_array)) {
                $this->error(lang('wrong_argument'));
            }
            $this->assign('brand_array', $brand_array);
        }

        // 一级商品分类
        $gc_list = model('goodsclass')->getGoodsclassListByParentId(0);
        $this->assign('gc_list', $gc_list);

        echo $this->fetch($this->template_dir . 'add');
    }

    /**
     * 品牌保存
     */
    public function brand_save() {

        $brand_model = model('brand');
        if (request()->isPost()) {
            /**
             * 验证
             */
            $obj_validate = new Validate();
            $date = [
                'brand_name' => input('param.brand_name'),
                'brand_initial' => input('param.brand_initial'),
            ];
            $rule = [
                ['brand_name', 'require', lang('store_goods_brand_name_null')],
                ['brand_initial', 'require', '请填写首字母']
            ];

            $error = $obj_validate->check($date, $rule);
            if (!$error) {
                ds_json_encode(10001,$obj_validate->getError());
            }

            /**
             * 上传图片
             */
            $brand_pic = '';
            if (!empty($_FILES['brand_pic']['name'])) {
                $upload_file = BASE_UPLOAD_PATH . DS . ATTACH_BRAND;
                $file_name = session('store_id') . '_' . date('YmdHis') . rand(10000, 99999);
                $file_object = request()->file('brand_pic');
                $info = $file_object->rule('uniqid')->validate(['ext' => ALLOW_IMG_EXT])->move($upload_file, $file_name);
                if ($info) {
                    $brand_pic = $info->getFilename();
                } else {
                    ds_json_encode(10001,$file_object->getError());
                }
            }
            $insert_array = array();
            $insert_array['brand_name'] = trim(input('param.brand_name'));
            $insert_array['brand_initial'] = strtoupper(input('param.brand_initial'));
            $insert_array['gc_id'] = input('param.class_id');
            $insert_array['brand_class'] = input('param.brand_class');
            $insert_array['brand_pic'] = $brand_pic;
            $insert_array['brand_apply'] = 0;
            $insert_array['store_id'] = session('store_id');

            $result = $brand_model->addBrand($insert_array);
            if ($result) {
                ds_json_encode(10000,lang('store_goods_brand_apply_success'));
            } else {
                ds_json_encode(10001,lang('ds_common_save_fail'));
            }
        }
    }

    /**
     * 品牌修改
     */
    public function brand_edit() {
        $brand_model = model('brand');

        $brand_id = intval(input('post.brand_id'));
        if($brand_id<=0){
            ds_json_encode(10001,lang('ds_common_save_fail'));
        }

        if (request()->isPost()) {
            /**
             * 验证
             */
            $obj_validate = new Validate();
            $date = [
                'brand_name' => input('post.brand_name'),
                'brand_initial' => input('post.brand_initial'),
            ];
            $rule = [
                ['brand_name', 'require', lang('store_goods_brand_name_null')],
                ['brand_initial', 'require', '请填写首字母']
            ];

            $error = $obj_validate->check($date, $rule);
            if (!$error) {
                ds_json_encode(10001,$obj_validate->getError());
            } else {
                /**
                 * 上传图片
                 */
                if (!empty($_FILES['brand_pic']['name'])) {
                    $upload_file = BASE_UPLOAD_PATH . DS . ATTACH_BRAND;
                    $file_name = session('store_id') . '_' . date('YmdHis') . rand(10000, 99999);
                    $file_object = request()->file('brand_pic');
                    $info = $file_object->rule('uniqid')->validate(['ext' => ALLOW_IMG_EXT])->move($upload_file, $file_name);
                    $brand_pic = '';
                    if ($info) {
                        $brand_pic = $info->getFilename();
                        //删除图片
                        $brand_info = $brand_model->getBrandInfo(array('brand_id'=>$brand_id));
                        if (!empty($brand_info['brand_pic'])) {
                            @unlink(BASE_UPLOAD_PATH . DS . ATTACH_BRAND . DS . $brand_info['brand_pic']);
                        }
                    } else {
                        ds_json_encode(10001,$file_object->getError());
                    }
                }
                $where = array();
                $where['brand_id'] = $brand_id;
                $update_array = array();
                $update_array['brand_initial'] = strtoupper(input('post.brand_initial'));
                $update_array['brand_name'] = trim(input('post.brand_name'));
                $update_array['gc_id'] = input('post.class_id');
                $update_array['brand_class'] = input('post.brand_class');
                if (!empty($brand_pic)) {
                    $update_array['brand_pic'] = $brand_pic;
                }

                $result = $brand_model->editBrand($where, $update_array);
                if ($result) {
                    ds_json_encode(10000,lang('ds_common_save_succ'));
                } else {
                    ds_json_encode(10001,lang('ds_common_save_fail'));
                }
            }
        } else {
            ds_json_encode(10001,lang('ds_common_save_fail'));
        }
    }

    /**
     * 品牌删除
     */
    public function drop_brand() {
        $brand_model = model('brand');
        $brand_id = intval(input('param.brand_id'));
        if ($brand_id > 0) {
            $brand_model->delBrand(array(
                'brand_id' => $brand_id, 'brand_apply' => 0, 'store_id' => session('store_id')
            ));
            ds_json_encode(10000,lang('ds_common_del_succ'));
        } else {
            ds_json_encode(10001,lang('ds_common_del_fail'));
        }
    }

    /**
     * 用户中心右边，小导航
     *
     * @param string $menu_type 导航类型
     * @param string $menu_key 当前导航的menu_key
     * @param array $array 附加菜单
     * @return
     */
    protected function getSellerItemList() {
        $menu_array = array(
            array(
                'name' => 'brand_list', 'text' => lang('ds_member_path_brand_list'),
                'url' => url('Sellerbrand/index')
            )
        );

        return $menu_array;
    }

}