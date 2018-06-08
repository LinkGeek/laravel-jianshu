<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LoginController extends Controller
{
    /**
     * 登录页
     */
    public function index()
    {
        return view('login.index');
    }

    /**
     * 登录逻辑
     */
    public function login()
    {
        $this->validate(request(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = request(['email','password']);
        $is_remember =boolval(request('is_remember'));

        if(\Auth::attempt($user, $is_remember)){
            return redirect('article/index');
        }

        return \Redirect::back()->withErrors('邮箱密码不匹配');
    }

    /**
     * 退出
     */
    public function logout()
    {
        \Auth::logout();
        return redirect('/login');
    }
}
