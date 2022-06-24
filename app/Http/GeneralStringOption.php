<?php


namespace App\Http;

use Illuminate\Http\Request; 

class GeneralStringOption
{ 
 
    public function getSuccessMessage($prop){ 
        return "New ".$prop." has been created.";
    }

    public function getExistMessage($prop){ 
        return "No ".$prop." exist!.";
    }

    public function getUpdateMessage($prop){ 
        return "".$prop." has been updated.";
    }

    public function getEmailExistMessage($prop){
        return "".$prop." already exist!";
    }

    public function getDeleteMessage($prop){ 
        return "".$prop." has been deleted.";
    }
   
}