<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'sliders';

    protected $fillable = ['name', 'small_title', 'big_title', 'description', 'link', 'link_test', 'status'];

}
