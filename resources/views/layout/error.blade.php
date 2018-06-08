@if(count($errors))
    <div class="xuan alert alert-danger" role="alert">
        @foreach($errors->all() as $error)
            <li>{{$error}}</li>
        @endforeach
    </div>
@endif