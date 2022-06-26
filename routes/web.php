<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthOwnerController;
use App\Http\Controllers\AuthOwnerDashboardController;
use App\Http\Controllers\AuthOwnerOrganisationController;
use App\Http\Controllers\AuthOwnerContractorController;
use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Test Swagger Project COntroller
Route::resource('projects', 'ProjectsController');

Route::get('/', function () {
    return view('welcome');
});


Route::get('owner', [AuthOwnerController::class, 'ownerLogin'])->name('auth.owner');
Route::post('submitlogin', [AuthOwnerController::class, 'submitLogin'])->name('login.submit'); 

//Redirect the error of route login not found then use this
Route::post('owner', [AuthOwnerController::class, 'ownerLogin'])->name('login');

Route::group(['middleware' => ['auth']], function() {
    //Dashboard
    Route::get('dashboard', [AuthOwnerDashboardController::class, 'index'])->name('auth.dashboard'); 
    
    //Organisation
    Route::get('organisation', [AuthOwnerOrganisationController::class, 'index'])->name('auth.organisation'); 
    Route::post('create', [AuthOwnerOrganisationController::class, 'doCreateOrg'])->name('create.org');
    Route::get('organisation/{id}', [AuthOwnerOrganisationController::class, 'edit'])->name('auth.organisation-edit'); 
    Route::get('organisation/delete/{id}', [AuthOwnerOrganisationController::class, 'delete'])->name('auth.organisation'); 
    Route::post('update', [AuthOwnerOrganisationController::class, 'doUpdateOrg'])->name('update.org');
     
    //Contractors
    Route::get('contractors', [AuthOwnerContractorController::class, 'index'])->name('auth.contractor'); 
    Route::post('create-user', [AuthOwnerContractorController::class, 'doCreateUser'])->name('create.user');
    Route::get('contractors/{id}', [AuthOwnerContractorController::class, 'edit'])->name('auth.contractor-edit'); 
    Route::post('update-org', [AuthOwnerContractorController::class, 'doUpdateUser'])->name('update.user');
    Route::get('contractors/delete/{id}', [AuthOwnerContractorController::class, 'delete'])->name('auth.contractor'); 

    //Logout
    Route::get('logout', [AuthOwnerDashboardController::class, 'logout'])->name('auth.owner');
});


