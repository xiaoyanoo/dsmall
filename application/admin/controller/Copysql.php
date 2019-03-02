<?php

namespace app\admin\controller;

class Copysql extends AdminControl {

    public function _initialize() {
        parent::_initialize();
    }

    public function index() {

        return $this->fetch();
    }



}
