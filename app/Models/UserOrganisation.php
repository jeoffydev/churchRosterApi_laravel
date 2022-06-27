<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Organisation;

class UserOrganisation extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'org_id'
    ];

     /**
     * Access that belongs or owns to the user
     */
    public function user()
    {
        return $this->belongsToMany(User::class, 'id');
    }

    public function organisation()
    {
        return $this->hasMany(Organisation::class, 'id', 'org_id');
    }

}
