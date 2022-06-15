<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\UserType;

class UserAccess extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', //user id,
        'access_level' //integer or id of user_types
    ];

     /**
     * Access that belongs or owns to the user
     */
    public function user()
    {
        return $this->belongsToMany(User::class);
    }

    public function userType()
    {
        return $this->hasMany(UserType::class, 'id');
    }
}
