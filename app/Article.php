<?php

namespace App;

use App\Model;
//use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Builder;

class Article extends Model
{
    use Searchable;


    //protected $table = "articles";

    /**
     * 不能被批量赋值的属性
     * @var array
     */
    protected $guarded = [];

    /**
     * 可以被批量赋值的属性.
     * @var array
     */
    //protected $fillable = ['title','content'];


    /*
     * 搜索的type
     */
    public function searchableAs()
    {
        return 'article_index';
    }

    public function toSearchableArray()
    {
        return [
            'title' => $this->title,
            'content' => $this->content,
        ];
    }
    
    
    //关联用户
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    //评论模型  一对多
    public function comments()
    {
        return $this->hasMany('App\Comment')->orderBy('created_at','desc');
    }

    //点赞模型  一对一
    public function zan($user_id)
    {
        return $this->hasOne('App\Zan')->where('user_id',$user_id);
    }

    //赞数 一对多
    public function zans()
    {
        return $this->hasMany(\App\Zan::class);
    }

    public function articleTopics(){
        return $this->hasMany(\App\ArticleTopic::class,'article_id','id');
    }

    //属于某个作者文章
    public function scopeAuthorBy(Builder $query, $user_id){
        return $query->where('user_id', $user_id);
    }

    //不属于某个专题文章
    public function scopeTopicNotBy(Builder $query, $topic_id){
        return $query->doesntHave('articleTopics', 'and', function($q) use($topic_id) {
            $q->where('topic_id', $topic_id);
        });
    }

    // 匿名的全局作用域 scope
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope("avaliable", function(Builder $builder){
            $builder->whereIn('status',[0,1]);
        });
    }
}

