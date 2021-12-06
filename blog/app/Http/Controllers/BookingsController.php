<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Bookings;
use App\Models\Flight;
use App\Models\Passengers;
use Validator;
use Str;
use App\Http\Resources\FlightCollection;
use App\Http\Resources\PassengersCollection;
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
        $findBook=Bookings::where('code',$request->code)->first();
        $to=$findBook->flight_from;
        $back=$findBook->flight_back;
  
        $flights_to=Flight::where('id',$to)->get();
        $flights_back=Flight::where('id',$back)->get();

        $passengers=Passengers::where('booking_id',$findBook->id)->get();
        $cost=$flights_to->sum('cost')+$flights_back->sum('cost');
        $count=$passengers->count();

        $request->date1=$findBook->date_from;
        $request->date2=$findBook->date_back;
        
        $data=[
           "date"=>[
               "code"=>$request->code,
               "cost"=>$cost*$count,
               "flights"=>[
                "flights_to"=>FlightCollection::collection($flights_to),
                "flights_back"=>FlightCollection::collection($flights_back),
               ],
               "passengers"=>[
                   PassengersCollection::collection($passengers),
               ]
            ]
        ];
        
        return response($data,201)->header('Content-Type', 'application/json');

    }
    public function getFlights($to,$back)
    {
        $flights=Bookings::whereHas('codeFrom', function($q) use($to){
            return $q->where('id', $to);
        })->whereHas('codeTo', function($q) use($back){
            return $q->where('id', $back);
        });

        return $flights->get();

    }
}
