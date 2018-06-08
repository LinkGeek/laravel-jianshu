<?php

namespace App;

use Illuminate\Database\Eloquent\Model as EloquentModel;


class Model extends EloquentModel
{
	/**
     * 不能被批量赋值的属性
     * @var array
     */
	protected $guarded = [];
}