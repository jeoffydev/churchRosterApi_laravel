<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthOwnerContractorController extends Controller
{
    public function index(){
        return view('auth.contractor');
    }
}
