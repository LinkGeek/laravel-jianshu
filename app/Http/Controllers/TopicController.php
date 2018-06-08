<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Topic;
use App\ArticleTopic;

class TopicController extends Controller
{
    //
    public function show(Topic $topic){
    	// 带文章数专题
    	$topic = Topic::withCount('articleTopics')->find($topic->id);
    	//专题文章列表
    	$articles = $topic->articles()->orderBy('created_at','desc')->take(10)->get();
    	//属于我的但未投稿文章
    	$myarticles = \App\Article::authorBy(\Auth::id())->topicNotBy($topic->id)->get();

    	return view('topic.show', compact('topic', 'articles','myarticles'));
    }

    public function submit(Topic $topic){
    	$this->validate(request(), [
    		'article_ids' => 'required|array'
		]);

		$article_ids = request('article_ids');
		$topic_id = $topic->id;

		foreach ($article_ids as $k => $article_id) {
			\App\ArticleTopic::firstOrCreate(compact('topic_id','article_id'));
		}
    	
    	return back();
    }
}
