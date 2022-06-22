@extends('layout.master')
@extends('layout.navigation')
@inject('getOrg', 'App\Http\CheckOrganisation')

@section('content')
    <div class="row">
        <div class="col-md-12 mt-3"> 
        <h5>{{ __('Create Contractors') }}</h5>
        <p><small>{{ __('Note: contractors can login as members too') }}</small></p>

        </div>
    </div> 
    <div class="row mt-2">
        <div class="col-md-3">

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
           
            <form method="POST" action="{{ route('create.user') }}">
                @csrf
                <div class="form-group mb-1">
                    <label for="exampleFormControlInput1">{{ __('*Full Name') }}</label>
                    <input type="text" name="name" class="form-control" placeholder="Jeoffy Hipolito">
                    @error('name')
                        <span class="text-danger">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group mb-1">
                    <label for="exampleFormControlInput1">{{ __('*Email Address') }}</label>
                    <input type="email" name="email" class="form-control"  placeholder="email@example.com">
                    @error('email')
                        <span class="text-danger">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group mb-1">
                    <label for="exampleFormControlInput1">{{ __('*Password') }}</label>
                    <input type="text" name="password" class="form-control"  placeholder="password">
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
                                    <option value="{{ $org->id }}">{{ $org->org_name }} | @if($org->active == 1) {{ __('Yes')  }} @else {{ __('No')  }}  @endif </li>   
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
                <button type="submit" class="btn btn-primary">{{ __('Create User') }}</button>
            </form>
           
        </div>
        <div class="col-md-9">

                        @if(count($data['usersList']) > 0) 
                            <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">{{ __('Name') }}</th>
                                            <th scope="col">{{ __('Email') }}</th>
                                            <th scope="col">{{ __('Organisation') }}</th>
                                            <th scope="col">{{ __('Edit') }}</th>
                                            <th scope="col">{{ __('Delete') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($data['usersList'] as $user)
                                            <tr>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td>{{ $user['userOrganisation'][0]->org_id }} | {{ $getOrg::getOrganisationName($user['userOrganisation'][0]->org_id ) }}</td>
                                                <td><a class="btn btn-info" href="{{ URL::to('user/' . $user->id) }}">{{ __('Edit') }}</a> </td>
                                                <td><a class="btn btn-danger" href="{{ URL::to('user/delete/' . $user->id) }}" onclick="return confirm('Are you sure you want to delete this organisation?');">{{ __('Delete') }}</a> </td>
                                            </tr>  
                                        @endforeach
                                    </tbody>
                            </table>
                               
                        @else 
                            <span class="alert alert-warning">{{ __('0 Organisation') }}</span> 
                        @endif

        </div>
    </div>
@stop
