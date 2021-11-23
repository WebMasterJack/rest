<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AirUser;
use Validator;
use Str;
class AirUserController extends Controller
{
    // {
    //     "phone": "89001234567",
    //     "password": "paSSword"
    //  }
     
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            $data=[
                "error"=> [
                  "code"=> 422,
                  "message"=> "Validation error",
                  "errors"=> $errors
                ]
            ];             
            return response($data,404)->header('Content-Type', 'application/json');
        }
        $ourUser=AirUser::wherePhone($request->phone)->wherePassword($request->password);
        $isInValid=$ourUser->count()==0;

        if ($isInValid) {
            $data=[
                "error"=> [
                  "code"=> 401,
                  "message"=> "Validation error",
                  "errors"=> [ "phone"=>[ "phone or password incorrect" ]]
                ]
            ];   
            return response($data,401)->header('Content-Type', 'application/json');
        }
        $token=Str::random(24);
        $ourUser->update(['api_token'=>$token]);

        $data=[
              "data"=> [ "token"=>$token]
        ];
        return response($data,200)->header('Content-Type', 'application/json');
    }

    // {
    //     "first_name": "Ivan",
    //     "last_name": "Ivanov",
    //     "phone": "89001234567",
    //     "document_number": "7567999222",
    //     "password": "paSSword"
    //  }     
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|unique:users|max:11',
            'first_name'=>'required',
            'last_name'=>'required',
            'document_number'=>'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            $data=[
                "error"=> [
                  "code"=> 422,
                  "message"=> "Validation error",
                  "errors"=> $errors
                ]
            ];             
            return response($data,404)->header('Content-Type', 'application/json');
        }

        $newNoobe=new AirUser;
        $newNoobe->phone=$request->phone;
        $newNoobe->first_name=$request->first_name;
        $newNoobe->last_name=$request->last_name;
        $newNoobe->document_number=$request->document_number;
        $newNoobe->password=$request->password;
        $newNoobe->save();
        return response(204)->header('Content-Type', 'application/json');
    }
}
