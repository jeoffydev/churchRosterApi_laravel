<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthOwnerController;
use App\Http\Controllers\AuthOwnerDashboardController;
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

Route::get('/', function () {
    return view('welcome');
});


Route::get('owner', [AuthOwnerController::class, 'ownerLogin'])->name('auth.owner');
Route::post('submitlogin', [AuthOwnerController::class, 'submitLogin'])->name('login.submit'); 

//Redirect the error of route login not found then use this
Route::post('owner', [AuthOwnerController::class, 'ownerLogin'])->name('login');

Route::group(['middleware' => ['auth']], function() {
    Route::get('dashboard', [AuthOwnerDashboardController::class, 'index'])->name('auth.dashboard'); 
    Route::get('logout', [AuthOwnerDashboardController::class, 'logout'])->name('auth.owner');
});