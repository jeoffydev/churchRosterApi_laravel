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

    public function isAdmin(){
        $authUser  = Auth::user(); 
        // get the user access type name 
        $userType = UserAccess::find($authUser->id)->userType;
        return $userType[0]->type_name == static::$_Admin ? true : false;
    }
}