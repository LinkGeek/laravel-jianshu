@extends("layout.main")

@section("content")

    <div class="alert alert-success" role="alert">
        下面是搜索"{{ $query }}"出现的文章，共{{ $articles->total() }}条
    </div>

    <div class="col-sm-8 blog-main">
        @foreach($articles as $article)
            <div class="blog-post">
                <h2 class="blog-post-title"><a href="/article/show/{{$article->id}}" >{{$article->title}}</a></h2>
                <p class="blog-post-meta">{{$article->created_at->toFormattedDateString()}} by <a href="/user/{{$article->user_id}}">{{ $article->user->name }}</a></p>

                {!! str_limit($article->content, 100, '...') !!}
                <p class="blog-post-meta">赞 {{$article->zans_count}}  | 评论 {{$article->comments_count}}</p>
            </div>
        @endforeach

        {{ $articles->links() }}
    </div>

@endsection