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
            <div class="row">
                <div class="col-md-12">
                        @if(count($data['organisationsList']) > 0)
                            
                            <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">{{ __('Name') }}</th>
                                            <th scope="col">{{ __('Active') }}</th>
                                            <th scope="col">{{ __('Edit') }}</th>
                                            <th scope="col">{{ __('Delete') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($data['organisationsList'] as $org)
                                            <tr>
                                                <td>{{ $org->org_name }}</td>
                                                <td>@if( $org->active === 1) {{ __('Yes') }} @else {{ __('No') }} @endif </td>
                                                <td><a class="btn btn-info" href="{{ URL::to('organisation/' . $org->id) }}">{{ __('Edit') }}</a> </td>
                                                <td><a class="btn btn-danger" href="{{ URL::to('organisation/' . $org->id) }}">{{ __('Delete') }}</a> </td>
                                            </tr>  
                                        @endforeach
                                    </tbody>
                            </table>
                               
                        @else 
                            <span class="alert alert-warning">{{ __('0 Organisation') }}</span> 
                        @endif
                </div>
            </div>    
        </div>
    </div>
@stop
