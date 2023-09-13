<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'rooms';

    protected $fillable = ['room_number', 'description', 'available', 'status', 'room_type_id'];


    public function room_type()
    {
        return $this->belongsTo('App\Models\RoomType');
    }

    public function room_bookings()
    {
        return $this->hasMany('App\Models\RoomBooking');
    }

    public function reviews()
    {
        return $this->hasManyThrough('App\Models\Review', 'App\Models\RoomBooking');

    }
}
