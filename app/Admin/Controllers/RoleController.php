<?php

namespace App\Admin\Controllers;

use App\AdminUser;
use App\AdminRole;

class RoleController extends Controller
{
	// 角色列表
	public function index()
	{
		$roles = AdminRole::paginate(10);
		return view('admin.role.index',compact('roles'));
	}

	//创建角色页面
	public function create()
	{	
		return view('admin.role.add');
	}

	//创建角色操作
	public function store()
	{
		$this->validate(request(), [
			'name' => 'required|min:2',
			'description' => 'required',
		]);

		AdminRole::create(request(['name','description']));

		return redirect('/admin/roles');
	}

	//角色与权限关系页面
	public function permission(\App\AdminRole $role)
	{
		// 获取所有权限
		$permissions = \App\AdminPermission::all();
		//获取当前角色权限
		$myPermissions = $role->permissions;

		return view('admin.role.permission',compact(['permissions','myPermissions','role']));
	}

	//储存角色权限操作
	public function storePermission(\App\AdminRole $role)
	{
		$this->validate(request(), [
			'permissions' => 'required|array'
		]);

		$permissions = \App\AdminPermission::findMany(request('permissions'));
		$myPermissions = $role->permissions;

		$addPermissions = $permissions->diff($myPermissions);
		foreach ($addPermissions as $permission) {
			$role->grantPermission($permission);
		}

		$delPermissions = $myPermissions->diff($permissions);
		foreach ($delPermissions as $permission) {
			$role->deletePermission($permission);
		}

		return back();
	}
}