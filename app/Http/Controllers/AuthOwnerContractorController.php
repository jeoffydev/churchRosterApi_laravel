<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Organisation;
use App\Http\CheckUserAccess;
use Illuminate\Support\Facades\Hash;
use App\Models\UserOrganisation;
use App\Models\UserAccess;

class AuthOwnerContractorController extends Controller
{
    public function index(){

        //Remove jeoffy_hipolito@yahoo.com in the list
        //Get the user type as contractor only list
        $owner_email = CheckUserAccess::$Owner_email;
        //$usersList = User::where('email', '!=', $owner_email)->get();

        $usersList = User::with('userOrganisation', 'userAccess')->where('email', '!=', $owner_email)->get();

// echo "<pre>";
// print_r($usersList);
// echo "</pre>";
        $orgList = Organisation::all();
        $data = [
            'usersList'=>$usersList,
            'orgList' => $orgList
        ];
        return view('auth.contractor', ['data' => $data]);
    }

    public function doCreateUser(Request $request){

          // Form validation
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'organisation_id'=> 'required'
        ]); 

        if (User::where('email', '=', $request->email)->exists()) {
            return back()->with('failed', 'Email already exist!'); 
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

        return back()->with('success', 'New User has been created.'); 
       
    }

}
