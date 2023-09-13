<?php

return [

    /*
    |--------------------------------------------------------------------------
    | View Storage Paths
    |--------------------------------------------------------------------------
    |
    | Most templating systems load templates from disk. Here you may specify
    | an array of paths that should be checked for your views. Of course
    | the usual Laravel view path has already been registered for you.
    |
    */

    'admin' => [
        'booking' => [
            'name' =>  'Booking',
            'actions' => [
                'room_booking' => 'admin/room_booking',
               
            ],
            'icon' => 'ti-control-forward'
        ],
   
        'room_type' => [
            'name' => 'Room Type',
            'actions' => [
                'view' => 'admin/room_type',
                'add' => 'admin/room_type/create',
            ],
            'icon' => 'ti-home'
        ],
  
        'facility' => [
            'name' => 'Facility',
            'actions' => [
                'view' => 'admin/facility',
                'add' => 'admin/facility/create'
                
            ],
            'icon' => 'ti-crown'
        ],
        'user' => [
            'name' => 'User',
            'actions' => [
                'view' => 'admin/user',
                'add' => 'admin/user/create',
            ],
            'icon' => 'ti-user'
        ],
        'slider' => [
            'name' => 'Slider',
            'actions' => [
                'view' => 'admin/slider',
                 'add' => 'admin/slider/create'
            ],
            'icon' => 'ti-layout-grid2'
        ],
        'blog' => [
            'name' => 'Blog',
            'actions' => [
                'view' => 'admin/blog',
                'add'=>'admin/blog/create'

            ],
            'icon' => 'ti-ticket'
        ],
        'Review' => [
            'name' => 'Review',
            'actions' => [
                'view' => 'admin/review',
            ],
            'icon' => 'ti-star'
        ],
    
    ],

];
