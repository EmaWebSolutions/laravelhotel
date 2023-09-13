@extends('layouts.admin')
@section('style')
    @parent
@endsection
@section('content')
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Edit blog from Menu</h4>
                        </div>
                        <div class="content">
                           <form action="{{ url('admin/blog/'.$blog->id) }}" method="POST" id="blog-edit-form" enctype="multipart/form-data">
    @method('PUT')
    @csrf
    <!-- your form fields go here -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>blog Name<star>*</star></label>
                                        <input type="text" name="name" class="form-control border-input" value="{{ $blog->name }}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" align="center">
                                    <img height="450px" width="500px" src="{{'/storage/blogs/'.$blog->image}}"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input type="file" name="image" class="form-control border-input">
                                    </div>
                                </div>
                            </div>
                   
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" rows="5" class="form-control border-input"
                                                  placeholder="">{{ $blog->description }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="status" id="status" class="form-control">
                                            <option value="1"
                                                    @if ($blog->status == '1') selected="selected" @endif>Active
                                            </option>
                                            <option value="0"
                                                    @if ($blog->status == '0') selected="selected" @endif>
                                                Inactive
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-info btn-fill btn-wd">Update blog</button>
                            </div>
                            <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    @parent

    <!--  Forms Validations Plugin -->
    <script src="{{asset("backend/js/jquery.validate.min.js")}}"></script>

    <!--  Select Picker Plugin -->
    <script src="{{asset('backend/js/bootstrap-selectpicker.js')}}"></script>

    <!--  Plugin for Date Time Picker and Full Calendar Plugin-->
    <script src="{{asset("backend/js/moment.min.js")}}"></script>

    <!--  Date Time Picker Plugin is included in this js file -->
    <script src="{{asset('/backend/js/bootstrap-datetimepicker.js')}}"></script>


    <script>
        $().ready(function () {

            var $validator = $("#blog-edit-form").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 5,
                       
                    },
                    description: {
                      required: true,
                    }
                }
            });
        });
    </script>
@endsection

