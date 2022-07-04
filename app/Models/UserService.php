<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Service;

class UserService extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', //user id,
        'service_id' //integer or id of user_types
    ];

    public function user()
    {
        return $this->belongsToMany(User::class);
    }

    public function service()
    {
        return $this->hasMany(Service::class, 'id', 'service_id');
    }

}
