<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Organisation;
use App\Http\CheckUserAccess;
use Illuminate\Support\Facades\Hash;
use App\Models\UserOrganisation;
use App\Models\UserAccess;
use App\Http\GeneralStringOption;

class AuthOwnerContractorController extends Controller
{
    public function index(){

        //Remove jeoffy_hipolito@yahoo.com in the list
        //Get the user type as contractor only list
        $owner_email = CheckUserAccess::$Owner_email; 

        $usersList = User::with('userOrganisation', 'userAccess')->where('email', '!=', $owner_email)->get();
 
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
            return back()->with('failed', GeneralStringOption::getEmailExistMessage("Email")); 
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

        return back()->with('success',  GeneralStringOption::getSuccessMessage("User")); 
    }

    public function edit($id)
    {
       if($id){
            $user = User::where('id', $id)->exists();
            if($user){
                $userID = User::with('userOrganisation')->find($id); 
                $orgList = Organisation::all();
                $data = [
                    'userEdit'=>$userID,
                    'orgList'=>$orgList
                ];
                return view('auth.contractor-edit', ['data'=>$data]);
            } 
       }  
       return back()->with('failed', GeneralStringOption::getExistMessage("User ID"));   
    }

    public function doUpdateUser(Request $request){
        // Form validation
        $this->validate($request, [
            'name' => 'required', 
            'password' => 'required',
            'organisation_id'=> 'required'
        ]); 

        $user = User::find($request->get('id'));
        // Getting values from the blade template form
        if($user){
            $user->name =  $request->get('name'); 
            $user->password = Hash::make($request->get('password'));
            $user->save(); 
            //Update org_id within the user_id
            UserOrganisation::where('user_id', $request->get('id'))->update(['org_id' => $request->organisation_id]);
        }
        return back()->with('success',  GeneralStringOption::getUpdateMessage("User")); 
    }

}
