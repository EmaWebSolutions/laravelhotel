@extends('layouts.front')

@section('content')
    <div class="inn-body-section pad-bot-55">
        <div class="container">
            <div class="row blogs-list">
                <div class="page-head">
                    <h2>All Hotel blogs</h2>
                    <div class="head-title">
                        <div class="hl-1"></div>
                        <div class="hl-2"></div>
                        <div class="hl-3"></div>
                    </div>
                    <p>blogs being hosted in our hotel are listed below.</p>
                </div>
                <!--TYPOGRAPHY SECTION-->
                @if(count($blogs) > 0)
             
                    <div class="col-md-12">
                        
                        
                            @foreach($blogs as $Blog)
                            <!--Blog-->
                            <div class="head-typo typo-com">
                                <div class="row blog-item">
                                    <div class="col-md-4 blogimg"> <img src="{{ ('storage/blogs/'. $Blog->image) }}" alt="" /> </div>
                                    <div class="col-md-6 blogtext" style="margin-right: 20px;">
                                       <h3><a href="/Blog/{{ $Blog->id }}">{{ $Blog->name }}</a></h3>
                                        <p>{{ $Blog->description }}</p>
                                    </div>
                                </div>
                            </div>
                                <!--END Blog-->
                            @endforeach
                        
                    </div>
                @else

                    <h3>No blogs are currently being hosted in our hotel.</h3>
                @endif
                <!--END TYPOGRAPHY SECTION-->
            </div>
        </div>
    </div>
@endsection

