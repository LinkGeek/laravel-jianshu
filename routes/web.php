<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'LoginController@index');

//注册
Route::get('/register', 'RegisterController@index');
Route::post('/register', 'RegisterController@register');

//登录
Route::get('/login', 'LoginController@index');
Route::post('/login', 'LoginController@login');
Route::get('/logout', 'LoginController@logout');

Route::group(['middleware' => 'auth:web'], function(){

	// 文章
	Route::group(['prefix' => 'article'], function(){

		Route::get('/index', 'ArticleController@index');
		Route::get('/create', 'ArticleController@create');
		Route::post('/store', 'ArticleController@store');
		Route::get('/show/{article}', 'ArticleController@show');
		Route::get('/edit/{article}', 'ArticleController@edit');
		Route::put('/{article}', 'ArticleController@update');
		Route::get('/delete/{article}', 'ArticleController@destroy');

		Route::post('/comment/{article}', 'ArticleController@comment');
		
		Route::get('/zan/{article}', 'ArticleController@zan');
		Route::get('/unzan/{article}', 'ArticleController@unzan');

		Route::get('/search', 'ArticleController@search');

		//图片上传
		Route::any('/img/upload', 'ArticleController@imageUpload');
		
	});

	// 个人主页
	Route::get('/user/me/setting', 'UserController@setting');
	Route::get('/user/{user}', 'UserController@show');
	Route::post('/user/{user}/fan', 'UserController@fan');
	Route::post('/user/{user}/unfan', 'UserController@unfan');

	// 专题
	Route::get('/topic/{topic}', 'TopicController@show');
	Route::post('/topic/{topic}/submit', 'TopicController@submit');

	// 通知
	Route::get('/notices', 'NoticeController@index');
	
});

include_once('admin.php');