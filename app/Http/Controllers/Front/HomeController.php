<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Front\FrontController;
use App\Models\Blog;
use App\Models\Food;
use App\Models\Review;
use Illuminate\Http\Request;
use App\Models\Slider;
use App\Models\RoomType;

class HomeController extends FrontController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $slider_images = Slider::where('status', 1)->get();
        $room_types = RoomType::whereHas('images', function ($query){
           $query->where('is_primary', true);
        })->with([
            'images' => function($query){
            $query->where('is_primary', true)->where('status', true);
        },
            'rooms' => function($query){
                $query->where('status', true);
            }])
            ->where('status', 1)
            ->orderBy('id', 'asc')
            ->get();

        $blogs = Blog::where('status', 1)
            ->orderBy('created_at', 'desc')
            ->limit('4')
            ->get();

        $foods = Food::where('status', 1)->get();

        $reviews = Review::where('approval_status', "approved")
            ->orderBy('updated_at', 'desc')
            ->limit('4')
            ->get();

        return view('front.home')->with([
            'slider_images' => $slider_images,
            'room_types' => $room_types,
            'blogs' => $blogs,
            'foods' => $foods,
            'reviews' => $reviews,
        ]);
    }
}
