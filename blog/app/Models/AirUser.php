<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AirUser extends Model
{
 protected $table='users';
 protected $fillable=['first_name','last_name','phone','password','document_number','api_token','created_at','updated_at'];

}
