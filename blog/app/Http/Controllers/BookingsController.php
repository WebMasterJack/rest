<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Bookings;
use Validator;
use Str;
use App\Http\Resources\FlightCollection;
class BookingsController extends Controller
{

    public function index(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
           "flight_from"=>[
            'id'=>'required',
            'date'=>'required'
           ],
           "flight_back"=>[
            'id'=>'required',
            'date'=>'required'
           ],
           "passengers"=>[
            'first_name'=>'required',
            'last_name'=>'required',
            'birth_date'=>'required',
            'document_number'=>'required'
           ]
        ]);
      
        if($validator->fails()){
            $errors=$validator->errors();
            $data=[
                "error"=> [
                    "code"=> 422,
                    "message"=> "Validation error",
                    "errors" => $errors
                ]
               
                ];
                return response($data,422)->header('Content-Type', 'application/json');
        }
        $code=Str::random(5);
        $data=[
            "data"=>[
                "code"=> $code
            ]
          
            ];
        $newBook=new Bookings;
        $newBook->flight_from=$request->input('flight_from.id');
        $newBook->flight_back=$request->input('flight_back.id');
        $newBook->date_from=$request->input('flight_from.date');
        $newBook->date_back=$request->input('flight_back.date');
        $newBook->code=$code;
        $newBook->save();
   
            return response($data,201)->header('Content-Type', 'application/json');
    }

    public function code(Request $request)
    {
        $to=$request->input('to');
        $back=$request->input('back');
        $flights_to=getFlights($to);
        $flights_back=getFlights($back);
        $data=[
           "date"=>[
               "code"=>$request->code,
               "cost"=>5000,
               "flights"=[
                "flights_to"=>FlightCollection::collection($flights_to),
                "flights_back"=>FlightCollection::collection($flights_back),
               ],
            ]
        ];
        
    

    }
    public function getFlights($to,$back)
    {
        $flight=Bookings::whereHas('to', function($q) use($to){
            return $q->where('code', $to);
        })->whereHas('back', function($q) use($back){
            return $q->where('code', $back);
        });

        return $flights->get();

    }
}
