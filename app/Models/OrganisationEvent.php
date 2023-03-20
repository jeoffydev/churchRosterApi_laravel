<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Organisation;

class OrganisationEvent extends Model
{
    use HasFactory;

    protected $fillable = [
        'event_id', 'org_id'
    ];

     /**
     * Event that belongs or owns to the org
     */
    public function event()
    {
        return $this->hasMany(Event::class, 'event_id', 'id');
    }
}
