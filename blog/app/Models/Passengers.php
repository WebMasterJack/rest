<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Passengers extends Model
{
  protected $table='passengers';
  protected $fillable=['id','booking_id','first_name','last_name','birth_date','document_number','place_from','place_back','created_at','updated_at'];
  
}
