<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Organisation;

class AuthOwnerContractorController extends Controller
{
    public function index(){

        //Remove jeoffy_hipolito@yahoo.com in the list
        //Get the user type as contractor only list
        $usersList = User::all();
        $orgList = Organisation::all();
        $data = [
            'usersList'=>$usersList,
            'orgList' => $orgList
        ];
        return view('auth.contractor', ['data' => $data]);
    }

    public function doCreateUser(Request $request){

         print_r($request);
         return back()->with('success', 'New Organisation has been created.');
       
    }

}
