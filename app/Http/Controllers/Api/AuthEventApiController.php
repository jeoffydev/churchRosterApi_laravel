<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\OrganisationEvent;
use App\Http\GeneralStringOption;
use Symfony\Component\HttpFoundation\Response;

class AuthEventApiController extends Controller
{
    public function index()
    {    
        $eventsList = Event::all();
        $data = [
            'eventsList'=>$eventsList
        ];
        return response()->json($data);
       
    }

    public function show($id)
    {
        $wrongCreds = [
            'error'=> GeneralStringOption::idNotExist()
        ];  
        $error = response()->json([$wrongCreds], Response::HTTP_UNAUTHORIZED);
 

        if($id){
            $orgEvent = OrganisationEvent::where('org_id', $id)->exists();
            if($orgEvent ){ 
                 $organisationEvent = Event::with('organisationEvent')->whereHas('organisationEvent', function($u) use ($id){
                    $u->where('org_id', $id);
                 })
                 ->orderBy('id', 'desc')
                 ->get();  
                $data = [
                    'organisationEvent'=> $organisationEvent 
                ];
                return response()->json($data);
            } else {
                return $error;
            } 
       } else {
            return $error;
       }
    }
}
