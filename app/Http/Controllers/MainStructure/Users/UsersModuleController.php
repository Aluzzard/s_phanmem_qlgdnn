<?php

namespace App\Http\Controllers\MainStructure\Users;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
//Models
use App\Models\MainStructure\SysGroupModules;
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\SysModulePermissionsAccordingToUser;
use App\Models\MainStructure\SysLogs;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class UsersModuleController extends Controller {
	public function listModule(){
		if(GlobalFunction::checkRoleFunctionByUser('view', 200) == false){
    		abort('404');
    	} else {
    		$user_id = Auth::guard('user')->id();
			$permission = SysModulePermissionsAccordingToUser::whereUserId($user_id)->first();
			if($permission){
				$array_permission = explode(",", $permission->module_permissions );
				$list_modules = SysListModules::whereActive('1')
											->whereType(1)
											->whereIn("id", $array_permission)
											->with("by_group")
											->get()
											->sortBy('by_group.order')
											->groupBy('by_group.name');
			} else {
				$list_modules = [];
			}


    		$data['htmlListModule'] = $this->htmlListModule($list_modules);
			return view('mainstructure.pages.users.ListModule.ListModule', $data);
    	}
	}
	public function htmlListModule($list_modules){
		$html = '';
		if($list_modules) {
			foreach ($list_modules as $group_modules => $modules) {
				$html .= '<div class="row" style="display: flex; flex-wrap: wrap;">';
				$html .= '	<div class="col-lg-12">';
				$html .= '		<h4>'.$group_modules.'</h4>';
				$html .= '	</div>';
				foreach ($modules->sortBy('order') as $module) {
				$html .= '	<div class="col-md-1">';
				$html .= '		<a href="'.route( $module->controller.'.get.'.'index' ).'" class="text-center py-3 d-flex-wrap module">';
				$html .= '			<div class="sizefull"><img src="'.(($module->avatar) ? ($module->avatar) : ('upload/mainstructure/icon/module/default.png')).'" width="50"></div>';
				$html .= '			<div class="sizefull"><span>'.$module->name.'</span></div>';
				$html .= '		</a>';
				$html .= '	</div>';
				}
				$html .= '</div>';
			}
			return $html;
		}
	}
	public function ajaxSearchModule(Request $request){
		$search_text = $request->input('text');
		$user_id = Auth::guard('user')->id();
		$permission = SysModulePermissionsAccordingToUser::whereUserId($user_id)->first();
		if($permission){
			$array_permission = explode(",", $permission->module_permissions );
			$list_modules = SysListModules::whereActive('1')
										->whereType(1)
										->whereIn("id", $array_permission)
										->where('name','like','%'.$search_text.'%')
										->with("by_group")
										->get()
										->sortBy('by_group.order')
										->groupBy('by_group.name');
		} else {
			$list_modules = [];
		}
		$htmlListModule = $this->htmlListModule($list_modules);
		return response()->json(['error'=> false, 'htmlListModule'=>$htmlListModule]);
	}
}
