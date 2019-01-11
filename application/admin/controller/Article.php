<?php

namespace app\admin\controller;

use think\Lang;
use think\Validate;
use think\Db;

class Article extends AdminControl {

    public function _initialize() {
        parent::_initialize();
        Lang::load(APP_PATH . 'admin/lang/'.config('default_lang').'/article.lang.php');
    }

    public function index() {

        /**
         * 检索条件
         */
        $condition = array();
        $search_ac_id = intval(input('param.search_ac_id'));
        if ($search_ac_id) {
            $condition['ac_id'] = $search_ac_id;
        }
        $search_title = trim(input('param.search_title'));
        if ($search_title) {
            $condition['article_title'] = array('like', "%" . $search_title . "%");
        }
        $article_model = model('article');
        $article_list = $article_model->getArticleList($condition, 10);

        $articleclass_model = model('articleclass');
        /**
         * 整理列表内容
         */
        if (is_array($article_list)) {
            /**
             * 取文章分类
             */
            $class_list = $articleclass_model->getArticleclassList(array());
            $tmp_class_name = array();
            if (is_array($class_list)) {
                foreach ($class_list as $k => $v) {
                    $tmp_class_name[$v['ac_id']] = $v['ac_name'];
                }
            }
            foreach ($article_list as $k => $v) {
                /**
                 * 发布时间
                 */
                $article_list[$k]['article_time'] = date('Y-m-d H:i:s', $v['article_time']);
                /**
                 * 所属分类
                 */
                if (@array_key_exists($v['ac_id'], $tmp_class_name)) {
                    $article_list[$k]['ac_name'] = $tmp_class_name[$v['ac_id']];
                }
            }
        }

        /**
         * 分类列表
         */
        $parent_list = $articleclass_model->getTreeClassList(2);
        if (is_array($parent_list)) {
            $unset_sign = false;
            foreach ($parent_list as $k => $v) {
                $parent_list[$k]['ac_name'] = str_repeat("&nbsp;", $v['deep'] * 2) . $v['ac_name'];
            }
        }

        $this->assign('article_list', $article_list);
        $this->assign('show_page', $article_model->page_info->render());
        $this->assign('search_title', $search_title);
        $this->assign('search_ac_id', $search_ac_id);
        $this->assign('parent_list', $parent_list);
        
        $this->assign('filtered', $condition ? 1 : 0); //是否有查询条件
        
        $this->setAdminCurItem('index');
        return $this->fetch();
    }

    public function add() {
        if (!(request()->isPost())) {
            $article = [
                'article_title' => '',
                'ac_id' => input('param.ac_id'),
                'article_url' => '',
                'article_show' => 0,
                'article_sort' => 0,
                'article_content' => '',
            ];
            $articleclass_model = model('articleclass');
            $cate_list=$articleclass_model->getTreeClassList(2);
            $this->assign('ac_list', $cate_list);
            $this->assign('article', $article);
            $this->setAdminCurItem('add');
            return $this->fetch('form');
        } else {
            $data = array(
                'article_title' => input('post.article_title'),
                'ac_id' => input('post.ac_id'),
                'article_url' => input('post.article_url'),
                'article_sort' => input('post.article_sort'),
                'article_content' => input('post.article_content'),
                'article_time' => TIMESTAMP,
            );
            $data['article_show'] = intval(input('post.article_show'));
            //验证数据  BEGIN
            $rule = [
                ['article_sort', 'number', lang('article_sort_error')],
                ['article_title', 'require', lang('article_title_error')],
            ];
            $validate = new Validate($rule);
            $validate_result = $validate->check($data);
            if (!$validate_result) {
                $this->error($validate->getError());
            }
            //验证数据  END
            $result = model('article')->addArticle($data);
            if ($result) {
                $this->success(lang('ds_common_save_succ'), 'Article/index');
            } else {
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }

    public function edit() {
        $art_id = intval(input('param.article_id'));
        if ($art_id<=0) {
            $this->error(lang('param_error'));
        }
        if (!request()->isPost()) {
            $condition = array();
            $condition['article_id'] = $art_id;
            $article = model('article')->getOneArticle($condition);
            $this->assign('article', $article);
            $articleclass_model = model('articleclass');
            $cate_list=$articleclass_model->getTreeClassList(2);
            $this->assign('ac_list', $cate_list);
            $this->setAdminCurItem('edit');
            return $this->fetch('form');
        } else {
            $data = array(
                'article_title' => input('post.article_title'),
                'ac_id' => input('post.ac_id'),
                'article_url' => input('post.article_url'),
                'article_sort' => input('post.article_sort'),
                'article_content' => input('post.article_content'),
                'article_time' => TIMESTAMP,
            );
            $data['article_show'] = intval(input('post.article_show'));
            //验证数据  BEGIN
            $rule = [
                ['article_sort', 'number', lang('article_sort_error')],
                ['article_title', 'require', lang('article_title_error')],
            ];
            $validate = new Validate($rule);
            $validate_result = $validate->check($data);
            if (!$validate_result) {
                $this->error($validate->getError());
            }

            //验证数据  END
            $result = model('article')->editArticle($data, $art_id);
            if ($result) {
                $this->success(lang('ds_common_save_succ'), 'Article/index');
            } else {
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }

    public function drop() {
        $article_id = input('param.article_id');
        if (empty($article_id)) {
            ds_json_encode(10001, lang('param_error'));
        }
        $result = model('article')->delArticle($article_id);
        if ($result) {
            ds_json_encode(10000, lang('ds_common_op_succ'));
        } else {
            ds_json_encode(10001, lang('error'));
        }
    }

    /**
     * 获取卖家栏目列表,针对控制器下的栏目
     */
    protected function getAdminItemList() {
        $menu_array = array(
            array(
                'name' => 'index',
                'text' => lang('ds_manage'),
                'url' => url('Article/index')
            ),
        );

        if (request()->action() == 'add' || request()->action() == 'index') {
            $menu_array[] = array(
                'name' => 'add',
                'text' => lang('ds_new'),
                'url' => url('Article/add')
            );
        }
        if (request()->action() == 'edit') {
            $menu_array[] = array(
                'name' => 'edit',
                'text' => lang('ds_edit'),
                'url' => 'javascript:void(0)'
            );
        }
        return $menu_array;
    }

}