<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

// Authentication Routes
Auth::routes();

// Social Logins
Route::get('social/auth/redirect/{provider}', 'Auth\AuthController@redirectToProvider');
Route::get('social/auth/{provider}', 'Auth\AuthController@handleProviderCallback');


// Routes for Front
Route::get('/', 'Front\HomeController@index')->name('home');
Route::get('/contact', 'Front\PageController@contact');
Route::get('/about', 'Front\PageController@about');
Route::post('/subscribe', 'Front\SubscriberController@store');
Route::get('/room_type', 'Front\RoomTypeController@index');
Route::get('/room_type/{id}', 'Front\RoomTypeController@show');
Route::get('/food', 'Front\FoodController@index');
Route::get('/food/{id}', 'Front\FoodController@show');
Route::get('/Blog', 'Front\BlogController@index');
Route::get('/Blog/{id}', 'Front\BlogController@show');
Route::post('/room_type/{id}/book', 'Front\RoomBookingController@book');


// Dashboard Routes
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', 'Dashboard\HomeController@index')->name('dashboard');
    Route::get('/dashboard/room/booking', 'Dashboard\RoomBookingController@index');
  
    Route::get('/dashboard/room/booking/{id}/cancel', 'Dashboard\RoomBookingController@cancel');
 

    Route::get('/dashboard/profile', 'Dashboard\UserController@edit_profile');
    Route::put('/dashboard/profile', 'Dashboard\UserController@update_profile');
    Route::get('/dashboard/setting', 'Dashboard\UserController@setting');
    Route::put('/dashboard/setting', 'Dashboard\UserController@update_setting');
    Route::get('/dashboard/room/booking/{id}/review', 'Dashboard\ReviewController@create');
    Route::post('/dashboard/room/booking/{id}/review', 'Dashboard\ReviewController@store');
});

// Routes for Admin
Route::middleware(['admin'])->prefix('admin')->group(function (){
    Route::get('/', 'Admin\HomeController@index');
   
    Route::resource('slider', 'Admin\SliderController');
    Route::resource('facility', 'Admin\FacilityController');
    Route::resource('blog', 'Admin\BlogController');
    Route::resource('food', 'Admin\FoodController');
    Route::get('page', 'Admin\PageController@index');
    Route::get('page/{id}/edit', 'Admin\PageController@edit');
    Route::put('page/{id}', 'Admin\PageController@update');

     // User Routes
    Route::resource('user', 'Admin\UserController');
    Route::get('user/{id}/profile', 'Admin\UserController@profile');
    Route::put('user/{id}/profile', 'Admin\UserController@update_profile');
    Route::get('user/{id}/setting', 'Admin\UserController@setting');
    Route::put('user/{id}/setting', 'Admin\UserController@update_setting');


    //Routes for RoomBookings
    Route::get('/room_booking', 'Admin\RoomBookingController@index');
    Route::get('/room_booking/{id}/edit', 'Admin\RoomBookingController@edit')->name('room_booking.edit');
    Route::put('/room_booking/{id}/update', 'Admin\RoomBookingController@update')->name('room_booking.update');
     Route::put('/room_booking/{id}/destroy', 'Admin\RoomBookingController@destroy')->name('room_booking.destroy');




    Route::get('/review', 'Admin\ReviewController@index');
    Route::get('/review/{id}/approve', 'Admin\ReviewController@approve');
    Route::get('/review/{id}/reject', 'Admin\ReviewController@reject');

    Route::resource('room_type', 'Admin\RoomTypeController');
    // Route for room types
    Route::group(['prefix' => 'room_type', 'middleware' => 'auth'], function(){
        // Rutes for Room Type Images
        Route::get('/{id}/image', 'Admin\ImageController@index');
        Route::get('/{id}/image/create', 'Admin\ImageController@create');
        Route::post('/{id}/image', 'Admin\ImageController@store');
        Route::get('/{id}/image/{image_id}/edit', 'Admin\ImageController@edit');
        Route::put('/{id}/image/{image_id}/edit', 'Admin\ImageController@update');
        Route::get('/{id}/image/create_multiple', 'Admin\ImageController@create_multiple');
        Route::post('/{id}/image/create_multiple', 'Admin\ImageController@store_multiple');
        Route::delete('/{id}/image/{image_id}', 'Admin\ImageController@destroy');

        // Routes for Rooms
        Route::get('/{id}/room', 'Admin\RoomController@index');
        Route::get('/{id}/room/create', 'Admin\RoomController@create');
        Route::post('/{id}/room', 'Admin\RoomController@store');
        Route::get('/{id}/room/{room_id}/edit', 'Admin\RoomController@edit');
        Route::put('/{id}/room/{room_id}/edit', 'Admin\RoomController@update');
        Route::delete('/{id}/room/{image_id}', 'Admin\RoomController@destroy');

    });
});

