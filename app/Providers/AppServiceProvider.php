<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //改变数据默认长度
        Schema::defaultStringLength(191); // 767/4=191.xxx

        // 视图合成器
        \View::composer('layout.nav', function($view){
            $user = \Auth::user();
            $view->with('user', $user);
        });

        \View::composer('layout.sidebar', function($view){
            $topics = \App\Topic::all();
            $view->with('topics', $topics);
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
