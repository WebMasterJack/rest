<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/register','App\Http\Controllers\AirUserController@register');
Route::post('/login','App\Http\Controllers\AirUserController@login');
Route::get('/flight','App\Http\Controllers\FlightController@index');
Route::get('/airport','App\Http\Controllers\AirportController@index');
Route::post('/bookings','App\Http\Controllers\BookingsController@index');
Route::get('/bookings/{code}','App\Http\Controllers\BookingsController@code');
