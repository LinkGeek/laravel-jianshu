<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    //个人设置
    public function setting()
    {
        return view('user.setting');
    }

    public function show(User $user)
    {
    	// 个人信息
    	$articles = $user->articles()->orderBy('created_at','desc')->take(10)->get();
        $user = User::withCount(['stars','fans','articles'])->find($user->id);
        $fans = $user->fans()->get();
        $stars = $user->stars()->get();

    	return view('user.show',compact('articles','user','fans','stars'));
    }

    // 关注用户
    public function fan(User $user)
    {
    	$me = \Auth::user();
        $me->doFan($user->id);

        return [
            'error' => 0,
            'msg' => 'ok'
        ];
    }

    // 取消关注
    public function unfan(User $user)
    {
    	$me = \Auth::user();
        $me->doUnFan($user->id);

        return [
            'error' => 0,
            'msg' => 'ok'
        ];
    }



}
