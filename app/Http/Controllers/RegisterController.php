<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class RegisterController extends Controller
{
    /**
     * 注册页
     */
    public function index()
    {
        return view('register.index');
    }

    /**
     * 注册逻辑
     */
    public function register()
    {
        //验证
        $this->validate(request(), [
            'name' => 'required|max:12|unique:users,name',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:3|max:20|confirmed',
        ]);

        $name = request('name');
        $email = request('email');
        $password = bcrypt(request('password'));
        $result = User::create(compact('name','email','password'));
        
        return redirect('login');
    }


}
