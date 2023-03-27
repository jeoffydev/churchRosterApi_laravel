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
        $error = response()->json($wrongCreds);
 

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

     /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $createEvent = Event::create([
            'active' => $request->active, 
            'title'  => $request->title, 
            'date'  => $request->date, 
            'description' => $request->description, 
        ]);
        if($createEvent){
            OrganisationEvent::create([
                'event_id'=>$createEvent->id,
                'org_id'=> $request->organisation_id
            ]); 
        }
        $eventCreated = [
            'success'=> GeneralStringOption::getSuccessCreated('Event')
        ];  
        return response()->json($eventCreated);
    }
}
