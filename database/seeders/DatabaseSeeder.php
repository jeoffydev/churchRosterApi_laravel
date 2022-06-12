<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $password=Hash::make('jan12dj22');
        User::factory()->create([
            'name' => 'Jeoffy Hipolito',
            'email' => 'jeoffy_hipolito@yahoo.com',
            'email_verified_at' => now(),
            'password' => $password, // password
            'remember_token' => Str::random(10),
        ]);
        User::factory()->count(3)->create();
    }
}
