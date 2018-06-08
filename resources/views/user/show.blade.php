@extends("layout.main")

@section("content")

    <div class="col-sm-8">
        <blockquote>
            <p><img src="{{$user->avatar}}" alt="" class="img-rounded" style="border-radius:500px; height: 40px"> {{$user->name}}
            </p>

            <footer>关注：{{$user->stars_count}}｜粉丝：{{$user->fans_count}}｜文章：{{$user->articles_count}}</footer>
            
            @include('user.badges.like', ['target_user' => $user])
        </blockquote>
    </div>
    <div class="col-sm-8 blog-main">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">文章</a></li>
                <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">关注</a></li>
                <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">粉丝</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    @foreach($articles as $article)
                        <div class="blog-post" style="margin-top: 30px">
                            <?php \Carbon\Carbon::setLocale('zh');?>
                            <p><a href="/user/{{$article->user_id}}">{{$article->user->name}}</a> {{$article->created_at->diffForHumans()}}</p>
                            <p><a href="/article/show/{{$article->id}}" >{{$article->title}}</a></p>
                            <p>{!! str_limit($article->content, 100, '...') !!}</p>
                        </div>
                    @endforeach
                </div>
                <!-- /.tab-pane -->

                <div class="tab-pane" id="tab_2">
                    @foreach($stars as $star)
                        <?php $suser = $star->suser()->first(); ?>
                        <div class="blog-post" style="margin-top: 30px">
                            <p class="">{{$suser->name}}</p>
                            <p class="">关注：{{$suser->stars()->count()}} | 粉丝：{{$suser->fans()->count()}}｜ 文章：{{$suser->articles()->count()}}</p>

                            @include('user.badges.like', ['target_user' => $suser])
                        </div>
                    @endforeach
                </div>
                <!-- /.tab-pane -->

                <div class="tab-pane" id="tab_3">
                    @foreach($fans as $fan)
                        <?php $fuser = $fan->fuser()->first(); ?>
                        <div class="blog-post" style="margin-top: 30px">
                            <p class="">{{$fuser->name}}</p>
                            <p class="">关注：{{$fuser->stars()->count()}} | 粉丝：{{$fuser->fans()->count()}}｜ 文章：{{$fuser->articles()->count()}}</p>

                        @include('user.badges.like', ['target_user' => $fuser])
                        </div>
                    @endforeach
                </div>
                <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
        </div>
    </div><!-- /.blog-main -->

@endsection