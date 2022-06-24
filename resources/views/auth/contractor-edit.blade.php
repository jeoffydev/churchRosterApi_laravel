@extends('layout.master')
@extends('layout.navigation')

@section('content')
    <div class="row">
        <div class="col-md-12 mt-3"> 
        <h5>{{ __('Edit Contractor') }}</h5>

        </div>
    </div> 
    <div class="row mt-2">
        <div class="col-md-3">
           &nbsp;
        </div>
        <div class="col-md-6 alert alert-secondary">

            @if(Session::has('success'))
                <div class="alert alert-success text-center">
                    {{Session::get('success')}}
                </div>
            @endif    

            @if($data['userEdit'])
                <h3>{{ __('Edit') }} {{ $data['userEdit']->name }} </h3> 

                <form method="POST" action="{{ route('update.user') }}">
                    @csrf
                    <input type="hidden" value="{{ $data['userEdit']->id }}" name="id" class="form-control" id="exampleFormControlInput1" >
                    <div class="form-group mb-1">
                        <label for="exampleFormControlInput1">{{ __('*Full Name') }}</label>
                        <input type="text" value="{{ $data['userEdit']->name }}" name="name" class="form-control" id="exampleFormControlInput1" placeholder="Full Name">
                        @error('name')
                            <span class="text-danger">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div> 
                    <div class="form-group mb-1">
                        <label for="exampleFormControlInput1">{{ __('Password') }}</label>
                        <input name="password"   type="text" class="form-control" id="exampleFormControlInput1" placeholder="Password">
                        @error('password')
                            <span class="text-danger">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror        
                    </div>
                    <div class="form-group mb-1">
                        <label for="exampleFormControlSelect1">{{ __('*Select Organisation | Active') }}</label>
                        @if(count($data['orgList']) > 0)
                            <select name="organisation_id" class="form-control" id="exampleFormControlSelect1">
                                @foreach($data['orgList'] as $org)
                                        <option value="{{ $org->id }}" @if( $data['userEdit']['userOrganisation'][0]->org_id == $org->id ) selected @endif >{{ $org->org_name }} | @if($org->active == 1) {{ __('Yes')  }} @else {{ __('No')  }}  @endif </li>   
                                @endforeach
                            </select>
                        @else 
                            {{ __('No organisation stored!') }}
                        @endif
                        
                        
                        @error('active')
                            <span class="text-danger">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                     
                    <button type="submit" class="btn btn-primary">{{ __('Update User') }}</button>
                </form>


            @endif
            
        </div>
        <div class="col-md-3">
           &nbsp;
        </div>
    </div>
@stop
