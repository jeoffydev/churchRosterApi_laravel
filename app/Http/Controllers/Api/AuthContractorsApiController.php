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
use App\Http\GeneralStringOption;
use App\Models\UserAccess;

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
                'error'=> GeneralStringOption::getLoginUnauthorizedMessage()
            ];   
            return response()->json([$wrongCreds], Response::HTTP_UNAUTHORIZED);
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
        $usersOrg  = User::with('userOrganisation', 'userAccess')->whereHas('userOrganisation', function($u){
            $getOrg = CheckOrganisation::getUserOrganisationInfo(Auth::id());
            $u->where('org_id', $getOrg['userDetails']->userOrganisation[0]->org_id);
         })->get();
        return  $usersOrg; 
       
    }


    public function userDetails($id){ 
         $user = CheckOrganisation::getUserOrganisationInfo($id);  
        
         $userDetails = [ 
            'userDetails' => $user['userDetails'], 
            'userOrganisation' => $user['orgDetails'], 
         ];
        return response()->json($userDetails);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {

        if (User::where('email', '=', $request->email)->exists()) {
            $wrongCreds = [
                'error'=> GeneralStringOption::getEmailExistMessage($request->email)
            ];   
            return response()->json([$wrongCreds], Response::HTTP_UNAUTHORIZED);
        }

        $createUser = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        if($createUser){
            UserOrganisation::create([
                'user_id'=>$createUser->id,
                'org_id'=> $request->organisation_id
            ]);
            UserAccess::create([
                    'user_id'=> $createUser->id,
                    'access_level'=> CheckUserAccess::saveContractorAccess()
            ]);
        }

        $userCreated = [
            'success'=> GeneralStringOption::getSuccessCreated($request->email)
        ];  

        return response()->json($userCreated);
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
        $wrongCreds = [
            'error'=> GeneralStringOption::idNotExist()
        ];  
        $error = response()->json([$wrongCreds], Response::HTTP_UNAUTHORIZED);
        if($id){
            $user = User::where('id', $id)->exists();
            if($user){
                $userID = User::with('userOrganisation')->find($id); 
                $orgList = Organisation::all();
                $data = [
                    'userEdit'=>$userID,
                    'orgList'=>$orgList
                ];
                response()->json($data);
            } else {
                return $error;
            } 
        }  
        return $error;
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

    public function logout(){
        $cookie = \Cookie::forget('jwt');
        return \response([
            'success' => 'logout',
        ])->withCookie($cookie);
    }
}
