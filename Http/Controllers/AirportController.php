<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Http\Resources\AirportCollection;
use App\Models\Airport;

class AirportController extends Controller
{
    //
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'query' => 'required',
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
        $noobes=Airport::where('iata','like','%'.$request["query"].'%')
                        ->orWhere('name','like','%'.$request["query"].'%')
                        ->orWhere('city','like','%'.$request["query"].'%')
                        ->get();
        $data=[
            "data"=> [
              "items"=> [
                AirportCollection::collection($noobes)
              ]
            ]
         ];
         return response($data,200)->header('Content-Type', 'application/json');
         
        # code...
    }
}
