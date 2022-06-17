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

        $createOrg = Organisation::create($request->all());
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
}
