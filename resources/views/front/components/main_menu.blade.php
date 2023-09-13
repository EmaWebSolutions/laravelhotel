@section('main_menu')
    <!--TOP SECTION-->
    <div class="row" style="background-color: #E8C57A;">
    <div class="logo">
    <a style="color: white;">
        <img src="{{ asset('images/logo.png') }}" alt="Sofitel Philippine Plaza Hotel">
    </a>
</div>
        <div class="menu-bar">
            <ul>
                <li><a href="{{ url('/') }}">Home</a>
                </li>
                <li><a href="{{ url('/room_type') }}">Rooms</a>
                </li>
                @if(count(\App\Models\Page::where('title', 'About')->where('status', true)->get()) > 0)
                <li><a href="{{ url('/about') }}">About</a>
                </li>
                @endif
                 <li><a href="{{ url('/Blog') }}">blogs</a>
                </li>
                <li><a href="{{ url('/contact') }}">Contact Us</a>
                </li>


                @if (Auth::guest())
                    <li><a href="{{ route('register') }}">Register</a>
                    </li>
                    <li><a href="{{ route('login') }}">Login</a>
                    </li>
                @endif
            </ul>
        </div>
    </div>




    <div class="all-drop-down">
        <!-- Dropdown Structure -->
        <ul id='drop-home' class='dropdown-content drop-con-man'>
            <li><a href="main.html">Home - Default</a>
            </li>
            <li><a href="index-1.html">Home - Reservation</a>
            </li>
        </ul>
    </div>
    <!--TOP SECTION-->
@show