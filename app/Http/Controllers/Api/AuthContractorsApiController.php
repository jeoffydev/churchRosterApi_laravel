<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers; 
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User; 
use Illuminate\Support\Facades\Hash; 


/**
 * @SWG\Get(
 *   path="/sample",
 *   summary="Sample",
 *   @SWG\Response(response=200, description="successful operation")
 * )
 *
 * Display a listing of the resource.
 *
 * @return \Illuminate\Http\Response
 */

class AuthContractorsApiController extends Controller
{ 
    /* Api user login */
    public function login(Request $request){
 
        if(!Auth::attempt($request->only('email', 'password'))){
            $wrongCreds = [
                'error'=> 'Wrong Credentials'
            ];  
            return \response([
                $wrongCreds
            ], Response::HTTP_UNAUTHORIZED);
        }  
         //If success get the token 
         $user = User::with('userOrganisation', 'userAccess')->find(Auth::id());
         $token = $user->createToken('token')->plainTextToken; 
         $cookie = cookie("jwt_churster", $token, 3600 * 24 * 365);
 
         $userDetails = [
            'jwt'=> $token,
            'userDetails' => $user, 
         ];
        return response()->json($userDetails)->withCookie($cookie);
        
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return "Users";
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
