<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\Flight;
use App\Http\Resources\FlightCollection;
class FlightController extends Controller
{
//     ●	from - iata-код аэропорта вылета, обязательно, должен существовать 
// ●	to - iata-код аэропорта назначения, обязательно, должен существовать
// ●	date1 - дата вылета туда, обязательно, в формате YYYY-MM-DD
// ●	date2 - дата возвращения обратно, не обязательно, в формате YYYY-MM-DD
// ●	passengers - число пассажиров (от 1 до 8 включительно), обязательно

    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'from' => 'required|exists:airports,iata',
            'to' => 'required|exists:airports,iata',
            'date1' => 'required|date_format:Y-m-d',
            'date2' => 'required|date_format:Y-m-d',
            'passengers' => 'required|digits_between:1,8',
        ]);

        if ($validator->fails()) {
            $data=[
                "error"=> [
                  "code"=> 422,
                  "message"=> "Validation error",
                  "errors"=> $validator->errors()
                ]
            ];             
            return response($data,404)->header('Content-Type', 'application/json');
        }
        $from=$request->input('from');
        $to=$request->input('to');
        $noobes_from=$this->getNoobes($from,$to);
        $noobes_to=$this->getNoobes($to,$from);

        $data=[
            "flights_to"=>FlightCollection::collection($noobes_from),
            "flights_back"=>FlightCollection::collection($noobes_to),
        ];
     
        return response($data,200)->header('Content-Type', 'application/json');


    }
    public function getNoobes($from ,$to)
    {
        $noobes=Flight::whereHas('from', function($q) use($from){
            $q->where('iata', $from);
        })->whereHas('to', function($q) use($to){
            $q->where('iata', $to);
        });

        return $noobes->get();

    }
}
