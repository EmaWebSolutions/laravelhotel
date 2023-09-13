<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

      /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'images';

    protected $fillable = ['name', 'caption', 'is_primary', 'room_type_id'];

    /**
     * Get the gallery that owns the image.
     */
    public function room_type()
    {
        return $this->belongsTo('App\Models\RoomType');
    }
}
