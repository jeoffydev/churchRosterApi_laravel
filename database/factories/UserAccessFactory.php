<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use App\Models\UserAccess;

class UserAccessFactory extends Factory
{
    public $_countNum = 2;
    protected $model = UserAccess::class;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $inc = $this->_countNum++;
        if($inc % 2 == 0){
            $type = 2;
        }else{
            $type = 3;
        }
        return [
            'user_id' => $inc,
            'access_level'=> $type,
            'updated_at' => now(),
            'created_at' => now(),
        ];
    }
}
