<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;

class Organisation extends Model
{
    use HasFactory;

    protected $fillable = [
        'active', 'org_name', 'location', 'description'
    ];

    public function department()
    {
        return $this->hasMany(Department::class);
    }

}
