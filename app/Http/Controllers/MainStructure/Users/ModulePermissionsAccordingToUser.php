<?php

namespace App\Http\Controllers\MainStructure\Users;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\AccountUsers;
use App\Models\MainStructure\SysModulePermissionsAccordingToUser;
//Controller
use App\Http\Controllers\MainStructure\Admins\LogsController;

class ModulePermissionsAccordingToUser extends Controller {

	public function index(){
		if( GlobalFunction::checkRoleFunctionByUser('view', 302) == false ){
    		abort('404');
    	} else {
    		$accounts_users = $this->htmlDataTable();
			$permissions = SysModulePermissionsAccordingToUser::whereUserId( Auth::id() )
																->whereAction('view')
																->first()
																->module_permissions;
			$array_permission = explode(",", $permissions );

    		$data['table_html'] = $this->htmlDataTable();
			$data['list_modules'] = SysListModules::whereIn('id', $array_permission)
											->whereActive('1')
											->with("by_group")
											->get()
											->sortBy('by_group.order')
											->groupBy('by_group.name');
			return view('mainstructure.pages.users.ModulePermission.ModulePermission', $data);
    	}
	}
	//
	public function ajax(Request $request){
		if( GlobalFunction::checkRoleFunctionByUser('view', 302) == true ){
			$input = $request->input();
			if( $input['user_id'] != 1 ) { //Block edit user default
				if ( $input['action_type'] == 'view' ) {
					if( GlobalFunction::checkRoleFunctionByUser('view', 302) == true ){
						return $this->view( $input );
					} else {
						return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
					}
				}
				if ( $input['action_type'] == 'edit' ) {
					if( GlobalFunction::checkRoleFunctionByUser('edit', 302) == true ){
						return $this->edit( $input );
					} else {
						return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
					}
				}
			}
		}
	}
	public function htmlDataTable(){
		$current_id_site = Auth::guard('user')->user()->id_site;
		$current_id = Auth::guard('user')->id();
		$accounts_users = AccountUsers::whereIdSite($current_id_site)
							    		->where('level','!=', '1')
							    		->where('id','!=', $current_id)
							    		->orderby('active', 'desc')
							    		->get();
		$html = '';
		if($accounts_users){
			foreach($accounts_users as $account_users ){
				$html .= '<tr>';
				$html .= '	<td>'.$account_users->account.'</td>';
				$html .= '	<td>'.$account_users->name.'</td>';
				$html .= '	<td>';
				if( GlobalFunction::checkRoleFunctionByUser('edit', 302) == true ){
					$html .= '			<button type="button" class="btn btn-sm btn-custon-four btn-info" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$account_users->id.')">
										<i class="fa big-icon fa-shield"></i><span class="ml-2">Phân quyền</span>
									</button>';
				}
				$html .= '	</td>';
				$html .= '</tr>';
			}
		}
		return $html;
	}

	public function view($input){
		try {
			$permissions = SysModulePermissionsAccordingToUser::whereUserId( $input['user_id'] )->get();
			return response()->json(['error'=>false, 'list' => $permissions ]);
		} catch(Exception $e) {
			return response()->json(['error'=>true, 'message'=>'Lỗi phân quyền!']);
		}
	}

	public function edit($input){
		try {
			$user_id = $input['user_id'];
			$array_module_permissions = $input['array_module_permissions'];
			foreach($array_module_permissions as $module_permission){
				$permission = SysModulePermissionsAccordingToUser::whereUserId($user_id)
													->whereAction($module_permission['action'])
													->first();
				if($permission){
					$permission->module_permissions = $module_permission['module_permission'];
					$permission->update();
				} else {
					$permission = new SysModulePermissionsAccordingToUser;
					$permission->user_id = $user_id;
					$permission->module_permissions = $module_permission['module_permission'];
					$permission->action = $module_permission['action'];
					$permission->save();
				}
			}
			$accounts_users = AccountUsers::find($user_id);
			LogsController::write("Phân quyền module", "Sửa đổi", "Phân quyền tài khoản: ".$accounts_users->account);
			return response()->json(['error'=>false, 'message' => 'Phân quyền thành công!']);
		} catch(Exception $e) {
			return response()->json(['error'=>true, 'message'=>'Lỗi phân quyền!']);
		}
	}
//End nhóm các modules
}
