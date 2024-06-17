<?php

namespace App\Http\Controllers\MainStructure\Users;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use DB;

class DashboardController extends Controller {
    public function dashboard(){
		return view('mainstructure.pages.users.Dashboard.Dashboard');
	}
}
