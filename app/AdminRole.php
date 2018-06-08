<?php

namespace App;

use App\Model;

class AdminRole extends Model
{
    //
    protected $table = "admin_roles";

    /*
     * 当前角色的所有权限 多对多
     */
    public function permissions()
    {
        return $this->belongsToMany(\App\AdminPermission::class, 'admin_permission_role', 'permission_id', 'role_id')->withPivot(['permission_id', 'role_id']);
    }

    /*
     * 给角色授权
     */
    public function grantPermission($permission)
    {
        return $this->permissions()->save($permission);
    }

    /*
     * 取消role和permission的关联
     */
    public function deletePermission($permission)
    {
        return $this->permissions()->detach($permission);
    }

    /*
     * 判断角色是否有权限
     */
    public function hasPermission($permission)
    {
        return $this->permissions()->contains($permission);
    }
}
