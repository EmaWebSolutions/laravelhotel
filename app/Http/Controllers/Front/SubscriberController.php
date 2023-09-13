<?php

namespace App\Http\Controllers\Front;

use \MailchimpMarketing\ApiClient;
use App\Models\Subscriber;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class SubscriberController extends FrontController
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'email' => 'required|unique:subscribers,email',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()
                ->withInput($request->all())
                ->withErrors($validator);
        }
        $email = $request->input('email');
        $subscriber = new Subscriber();
        $subscriber->email = $email;
        $subscriber->save();

        

    $client = new ApiClient();
    $client->setConfig([
        'apiKey' => env('YOUR_API_KEY'),
        'server' => env('YOUR_SERVER_PREFIX')
    ]);

    $listId = env('YOUR_LIST_ID');

    $response = $client->lists->addListMember($listId, [
        'email_address' => $email,
        'status' => 'subscribed'
    ]);

       
      Session::flash('flash_title', 'Success');
      Session::flash('flash_message', 'You have subscribed to this website.');
        return redirect('/');

    }
}
