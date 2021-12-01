<?php

namespace App\Http\Resources;
use App\Models\Flights;
use Illuminate\Http\Resources\Json\JsonResource;

class FlightCollection extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'flight_id' => $this->id,
            'flight_code' => $this->flight_code,
            'from' => [
                "city"=>$this->from()->first()->city,
                "airport"=>$this->from()->first()->name,
                "iata"=>$this->from()->first()->iata,
                "date"=>$request->date1,
                "time"=>$this->time_from

            ],
            'to' => [
                "city"=>$this->to()->first()->city,
                "airport"=>$this->to()->first()->name,
                "iata"=>$this->to()->first()->iata,
                "date"=>$request->date2,
                "time"=>$this->time_to
            ],
            "cost"=>$this->cost,
            "availability"=> 60
        ];
    }
}
