<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers; 
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User; 
use App\Models\UserOrganisation; 
use Illuminate\Support\Facades\Hash; 
use App\Http\CheckUserAccess;
use App\Http\CheckOrganisation;

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
         $user = CheckOrganisation::getUserOrganisationInfo(Auth::id());
      
        //use dd($user['userOrganisation']); to view 
         $token = $user['userDetails']->createToken('token')->plainTextToken; 
         $cookie = cookie("jwt_churster", $token, 3600 * 24 * 365); 
        
         $userDetails = [
            'jwt'=> $token,
            'userDetails' => $user['userDetails'], 
            'userOrganisation' => $user['orgDetails'], 
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
        //get users only with the same organisation as the contractor's logged in
        $getOrg = CheckOrganisation::getUserOrganisationInfo(Auth::id());
        $usersOrg = User::with('userOrganisation', 'userAccess')->whereHas('userOrganisation', function($u){
            $u->where('org_id', 1);
         })->get();
        return  $usersOrg; 
       
    }

    public function logout(){
        $cookie = \Cookie::forget('jwt');
        return \response([
            'success' => 'logout',
        ])->withCookie($cookie);
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
