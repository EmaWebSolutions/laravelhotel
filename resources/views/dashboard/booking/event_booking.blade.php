@extends('layouts.dashboard')

@section('content')

    <div class="db-cent-3">
        <div class="db-cent-table db-com-table">
            <div class="db-title">
                <h3><img src="{{ asset("front/images/icon/dbc5.png") }}" alt=""/> My Blog Bookings</h3>
                <p>View all of your Blog bookings here.</p>
            </div>
            <div class="db-title">
                @foreach ($errors->all() as $error)
                    <p style="color:red">{{ $error }}</p>
                @endforeach

                @if(Session::has('flash_message'))
                    <p style="color:forestgreen">{{ Session::get('flash_title') }}, {{ Session::get('flash_message') }}</p>
                @endif
            </div>
            <table class="bordered responsive-table">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Blog</th>
                    <th>Venue</th>
                    <th>Date</th>
                    <th>No of Tickets</th>
                    <th>Total Cost</th>
                    <th>Status</th>
                    <th>Payment</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @forelse($Blog_bookings as $index => $Blog_booking)
                <tr>
                    <td>{{ $index+1 }}</td>
                    <td>{{ $Blog_booking->Blog->name}}</td>
                    <td>{{ $Blog_booking->Blog->venue}}</td>
                    <td>{{ $Blog_booking->Blog->date}}</td>
                    <td>{{ $Blog_booking->number_of_tickets }}</td>
                    <td>Rs. {{ $Blog_booking->total_cost }}</td>
                    <td>
                        @if($Blog_booking->status == true)
                            <span class="db-success">Active</span>
                        @else
                            <span class="db-not-success">Cancelled</span>
                        @endif
                    </td>
                    <td>
                        @if($Blog_booking->payment == true)
                            <span class="db-success">Paid</span>
                        @else
                            <span class="db-not-success">Not Paid</span>
                        @endif
                    </td>
                    <td>
                        @if($Blog_booking->status == true)
                            <a href="{{url('dashboard/Blog/booking/'.$Blog_booking->id.'/cancel')}}"><span class="label label-danger">Cancel</span></a>
                        @endif
                    </td>

                </tr>
                    @empty
                    <tr>
                        <td>Sorry, no bookings found.</td>
                    </tr>
                @endforelse
                </tbody>
            </table>
        </div>
        {{ $Blog_bookings->links() }}
    </div>
@endsection
