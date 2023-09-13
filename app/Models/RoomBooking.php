<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomBooking extends Model
{
    use HasFactory;
     /**
 * The table associated with the model.
 *
 * @var string
 */
    protected $table = 'room_bookings';

    protected $fillable = ['arrival_date', 'departure_date', 'room_cost', 'status', 'payment', 'room_id', 'user_id'];

    /**
     * Get the gallery that owns the image.
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function room()
    {
        return $this->belongsTo('App\Models\Room');
    }

    public function review()
    {
        return $this->hasOne('App\Models\Review');
    }
}
