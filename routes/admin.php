<?php

Route::group(['prefix' => 'admin'], function() {

	// 登录
	Route::get('/login', '\App\Admin\Controllers\LoginController@index');
    Route::post('/login', '\App\Admin\Controllers\LoginController@login');
    Route::get('/logout', '\App\Admin\Controllers\LoginController@logout');


    Route::group(['middleware' => 'auth:admin'], function(){
    	Route::get('/home', '\App\Admin\Controllers\HomeController@index');

    	Route::group(['middleware'=>'can:systerm'], function(){
       
        	//管理人员 
        	Route::get('/users', '\App\Admin\Controllers\UserController@index');
        	Route::get('/users/create', '\App\Admin\Controllers\UserController@create');
        	Route::post('/users/store', '\App\Admin\Controllers\UserController@store');
        	Route::get('/users/{user}/role', '\App\Admin\Controllers\UserController@role');
            Route::post('/users/{user}/role', '\App\Admin\Controllers\UserController@storeRole');

            // 角色管理
            Route::get('/roles', '\App\Admin\Controllers\RoleController@index');
            Route::get('/roles/create', '\App\Admin\Controllers\RoleController@create');
            Route::post('/roles/store', '\App\Admin\Controllers\RoleController@store');
            Route::get('/roles/{role}/permission', '\App\Admin\Controllers\RoleController@permission');
            Route::post('/roles/{role}/permission', '\App\Admin\Controllers\RoleController@storePermission');

            // 权限管理
            Route::get('/permissions', '\App\Admin\Controllers\PermissionController@index');
            Route::get('/permissions/create', '\App\Admin\Controllers\PermissionController@create');
            Route::post('/permissions/store', '\App\Admin\Controllers\PermissionController@store');
        });

        Route::group(['middleware' => 'can:article'], function(){
            //文章管理
            Route::get('/article', '\App\Admin\Controllers\ArticleController@index');
            Route::post('/article/{article}/status', '\App\Admin\Controllers\ArticleController@status');
        });

        Route::group(['middleware' => 'can:topic'], function(){
            //专题管理
            Route::resource('topics','\App\Admin\Controllers\TopicController',['only'=>['index','create','store','destroy']]);
        });

        Route::group(['middleware' => 'can:notice'], function(){
            //专题管理
            Route::resource('notices','\App\Admin\Controllers\NoticeController',['only'=>['index','create','store','destroy']]);
        });
    });  
});