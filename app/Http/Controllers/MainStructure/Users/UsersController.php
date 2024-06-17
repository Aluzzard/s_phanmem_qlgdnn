<?php

namespace App\Http\Controllers\MainStructure\Users;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\MainStructure\AccountUsers;
//Controller
use App\Http\Controllers\MainStructure\Admins\LogsController;
//Requests
use App\Http\Requests\MainStructure\UserRequest;

class UsersController extends Controller {
	public function index(){
		if(GlobalFunction::checkRoleFunctionByUser('view', 300) == false){
    		abort('404');
    	} else {
    		$data['html_table'] = $this->htmlDataTable();
    		$data['check_add'] = GlobalFunction::checkRoleFunctionByUser('edit', 300);
			return view('mainstructure.pages.users.ManagerUsers.ListUsers', $data);
    	}
	}
	public function ajax(Request $request){
		if(GlobalFunction::checkRoleFunctionByUser('view', 300) == true){
	    	$action_type = $request->input('action_type');
	    	if ($action_type == 'view' ) {
	    		if( GlobalFunction::checkRoleFunctionByUser('view', 300) == true ){
	    			return $this->view($request);
    			} else {
					return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
				}
	    	}
	    	else if($action_type == 'add' ) {
	    		if( GlobalFunction::checkRoleFunctionByUser('edit', 300) == true ){
	    			return $this->add($request);
	    		} else {
					return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
				}
	    	}
	    	else if( $action_type == 'edit' ) {
	    		if( GlobalFunction::checkRoleFunctionByUser('edit', 300) == true ){
	    			return $this->edit($request);
	    		} else {
					return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
				}
	    	}
	    	else if($action_type == 'delete' ) {
	    		if( GlobalFunction::checkRoleFunctionByUser('delete', 300) == true ){
	    			return $this->delete($request);
	    		} else {
					return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
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
				$html .= '	<td>'.$account_users->email.'</td>';
					if( $account_users->active == 1 ) {
						$html .= '	<td class="text-success fw-700"><strong>Hoạt động</strong></td>';
					} else {
						$html .= '	<td class="text-danger fw-700"><strong>Không hoạt động</strong</td>';
					}
				$html .= '	<td>';
				if( GlobalFunction::checkRoleFunctionByUser('edit', 300) == true ){
					$html .= '			<button type="button" class="btn btn-sm btn-custon-four btn-warning" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$account_users->id.')">
										<i class="fa big-icon fa-pencil"></i><span class="ml-2">Sửa</span>
									</button>';
				}
				// if( GlobalFunction::checkRoleFunctionByUser('delete', 300) == true ){
				// 	$html .= '			<button type="button" class="btn btn-sm btn-custon-four btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delete`,'.$account_users->id.')">
				// 						<i class="fa big-icon fa-times"></i><span class="ml-2">Xóa</span>
				// 					</button>';
				// }
				$html .= '	</td>';
				$html .= '</tr>';
			}
		}
		return $html;
	}
    
    public function view($request) {
    	try {
            $user = AccountUsers::find( $request->input('id') );
            return response()->json(['error'=> false, 'user'=>$user]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request) {
    	try {
            $validator = Validator::make($request->all(), UserRequest::rules($request->input('id')), UserRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['active'] = 1;
                $input['password'] = bcrypt($request->input('password'));
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                AccountUsers::create($input);
                $html = $this->htmlDataTable();

                LogsController::write("Quản lý người dùng", "Thêm mới", "Tài khoản: ".$request->input('name'));
	            return response()->json(['error'=> false, 'message' => 'Thêm tài khoản thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
        	return response()->json(['error'=> true, 'message' => 'Thêm tài khoản thất bại']);
        }
    }
    public function edit($request) {
		try {
            $validator = Validator::make($request->all(), UserRequest::rules($request->input('id')), UserRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
            	if(Auth::id() == $request->input('id')){
					return response()->json(['error'=> true, 'message' => 'Tài khoản đang sử dụng!']);
				} else {
					$user = AccountUsers::find( $request->input('id') );
					$user->name = $request->input('name');
					$user->email = $request->input('email');
					$user->numberphone = $request->input('numberphone');
					if ($request->input('password')){
						$user->password = bcrypt($request->input('password'));
					}
					$user->active = ($request->input('status') == 1) ? 1 : 0;
	                $user->update();
		            $html = $this->htmlDataTable();
		            LogsController::write("Quản lý người dùng", "Sửa đổi", "Tài khoản: ".$request->input('name'));
		            return response()->json(['error'=> false, 'message' => 'Sửa tài khoản thành công', 'table_html' => $html]);
		        }
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Sửa tài khoản thất bại']);
        }
    }
    public function delete($request) {
    	try {
			if(Auth::id() == $request->input('id')){
				return response()->json(['error'=> true, 'message' => 'Tài khoản đang sử dụng!']);
			} else {
				$user = AccountUsers::find( $request->input('id') );
    			$user->delete();
	            $html = $this->htmlDataTable();
	            LogsController::write("Quản lý người dùng", "Xoá", "Tài khoản: ".$user->account);
	            return response()->json(['error'=> false, 'message' => 'Xóa tài khoản thành công', 'table_html' => $html]);
			}
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa tài khoản thất bại']);
        }
    }
}
