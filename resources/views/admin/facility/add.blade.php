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
                            <h4 class="title">Add Facility</h4>
                        </div>
                        <div class="content">
                           <form action="{{ url('admin/facility') }}" method="POST" id="facility-add-form">
    @csrf


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Facility Name<star>*</star></label>
                                        <input type="text" name="name" class="form-control border-input"
                                               placeholder="Ex: AC Night Bus" value="{{ old('name') }}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Icon</label>
                                        <select name="icon" id="icon" class="form-control">
                                            <option selected="" disabled="">- Select Travel Mode -</option>
                                            <option value="AIR"
                                                    @if (old('icon') == 'AIR ') selected="selected" @endif>
                                                AIR
                                            </option>
                                            <option value="DRIVING"
                                                    @if (old('icon') == 'DRIVING ') selected="selected" @endif>
                                                DRIVING
                                            </option>
                                            <option value="TRANSIT"
                                                    @if (old('icon') == 'TRANSIT') selected="selected" @endif>
                                                PUBLIC VEHICLE
                                            </option>
                                            <option value="BICYCLING"
                                                    @if (old('icon') == 'BICYCLING ') selected="selected" @endif>
                                                BICYCLING
                                            </option>
                                            <option value="WALKING"
                                                    @if (old('icon') == 'WALKING') selected="selected" @endif>
                                                WALKING
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" rows="5" class="form-control border-input"
                                                  placeholder="Ex: Comfortable while enjoying the view.">{{ old('description') }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="status" id="status" class="form-control">
                                            <option value="1"
                                                    @if (old('status') == '1') selected="selected" @endif>Active
                                            </option>
                                            <option value="0"
                                                    @if (old('status') == '0') selected="selected" @endif>
                                                Inactive
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-info btn-fill btn-wd">Add Facility
                                </button>
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
        // Init DatetimePicker
        demo.initFormExtendedDatetimepickers();
    </script>

    <script>
        $().ready(function () {

            var $validator = $("#facility-add-form").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 5,
                        maxlength: 50
                    },
                    description: {
                        maxlength: 200
                    },
                    gender: {
                        required: true
                    }
                }
            });
        });
    </script>
@endsection

