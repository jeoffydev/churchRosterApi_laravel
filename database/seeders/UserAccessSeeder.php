<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\UserAccess;

class UserAccessSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $getAllUsers =  User::all();
        $getUser = User::where('email','jeoffy_hipolito@yahoo.com') -> first();
        UserAccess::factory()->create([
            'user_id' => $getUser->id,
            'access_level'=> 1,
            'updated_at' => now(),
            'created_at' => now(),
        ]);
        UserAccess::factory()->count(count($getAllUsers)-1)->create();
    }
}
