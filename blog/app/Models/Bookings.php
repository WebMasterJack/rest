<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Flight;

class Bookings extends Model
{
    protected $table='bookings';
    protected $fillable=['id','flight_from','flight_back','date_from','date_back','code','created_at','updated_at'];

    public function codeFrom()
    {
        return $this->belongsTo(Flight::class,'from_id','id');
    }
    public function codeTo()
    {
        return $this->belongsTo(Flight::class,'from_id','id');
    }
}
