<?php

namespace App;

use App\Model;
//use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $table = "topics";

    //属于这个专题的所有文章
    public function articles(){
    	return $this->belongsToMany(\App\Article::class, 'article_topics', 'topic_id','article_id');
    }

    //专题文章数
    public function articleTopics(){
    	return $this->hasMany(\App\ArticleTopic::class,'topic_id','id');
    }
}
