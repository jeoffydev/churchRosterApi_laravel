@extends('layout.master')
@extends('layout.navigation')

@section('content')
    <div class="row">
        <div class="col-md-12 mt-3"> 
        <h5>{{ __('Edit Organisation') }}</h5>

        </div>
    </div> 
    <div class="row mt-2">
        <div class="col-md-3">
           &nbsp;
        </div>
        <div class="col-md-6 alert alert-secondary">

            @if($data['organisation'])
                {{ $data['organisation']->org_name }}
            @endif
            
        </div>
        <div class="col-md-3">
           &nbsp;
        </div>
    </div>
@stop
