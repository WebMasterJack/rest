<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Airport;
use App\Models\Bookings;
class Flight extends Model
{
    protected $table='flights';
    protected $fillable=["flight_code","from_id","to_id","time_from","time_to","cost"];
    
    public function from()
    {
        return $this->belongsTo(Airport::class,'from_id','id');
    }
    public function to()
    {
        return $this->belongsTo(Airport::class,'to_id','id');
    }

  
}
