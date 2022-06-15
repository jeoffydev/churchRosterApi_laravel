<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use Session;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\CheckUserAccess;

class AuthOwnerController extends Controller
{

    public function ownerLogin(){
        //If auth check and admin then redirect
        if (auth()->check() && CheckUserAccess::isAdmin()) {
           return redirect('/dashboard');
        }
        return view('auth.owner');
    }

    public function submitLogin(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);
   
        $credentials = $request->only('email', 'password');

        $errorLog = 'Invalid Login';
        //Check if credetials 
        if($credentials){
            $checkAccess = User::where('email', $request->email)->get();
            //check user Access
            $authenticateUser =  User::find($checkAccess[0]->id)->userAccess;
            if($authenticateUser[0]->access_level != 1){
                $errorLog = 'Sorry, you don\'t have permission to access this page';
            }
        }
        
        if ($authenticateUser[0]->access_level == 1) {
            if(Auth::attempt($credentials) ){
                return redirect()->intended('dashboard')->withSuccess('Signed in');
            }
        }
        return redirect("owner")->withErrors([
            'errorLogin' => $errorLog
        ]);
       
    }  
}
