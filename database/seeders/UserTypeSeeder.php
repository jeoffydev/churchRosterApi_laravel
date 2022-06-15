<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\UserType;

class UserTypeSeeder extends Seeder
{
   
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        UserType::factory()->create([
            'type_name' => 'Admin',
            'updated_at' => now(),
            'created_at' => now(),
        ]);
        UserType::factory()->count(2)->create();
         
    }
}
