@extends("layout.main")

@section("content")

    <div class="col-sm-8 blog-main">
        <div class="blog-post">
            <div style="display:inline-flex">
                <h2 class="blog-post-title">{{$article->title}}</h2>
                @can('update', $article)
                <a style="margin: auto" href="/article/edit/{{$article->id}}">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </a>
                @endcan
                @if (Auth::user()->can('delete', $article))
                <a style="margin: auto" href="/article/delete/{{$article->id}}">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </a>
                @endif
            </div>

            <p class="blog-post-meta">{{$article->created_at->toFormattedDateString()}} by <a href="#">{{ $article->user->name }}</a></p>

            <p>{!! $article->content !!}</p>
            <div>
                @if($article->zan(\Auth::id())->exists())
                <a href="/article/unzan/{{$article->id}}" type="button" class="btn btn-default btn-lg">取消赞</a>
                @else
                <a href="/article/zan/{{$article->id}}" type="button" class="btn btn-primary btn-lg">赞</a>
                @endif
            </div>
        </div>

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">评论</div>

            <!-- List group -->
            <ul class="list-group">
                @foreach($article->comments as $comment)
                <li class="list-group-item">
                    <h5>{{$comment->created_at}} by {{$comment->user->name}}</h5>
                    <div>
                        {{$comment->content}}
                    </div>
                </li>
                @endforeach
            </ul>
        </div>

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">发表评论</div>

            <!-- List group -->
            <ul class="list-group">
                <form action="/article/comment/{{$article->id}}" method="post">
                    {{ csrf_field() }}
                    <input type="hidden" name="article_id" value="{{$article->id}}"/>
                    <li class="list-group-item">
                        <textarea name="content" class="form-control" rows="10"></textarea>
                        @include("layout.error")
                        <button class="btn btn-default" type="submit">提交</button>
                    </li>
                </form>
            </ul>
        </div>
    </div>
    
@endsection