@extends('layout.master')
@extends('layout.navigation')

@section('content')
    <div class="row">
        <div class="col-md-12 mt-3"> 
        <h5>{{ __('Organisation') }}</h5>

        </div>
    </div> 
    <div class="row mt-2">
        <div class="col-md-3">

            @if(Session::has('success'))
                <div class="alert alert-success text-center">
                    {{Session::get('success')}}
                </div>
            @endif    
           
            <form method="POST" action="{{ route('create.org') }}">
                @csrf
                <div class="form-group mb-1">
                    <label for="exampleFormControlInput1">{{ __('*Organisation (Church Name)') }}</label>
                    <input type="text" name="org_name" class="form-control" id="exampleFormControlInput1" placeholder="Nations Church">
                    @error('org_name')
                        <span class="text-danger">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group mb-1">
                    <label for="exampleFormControlSelect1">{{ __('*Active') }}</label>
                    <select name="active" class="form-control" id="exampleFormControlSelect1">
                        <option>0</option>
                        <option>1</option>
                    </select>
                    @error('active')
                        <span class="text-danger">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group mb-1">
                    <label for="exampleFormControlInput1">{{ __('Location') }}</label>
                    <input name="location" type="text" class="form-control" id="exampleFormControlInput1" placeholder="South Dunedin">
                             
                </div>
                <div class="form-group mb-1">
                    <label for="exampleFormControlTextarea1">{{ __('Description') }}</label>
                    <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                   
                </div>
                <button type="submit" class="btn btn-primary">{{ __('Create Organisation') }}</button>
            </form>
        </div>
        <div class="col-md-9">
            XXX
        </div>
    </div>
@stop
