<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;
use App\AdminPermission;

class PermissionController extends Controller
{
    /*
     * 权限列表
     */
    public function index()
	{
		$permissions = AdminPermission::paginate(10);
		return view('admin.permission.index',compact('permissions'));
	}

	public function create()
	{		
		return view('admin.permission.add');
	}


	public function store()
	{
		$this->validate(request(), [
			'name' => 'required|min:2|unique:admin_permissions,name',
			'description' => 'required',
		]);

		AdminPermission::create(request(['name','description']));
		return redirect('/admin/permissions');
	}
}
