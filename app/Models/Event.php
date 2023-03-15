<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Organisation;

class Event extends Model
{
    use HasFactory;

    //this is just a starting point
    //still needs to join services, songs, instruments in the future
    protected $fillable = [
        'active', 'title', 'date', 'description'
    ];

    public function organisation()
    {
        return $this->hasOne(Organisation::class);
    }
}
