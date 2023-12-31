<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'first_name', 'last_name', 'password', 'gender', 'date_of_birth', 'email', 'address', 'avatar', 'about', 'facebook_id', 'twitter_id', 'google_id', 'status'
    ];


    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function room_bookings()
    {
        return $this->hasMany('App\Models\RoomBooking');
    }

    public function event_bookings()
    {
        return $this->hasMany('App\Models\EventBooking');
    }
}
