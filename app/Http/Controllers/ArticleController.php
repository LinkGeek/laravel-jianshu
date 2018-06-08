<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Article;
use App\Comment;
use App\Zan;

class ArticleController extends Controller
{
    /**
     * 文章首页
     * @param comments 评论数
     * @param zans     点赞数
     */
    public function index()
    {
        // 
        $articles = Article::orderBy('id', 'desc')->withCount(['comments','zans'])->paginate(5);
        return view('article.index',compact('articles'));
    }

    /**
     * 添加文章视图
     */
    public function create()
    {
        return view('article.create');
    }

    // 上传文章图片 
    public function imageUpload(Request $request)
    {
        $path = $request->file('wangEditorH5File')->storePublicly(md5(\Auth::id() . time()));
        return asset('storage/'. $path);
    }

    /**
     * 保存文章逻辑
     */
    public function store()
    {
        //验证
        $this->validate(request(), [
            'title' => 'required|max:255|min:4',
            'content' => 'required|min:50',
        ]);
        $user_id = \Auth::id();
        $params = array_merge(request(['title','content']),compact('user_id'));
        $result = Article::create($params);
        return redirect('article/index');
    }

    /**
     * 详情页
     */
    public function show(Article $article)
    {
        $article->load('comments');
        return view('article.show', compact('article'));
    }

    /**
     * 编辑页面
     */
    public function edit(Article $article)
    {
        return view('article.edit',compact('article'));
    }

    /**
     * 修改保存
     */
    public function update(Article $article)
    {
        //验证
        $this->validate(request(), [
            'title' => 'required|max:255|min:4',
            'content' => 'required|min:50',
        ]);

        $this->authorize('update',$article);

        $article->title = request('title');
        $article->content = request('content');
        $article->save();

        return redirect("/article/show/{$article->id}");
    }

    /**
     * 删除
     */
    public function destroy(Article $article)
    {
        //权限
        $this->authorize('delete',$article);
        $article->delete();
        return redirect('article/index');
    }

    //评论
    public function comment(Article $article)
    {
        //验证
        $this->validate(request(), [
            'content' => 'required|min:5|max:100',
        ]);
        
        $comment = new Comment();
        $comment->user_id = \Auth::id();
        $comment->content = request('content');

        $article->comments()->save($comment);

        return back();
    }

    //点赞
    public function zan(Article $article)
    {
        $params = [
            'user_id' => \Auth::id(),
            'article_id' => $article->id
        ];

        Zan::firstOrCreate($params);
        return back();
    }

    /*
     * 取消点赞
     */
    public function unzan(Article $article)
    {
        $article->zan(\Auth::id())->delete();
        return back();
    }

    public function search()
    {
        $this->validate(request(), [
            'query' => 'required'
        ]);

        $query = request('query');
        $articles = Article::search(request('query'))->paginate(10);

        return view('article.search', compact('articles', 'query'));
    }
    
}
