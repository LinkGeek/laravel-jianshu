<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    // 用户文章列表
    public function articles()
    {
        return $this->hasMany(\App\Article::class, 'user_id', 'id');
    }

    // 关注我的
    public function fans()
    {
        return $this->hasMany(\App\Fan::class,'star_id', 'id');
    }

    // 我关注的
    public function stars()
    {
        return $this->hasMany(\App\Fan::class,'fan_id', 'id');
    }

    // 去关注某人
    public function doFan($uid)
    {
        $fan = new \App\Fan();
        $fan->star_id = $uid;
        return $this->stars()->save($fan);
    }

    // 取消关注
    public function doUnFan($uid)
    {
        $fan = new \App\Fan();
        $fan->star_id = $uid;
        return $this->stars()->delete($fan);
    }

    /*
     * 当前用户是否被uid粉了
     */
    public function hasFan($uid)
    {
        return $this->fans()->where('fan_id', $uid)->count();
    }

    /*
     * 当前用户是否关注了uid
     */
    public function hasStar($uid)
    {
        return $this->stars()->where('star_id', $uid)->count();
    }

    /*
     * 用户收到的通知
     */
    public function notices()
    {
        return $this->belongsToMany(\App\Notice::class, 'user_notice', 'user_id', 'notice_id')->withPivot(['user_id', 'notice_id']);
    }

    /*
     * 增加通知
     */
    public function addNotice($notice)
    {
        return $this->notices()->save($notice);
    }

    /*
     * 减少通知
     */
    public function deleteNotice($notice)
    {
        return $this->notices()->detach($notice);
    }
    
}
