<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\UserType;

class UserTypeFactory extends Factory
{
    public $_countNum = 1;
    protected $model = UserType::class;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $inc = $this->_countNum++;
        if($inc % 2 == 0){
            $type = "Contractor";
        }else{
            $type = "Member";
        }
        return [
            'type_name' => $type,
            'updated_at' => now(),
            'created_at' => now(),
        ];
    }
}
