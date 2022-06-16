<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Organisation;

class AuthOwnerOrganisationController extends Controller
{

   
    
    public function index(){
        return view('auth.organisation');
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
}
