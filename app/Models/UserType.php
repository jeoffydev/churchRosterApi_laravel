<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\UserAccess;

class UserType extends Model
{
    use HasFactory;

    protected $fillable = [
        'type_name'
    ];

    
}
