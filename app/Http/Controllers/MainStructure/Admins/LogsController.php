<?php

namespace App\Http\Controllers\MainStructure\Admins;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\MainStructure\SysLogs;

class LogsController extends Controller {

	public function write($p_module, $p_action, $p_detail) {
		$log = new SysLogs;
		$log->module = $p_module;
		$log->action = $p_action;
		$log->detail = $p_detail;
		$log->user_id = Auth::guard('user')->id();
		$log->save();
	}

	public function index(){
		$table_html = $this->dataTable();
		return view('mainstructure.pages.admins.Log.Log',['table_html'=>$table_html]);
	}

	// Danh sách các logs
	public function dataTable(){
		$logs = SysLogs::orderBy('created_at','desc')->get();
		$html = '';
		if($logs){
			foreach ($logs as $key=>$log){
				$html .= '<tr>';
				$html .= '	<td>'.($key+1).'</td>';
				$html .= '	<td>'.$log->user->account.'</td>';
				$html .= '	<td>'.$log->module.'</td>';
				$html .= '	<td>'.$log->action.'</td>';
				$html .= '	<td>'.$log->detail.'</td>';
				$html .= '	<td>'.$log->created_at.'</td>';
				$html .= '</tr>';
			}
		}
		return $html;
	}
}
