<div class="container">
    <div class="row">
            <div class="col-md-12"> 

                <nav class="navbar p-2 navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="{{ url('/dashboard') }}">Navbar</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="{{ url('/dashboard') }}">{{ __('Home') }} </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('/organisation') }}">{{ __('Organisation') }}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('/contractors') }}">{{ __('Contractors') }}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('/logout') }}">{{ __('Logout') }}</a>
                            </li>
                        </ul>
                    </div>
                    <span class="navbar-text text-end">
                        @auth
                         {{ __('Owner') }} {{auth()->user()->name}}
                        @endauth
                    </span>
                </nav>
                @if(Session::has('success') || Session::has('failed'))
                    <div class="row mt-5">
                        <div class="col-md-12">
                            @if(Session::has('success'))
                                <div class="alert alert-success text-center">
                                    {{Session::get('success')}}
                                </div>
                            @endif  
                
                            @if(Session::has('failed'))
                                <div class="alert alert-danger text-center">
                                    {{Session::get('failed')}}
                                </div>
                            @endif  
                        </div> 
                    </div>
                @endif  
               

            </div>
    </div> 
</div>