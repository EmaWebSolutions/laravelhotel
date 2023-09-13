@extends('layouts.front')

@section('content')
    <!--Check Availability SECTION-->
    <div>
        <div class="slider fullscreen">
            <ul class="slides">
                @forelse($slider_images as $image)
                <li> <img src="{{'/storage/slider/'.$image->name}}" alt="">
                    <!-- random image -->
                    <div class="caption center-align slid-cap">
                        <h5 class="light grey-text text-lighten-3">{{ $image->small_title }}</h5>
                        <h2>{{ $image->big_title }}</h2>
                        <p>{{ $image->description }}</p>
                        <a href="{{ $image->link }}" class="waves-effect waves-light">{{ $image->link_text }}</a></div>
                </li>
                    @empty
                    <li> <img src="{{ asset("front/images/slider/1.jpg") }}" alt="">
                    <!-- random image -->
                    <div class="caption center-align slid-cap">
                        <h5 class="light grey-text text-lighten-3">Experience Comfort and Elegance at Its Best.</h5>
                        <h2>Discover Our Luxurious Hotel</h2>
                        <p>Our rooms are cozy and comfortable, and we offer excellent amenities. You can make a reservation by clicking on the "Booking" button</p> <a href="#" class="waves-effect waves-light">Booking</a></div>
                </li>
                    @endforelse
            </ul>
        </div>
    </div>
    <!--End Check Availability SECTION-->
    <!--HOTEL ROOMS SECTION-->

    @if(count($room_types) > 0)
    <div class="hom1 hom-com pad-bot-40">
        <div class="container">
            <div class="row">
                <div class="hom1-title">
                    <h2>Our Hotel Rooms</h2>
                    <div class="head-title">
                        <div class="hl-1"></div>
                        <div class="hl-2"></div>
                        <div class="hl-3"></div>
                    </div>
                    <p>Every hotel stay provides you with great experience and hospitality.</p>
                </div>
            </div>
            <div class="row">
                <div class="to-ho-hotel">
                    @foreach($room_types as $room_type)
                    <!-- HOTEL GRID -->
                    <div class="col-md-4">
                        <div class="to-ho-hotel-con">
                            <div class="to-ho-hotel-con-1">
                                <div class="hom-hot-av-tic"> Available Rooms: {{ count($room_type->rooms) }} </div> <img src="{{'/storage/room_types/'.$room_type->images->first()->name}}" alt=""> </div>
                            <div class="to-ho-hotel-con-23">
                                <div class="to-ho-hotel-con-2"> <a href="{{url('/room_type/'.$room_type->id)}}"><h4>{{ $room_type->name }}</h4></a> </div>
                                <div class="to-ho-hotel-con-3">
                                    <ul>
                                        <li>
                                            <div class="dir-rat-star ho-hot-rat-star"> Rating: <i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i> </div>
                                        </li>
                                        <li>
                                            @if($room_type->cost_per_day !== $room_type->discountedPrice)
                                            <span class="ho-hot-pri-dis">{{ config('app.currency').$room_type->cost_per_day }}</span>
                                            @endif
                                            <span class="ho-hot-pri">{{ config('app.currency').$room_type->discountedPrice}}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    @endif

    <div class="blog hom-com pad-bot-0">
        <div class="container">
            <div class="row">
                <div class="hom1-title">
                    <h2>Photo Gallery</h2>
                    <div class="head-title">
                        <div class="hl-1"></div>
                        <div class="hl-2"></div>
                        <div class="hl-3"></div>
                    </div>
                    <p>View photos of hotel rooms</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="inn-services head-typo typo-com mar-bot-0">
                       
                        <div id="portfoliolist">
                            <!-- Room Types -->
                            @foreach($room_types as $room_type)
                                <div class="portfolio room" data-cat="room">
                                    <div class="portfolio-wrapper"> <img src="{{ asset('storage/room_types/'.$room_type->images->last()->name) }}" alt="" />
                                        <div class="label">
                                            <div class="label-text"> <a class="text-title">{{ $room_type->name }}</a></div>
                                            <div class="label-bg"></div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--END HOTEL ROOMS-->
     <div class="blog hom-com pad-bot-0">
        <div class="container">
            <div class="row">
        <div class="hom1-title">
  <h2>Latest Reviews</h2>
  <div class="hom1-title">
    <ul class="reviews-list">
      @if(count($reviews) > 0)
        @foreach($reviews as $review)
          <li>
            <a href="#!">
              <img src="{{'/storage/avatars/'.$review->room_booking->user->avatar}}" alt="">
              <h5>{{ $review->room_booking->user->first_name }}@if($review->rating > 0), {{ $review->rating }} <i class="fa fa-star" aria-hidden="true"></i>@endif</h5>
              <span>{{ \Carbon\Carbon::parse($review->updated_at)->diffForHumans() }}</span>
              <p>{{ $review->review }}</p>
            </a>
          </li>
        @endforeach
      @endif
    </ul>
  </div>
</div>

           
        </div>
    </div>
</div>


 @if(count($blogs) > 0)
    <div class="blog hom-com pad-bot-0">
        <div class="container">
            <div class="row">
                <div class="hom1-title">
                    <h2>Blogs</h2>
                    <div class="head-title">
                        <div class="hl-1"></div>
                        <div class="hl-2"></div>
                        <div class="hl-3"></div>
                    </div>
                  
                </div>
            </div>
         <div class="row-with-margin">
  <div class="blog-container">
    @foreach($blogs as $Blog)
      <div class="colorblog">
        <!-- Blog Image -->
        <div class="blog-image">
          <img src="{{'/storage/blogs/'.$Blog->image}}" alt="">
        </div>
        
        <!-- Blog Details -->
        <div class="blog-details">
          <a href="{{ url('/Blog/'.$Blog->id) }}"><h4>{{ $Blog->name }}</h4></a> 
          <p>{{ \Illuminate\Support\Str::limit($Blog->description, 100, '...') }}</p>
        </div>
      </div>
    @endforeach
  </div>
</div>

        </div>
    </div>
    @endif
    
    
@endsection
