@extends('layout.master')

@section('content')
    <div class="row">
        <div class="col-md-12"> 
            DASHBOARD! 

            @auth
                {{auth()->user()->name}}
                <div class="text-end">
                    <a href="{{ url('/logout') }}" class="btn btn-success me-2">Logout</a>
                </div>
            @endauth

        </div>
    </div> 
@stop
