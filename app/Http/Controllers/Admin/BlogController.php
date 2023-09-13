<?php

namespace App\Http\Controllers\Admin;

use App\Models\Blog;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as ImageManager;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class BlogController extends AdminController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs = Blog::all();
        return view('admin.blog.view')->with('blogs', $blogs);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.blog.add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required|unique:blogs,name',
            'image' => 'required|mimes:jpeg, jpg, png',
            'description' => 'required',
            'status' => 'required|boolean',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()
                ->withInput($request->all())
                ->withErrors($validator);
        }
        $blog = new Blog();
        $blog->name = $request->input('name');
        $blog->description = $request->input('description'); 
        $blog->status = $request->input('status');

    if ($request->hasFile('image')) {
    $path = $request->file('image')->store('blogs', 'public');
    $blog_image = \Intervention\Image\Facades\Image::make(storage_path('app/public/' . $path));
    $blog_image->fit(500, 450);
    $blog_image_name = uniqid() . '.' . $request->file('image')->getClientOriginalExtension();
    $blog_image->save(storage_path('app/public/blogs/' . $blog_image_name));
    $blog->image = $blog_image_name;
}

        $blog->save();

        Session::flash('flash_title', 'Success');
        Session::flash('flash_message', 'The Blog has been added successfully');
        return redirect('admin/blog');

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $Blog = Blog::find($id);
        return view('admin.Blog.edit')->with('Blog', $Blog);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $Blog = Blog::find($id);

        $rules = [
            'name' => 'required|unique:blogs,name,'.$id,
            'description' => 'required',
            'status' => 'required|boolean',
        ];

        if ($request->hasFile('image')) {
            $rules['image'] = 'mimes:jpeg,jpg,png';
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()
                ->withInput($request->all())
                ->withErrors($validator);
        }

        $Blog->name = $request->input('name');
        $Blog->description = $request->input('description');
        $Blog->status = $request->input('status');

        if ($request->hasFile('image')) {
            Storage::delete('public/blogs/'.$Blog->image);

            $path = $request->file('image')->store('', 'Blog');
            $Blog_image = ImageManager::make('storage/blog/' . $path);
            $Blog_image->fit(500, 450);
            $Blog_image->save(storage_path() . '/app/public/blog/' . $path);
            $Blog->image = $path;
        }

        $Blog->save();

        Session::flash('flash_title', 'Success');
        Session::flash('flash_message', 'The Blog has been updated successfully');
        return redirect('admin/Blog');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Blog = Blog::find($id);

        
        if($Blog){
            Storage::delete('public/blogs/'.$Blog->image);
            $Blog->delete();

            Session::flash('flash_title', 'Success');
            Session::flash('flash_message', 'Image has been deleted');
        }

        Session::flash('flash_title', 'Success');
        Session::flash('flash_message', 'The Blog has been deleted successfully');
        return redirect('admin/blog');

    }
}
