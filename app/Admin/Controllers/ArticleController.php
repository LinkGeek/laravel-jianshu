<?php

namespace App\Admin\Controllers;

use App\Article;

class ArticleController extends Controller
{
	public function index()
	{
		$articles = Article::withoutGlobalScope('avaliable')->where('status',0)->orderBy('created_at','desc')->paginate(8);
		return view('admin.article.index',compact('articles'));
	}


	public function status(Article $article)
	{
		$this->validate(request(),[
			'status' => 'required|in:-1,1',
		]);
		
		$article->status = request('status');
		$article->save();

		return [
			'error'=>0,
			'msg'=>''
		];
	}
}
	