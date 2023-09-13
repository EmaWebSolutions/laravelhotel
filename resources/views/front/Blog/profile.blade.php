@extends('layouts.front')

@section('content')

   <div class="inn-body-section pad-bot-55">
        <div class="container">
            <div class="row">
           <div class="Blog">
    <div class="Blog-image">
        <img src="{{ asset('storage/blogs/' . $blog->image) }}" alt="{{ $blog->name }}" />
    </div>
    <div class="Blog-details">
        <h2>{{ $blog->name }}</h2>
        <p>{{ $blog->description }}</p>
    </div>

    
                            <!--Blog SHARE-->
                            <div class="Blog-share">
                                <ul>
                                    <li><a href="https://www.facebook.com/sharer.php?u={{ Request::url() }}" rel="me" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                                    </li>
                                    <li><a href="https://plus.google.com/share?url={{ Request::url() }}" rel="me" title="Google Plus" target="_blank"><i class="fa fa-google-plus"></i></a>
                                    </li>
                                    <li><a href="https://twitter.com/share?url={{ Request::url() }}&text={{ $blog->name }}" rel="me" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                                    </li>
                                    <li><a href="https://pinterest.com/pin/create/button/?url={{ Request::url() }}&media={{ $blog->image }}&description={{ $blog->name }}" rel="me" title="Pinterest" target="_blank"><i class="fa fa-pinterest"></i></a>
                                    </li>
                                </ul>
                            </div>
</div>


    </div>
</div>
</div>

@endsection

