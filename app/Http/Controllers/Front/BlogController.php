<?php

namespace App\Http\Controllers\Front;

use App\Models\Blog;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class BlogController extends FrontController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs = Blog::where('status', 1)
            ->orderBy('id', 'asc')
            ->get();
           

        return view('front.Blog.index')->with([
            'blogs' => $blogs
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
{
    $blog = Blog::where('status', 1)->findOrFail($id);
    return view('front.Blog.profile')
        ->with([
            'blog' => $blog,
        ]);
}

}
