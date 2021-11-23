<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Airport extends Model
{
    protected $table='airports';
    protected $fillable=["city","name","iata","created_at","updated_at"];
}
