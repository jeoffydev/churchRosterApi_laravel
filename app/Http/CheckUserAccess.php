<?php


namespace App\Http;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Models\UserAccess;
use App\Models\UserType;

class CheckUserAccess
{
    private static  $_Admin = 'Admin';
    private static  $_Contractor = 'Contractor';
    private static  $_Member = 'Member';
    public static   $Owner_email = 'jeoffy_hipolito@yahoo.com';

    public function isAdmin(){
        $authUser  = Auth::user(); 
        // get the user access type name 
        $userType = UserAccess::find($authUser->id)->userType;
        return $userType[0]->type_name == static::$_Admin ? true : false;
    }

    public function isContractor(){
        $authUser  = Auth::user(); 
        // get the user access type name 
        $userType = UserAccess::find($authUser->id)->userType;
        return $userType[0]->type_name == static::$_Contractor ? true : false;
    }

    public function isMember(){
        $authUser  = Auth::user(); 
        // get the user access type name 
        $userType = UserAccess::find($authUser->id)->userType;
        return $userType[0]->type_name == static::$_Member ? true : false;
    }

    //Member access level
    public function saveContractorAccess(){ 
        $userType =  UserType::where('type_name', static::$_Contractor)->get();
        return $userType[0]->id;
    }

    public function saveMemberAccess(){ 
        $userType =  UserType::where('type_name', static::$_Member)->get();
        return $userType[0]->id;
    }
}