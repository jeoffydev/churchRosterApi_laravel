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
                
                <h3>{{ __('Edit') }} {{ $data['organisation']->org_name }} </h3> 
                <form method="POST" action="{{ route('update.org') }}">
                    @csrf
                    <input type="hidden" value="{{ $data['organisation']->id }}" name="id" class="form-control" id="exampleFormControlInput1" >
                    <div class="form-group mb-1">
                        <label for="exampleFormControlInput1">{{ __('*Organisation (Church Name)') }}</label>
                        <input type="text" value="{{ $data['organisation']->org_name }}" name="org_name" class="form-control" id="exampleFormControlInput1" placeholder="Nations Church">
                        @error('org_name')
                            <span class="text-danger">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group mb-1">
                        <label for="exampleFormControlSelect1">{{ __('*Active') }}</label>
                        <select name="active" class="form-control" id="exampleFormControlSelect1">
                            <option @if( $data['organisation']->active === 0) {{ __('selected') }} @endif >0</option>
                            <option @if( $data['organisation']->active === 1) {{ __('selected') }} @endif>1</option>
                        </select>
                        @error('active')
                            <span class="text-danger">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group mb-1">
                        <label for="exampleFormControlInput1">{{ __('Location') }}</label>
                        <input name="location" value="{{ $data['organisation']->location}}" type="text" class="form-control" id="exampleFormControlInput1" placeholder="South Dunedin">
                                
                    </div>
                    <div class="form-group mb-1">
                        <label for="exampleFormControlTextarea1">{{ __('Description') }}</label>
                        <textarea name="description"  class="form-control" id="exampleFormControlTextarea1" rows="3">{{ $data['organisation']->description}}</textarea>
                    
                    </div>
                    <button type="submit" class="btn btn-primary">{{ __('Update Organisation') }}</button>
                </form>


            @endif
            
        </div>
        <div class="col-md-3">
           &nbsp;
        </div>
    </div>
@stop
