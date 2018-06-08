<?php

namespace App\Admin\Controllers;

use App\AdminUser;
use App\AdminRole;

class UserController extends Controller
{
	// 用户列表
	public function index()
	{
		$users = AdminUser::paginate(10);

		return view('/admin/user/index', compact('users'));
	}

	//添加页面
	public function create()
	{
		return view('/admin/user/add');
	}

	//添加操作
	public function store()
	{
		$this->validate(request(), [
			'name' => 'required|min:2',
			'password' => 'required',
		]);

		$name = request('name');
		$password = bcrypt(request('password'));

		AdminUser::create(compact('name','password'));
		return redirect('/admin/users');
	}

	// 用户角色页面
	public function role(\App\AdminUser $user)
	{
		$roles = AdminRole::all();
		$myRoles = $user->roles;
		
		return view('/admin/user/role',compact('roles','myRoles','user'));
	}

	public function storeRole(\App\AdminUser $user)
	{
		$this->validate(request(), [
			'roles' => 'required|array',
		]);

		$roles = AdminRole::findMany(request('roles'));
		$myroles = $user->roles;

		// 删除的
		$delRoles = $myroles->diff($roles);
		foreach ($delRoles as $role) {
			$user->deleteRole($role);
		}

		// 添加的
		$addRoles = $roles->diff($myroles);
		foreach ($addRoles as $role) {
			$user->assignRole($role);
		}

		return back();
	}

}