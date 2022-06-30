<?php


namespace App\Http;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Models\UserAccess;
use App\Models\Organisation;
use App\Models\UserOrganisation; 

class CheckOrganisation
{
    private static  $_Active = 'Active';
    private static  $_InActive = 'InActive';

    public function getOrganisationName($id){
     
        $orgName = Organisation::find($id);
        $active = static::$_InActive;
        if($orgName->active){
            $active = $orgName->active == 1 ? static::$_Active : static::$_InActive;
        }
        if($orgName){
            return $orgName->org_name. " | " . $active;
        } 
       
        return "No organisation";
    }


    public function getUserOrganisationInfo($userID){ 
        $user = User::with('userOrganisation', 'userAccess')->find($userID);
        $org =  UserOrganisation::with('organisation')->where('user_id', $user['userOrganisation'][0]->user_id)->get();
        return ['userDetails'=>$user, 'orgDetails'=>$org];
    }

   
}