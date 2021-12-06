<?php

namespace App\Http\Resources;
use App\Models\Passengers;
use Illuminate\Http\Resources\Json\JsonResource;

class PassengersCollection extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
      return[
        
            
            "id"=>$this->id,
            "first_name"=>$this->first_name,
            "last_name"=>$this->last_name,
            "birth_date"=>$this->birth_date,
            "document_number"=>$this->document_number,
            "place_from"=>$this->place_from,
            "place_back"=>$this->place_back
        
    
            ];

    }
}
