<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Organisation;
use Illuminate\Support\Facades\Redirect;

class AuthOwnerOrganisationController extends Controller
{

   
    
    public function index(){
        $organisationsList = Organisation::all();
        $data = [
            'organisationsList'=>$organisationsList
        ];
        return view('auth.organisation', ['data' => $data]);
    }



    public function doCreateOrg(Request $request){

        // Form validation
        $this->validate($request, [
            'org_name' => 'required',
            'active' => 'required',
        ]); 
        //instead of $request->all()
        $createOrg = Organisation::create([
            'org_name' => $request->org_name,
            'active' => $request->active,
            'description'=>$request->description,
            'location'=>$request->location
        ]);
        return back()->with('success', 'New Organisation has been created.');
      
       
    }

    public function edit($id)
    {
       if($id){
            $organisation = Organisation::where('id', $id)->exists();
            if($organisation){
                $organisation = Organisation::find($id);
                $data = [
                    'organisation'=>$organisation
                ];
                return view('auth.organisation-edit', ['data'=>$data]);
            } 
       } 
    
       return Redirect::to('/organisation');
        
    }

    public function doUpdateOrg(Request $request){

       
        // Form validation
        $this->validate($request, [
            'id'=> 'required',
            'org_name' => 'required',
            'active' => 'required',
            
        ]); 

        $org = Organisation::find($request->get('id'));
        // Getting values from the blade template form
        $org->org_name =  $request->get('org_name');
        $org->active = $request->get('active');
        $org->location = $request->get('location');
        $org->description = $request->get('description');
        $org->save();
        return back()->with('success', 'Organisation has been updated.');
    
    }

    public function delete( $id)
    {
        if($id){
            // delete
            $deleteID = Organisation::find($id);
            if($deleteID){
                $deleteID->delete();
            } 
        }
         
        return Redirect::to('/organisation');
        
    }



}
