<?php

namespace App\Admin\Controllers;


class LoginController extends Controller
{
	public function index()
	{
		return view('admin.login.index');
	}


	public function login()
	{
		$this->validate(request(), [
			'name' => 'required',
			'password' => 'required',
		]);
		$user = request(['name','password']);
		if(\Auth::guard("admin")->attempt($user)){
			return redirect('/admin/home');
		}

		return \Redirect::back()->withErrors("用户名和密码不匹配");
	}


	public function logout()
	{
		\Auth::guard("admin")->logout();
		return redirect('/admin/login');
	}
	
}