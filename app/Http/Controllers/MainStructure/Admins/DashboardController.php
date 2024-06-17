<?php

namespace App\Http\Controllers\MainStructure\Admins;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use DB;

class DashboardController extends Controller {
	public function dashboard(){
		return view('mainstructure.pages.admins.Dashboard.Dashboard');
	}
}
