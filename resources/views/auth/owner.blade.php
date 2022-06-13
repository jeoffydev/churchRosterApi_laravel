@extends('layout.master')

@section('content')
    <div class="row">
        <main class="form-signin w-50 m-auto p-3 mt-5">
          

            <form method="POST" action="{{ route('login.submit') }}">
                @csrf
                
                <h1 class="h3 mb-3 fw-normal">{{ __('Churster Owner Login') }}</h1>
                @if ($errors->has('errorLogin'))
                    <span class="text-danger text-left">{{ $errors->first('errorLogin') }}</span>
                @endif

                <div class="form-floating m-1">
                    <input type="email" name="email" class="form-control" id="floatingInput" required placeholder="name@example.com">
                    <label for="floatingInput">{{ __('Email Address') }}</label>
                </div>
              
                <div class="form-floating m-1">
                    <input type="password" name="password" class="form-control" id="floatingPassword" required placeholder="Password">
                    <label for="floatingPassword">{{ __('Password') }}</label>
                </div>
             
                <button class="w-100 btn btn-lg btn-primary mt-2" type="submit">{{ __('Login') }}</button>
            </form>
        </main>
    </div>
@stop
