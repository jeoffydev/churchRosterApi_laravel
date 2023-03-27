<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthContractorsApiController;
use App\Http\Controllers\Api\AuthOrganisationApiController;
use App\Http\Controllers\Api\AuthEventApiController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


//Login API
Route::post("contractors/login", [AuthContractorsApiController::class, 'login']);

//Protected route using Sanctum
//Get the User/org Details after logins 
Route::middleware(['auth:sanctum'])->group(function () { 
    Route::get('contractors/users', [AuthContractorsApiController::class, 'index']); 
    Route::get('contractors/users/all', [AuthContractorsApiController::class, 'adminAllContractors']); 
    Route::get('contractors/user/{id}', [AuthContractorsApiController::class, 'userDetails']);   
    Route::post('contractors/user/create', [AuthContractorsApiController::class, 'create']); 
    Route::get('contractors/user-edit/{id}', [AuthContractorsApiController::class, 'edit']); 

    //Organisation
    Route::get('organisations/all', [AuthOrganisationApiController::class, 'index']);
    //Event
    Route::get('events/all', [AuthEventApiController::class, 'index']);
    Route::get('events/{id}', [AuthEventApiController::class, 'show']); 
    Route::post('events/create', [AuthEventApiController::class, 'create']); 
    //Logout
    Route::get('contractors/logout', [AuthContractorsApiController::class, 'logout']);
});