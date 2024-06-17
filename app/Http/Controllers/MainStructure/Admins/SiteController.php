<?php

namespace App\Http\Controllers\MainStructure\Admins;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
//Models
use App\Models\MainStructure\AccountUsers;
use App\Models\MainStructure\SysSites;
use App\Models\MainStructure\SysThemes;
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\SysFunctionPermissionsAccordingToUser;
use App\Models\MainStructure\SysModulePermissionsAccordingToUser;
//Requests
use App\Http\Requests\MainStructure\SiteRequest;

class SiteController extends Controller {
    public function __construct() {
        $this->path = '/upload/mainstructure/logo/';
        if (!\File::exists(public_path().$this->path)) {
            \File::makeDirectory(public_path().$this->path, 0755, true);
        }
    }

    public function index(){
        $data['table_html'] = $this->dataTable();
        $data['themes'] = SysThemes::all();
        $data['list_modules'] = SysListModules::whereActive('1')
                                ->with("by_group")
                                ->get()
                                ->sortBy('by_group.order')
                                ->groupBy('by_group.name');
        return view('mainstructure.pages.admins.Site.index', $data);
	}
	public function ajax(Request $request){
        $action_type = $request->input('action_type');
        if ($action_type == 'view' ) {
            return $this->view($request);
        }
        else if($action_type == 'add' ) {
            return $this->add($request);
        }
        else if( $action_type == 'edit' ) {
            return $this->edit($request);
        }
        else if($action_type == 'addAccount' ) {
            return $this->addAccount($request);
        }
        else if($action_type == 'editAccount' ) {
            return $this->editAccount($request);
        }
        else if($action_type == 'viewFunction' ) {
            return $this->viewFunction($request);
        }
        else if($action_type == 'editFunction' ) {
            return $this->editFunction($request);
        }
        else if($action_type == 'viewModule' ) {
            return $this->viewModule($request);
        }
        else if($action_type == 'editModule' ) {
            return $this->editModule($request);
        }
    }
	
    public function dataTable(){
        $sites = SysSites::all();
        $html = '';
        if($sites){
            foreach ($sites as $site){
                $admin_account = AccountUsers::whereLevel(1)->whereIdSite($site->id)->first();
                $html .= '<tr>';
                $html .= ($site->is_active == 1) ? '<td class="text-success"><strong>Đang hoạt động</strong></td>' : '<td class="text-danger"><strong>Không hoạt động</strong></td>';
                $html .= '  <td>'.$site->name.'</td>';
                $html .= '  <td>'.$site->till_the_time.'</td>';
                $html .= ($admin_account) ? '<td>Đã cấp tài khoản</td>' : '<td>Chưa cấp tài khoản</td>';
                $html .= '  <td>';
                $html .= '      <div class="button-ap-list responsive-btn">
                                    <div class="btn-group btn-custom-groups btn-custom-groups-one btn-mg-b-10">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Thao tác <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu btn-dropdown-menu" role="menu">';
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$site->id.')"><i class="fa fa-info-circle pr-3"></i>Thông tin website</a>
                                            </li>';
                if($admin_account) {
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#accountModal" onclick="func_buttonClick(`editAccount`,'.$site->id.')"><i class="fa fa-user pr-3"></i>Reset tài khoản</a>
                                            </li>';
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#functionModal" onclick="func_buttonClick(`editFunction`,'.$site->id.')"><i class="fa fa-info-circle pr-3"></i>Phân quyền chức năng</a>
                                            </li>';
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#moduleModal" onclick="func_buttonClick(`editModule`,'.$site->id.')"><i class="fa fa-info-circle pr-3"></i>Phân quyền module</a>
                                            </li>';
                } 
                else {
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#accountModal" onclick="func_buttonClick(`addAccount`,'.$site->id.')"><i class="fa fa-user pr-3"></i>Cấp tài khoản</a>
                                            </li>';
                }
                $html .= '              </ul>
                                    </div>
                                </div>';
                $html .= '  </td>';                     
                $html .= '</tr>';
            }
        }
        return $html;
    }
    public function view($request){
        try {
            $site = SysSites::find( $request->input('id') );
            $account = AccountUsers::whereLevel(1)->whereIdSite($site->id)->first();
            return response()->json(['error'=> false, 'site'=>$site, 'account'=>$account ]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), SiteRequest::rules($request->input('id')), SiteRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                if($request->hasFile('logo')){
                    $file = $request->file('logo');
                    $file_extension = $file->getClientOriginalExtension(); // Lấy đuôi của file
                    $file_name = $file->getClientOriginalName();
                    $file->move(public_path().$this->path,$file_name);
                    $input['logo'] = $this->path.$file_name;
                }
                SysSites::create($input);
                $table_html = $this->dataTable();
                return response()->json(['error'=> false, 'message' => 'Thêm thành công', 'table_html' => $table_html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), SiteRequest::rules($request->input('id')), SiteRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['is_active'] = ($request->input('is_active') == 1 ? 1 : 0);

                $item = SysSites::find( $request->input('id') );
                if($request->hasFile('logo')){
                    if($item->logo != ''){
                        unlink(public_path().$item->logo);
                    }
                    $file = $request->file('logo');
                    $file_extension = $file->getClientOriginalExtension(); // Lấy đuôi của file
                    $file_name = $file->getClientOriginalName();
                    $file->move(public_path().$this->path,$file_name);
                    $input['logo'] = $this->path.$file_name;
                }
                $item->update($input);
                $html = $this->dataTable();
                return response()->json(['error'=> false, 'message' => 'Sửa thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa thất bại']);
        }
    }
    public function addAccount($request){
        try {
            $validator = Validator::make($request->all(), SiteRequest::rules1(), SiteRequest::messages1());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                
                $account = AccountUsers::whereLevel(1)->whereIdSite( $request->input('id_site') )->first();
                if(!$account) {
                    $input['name'] = 'Quản trị viên';
                    $input['account'] = $request->input('account');
                    $input['password'] = bcrypt($request->input('password'));
                    $input['level'] = 1;
                    $input['active'] = 1;
                    $input['id_site'] = $request->input('id_site');
                    AccountUsers::create($input);
                    return response()->json(['error'=> false, 'message' => 'Cấp tài khoản thành công']);
                } else {
                    return response()->json(['error'=> false, 'message' => 'Đã tồn tại tài khoản']);
                }
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Cấp tài khoản thất bại']);
        }
    }
    public function editAccount($request){
        try {
            if( $request->input('password') ) {
                $account = AccountUsers::whereLevel(1)->whereIdSite( $request->input('id_site') )->first();                
                $account->password = bcrypt($request->input('password'));
                $account->update();
                return response()->json(['error'=> false, 'message' => 'Reset mật khảu thành công!']);
            } else {
                return response()->json(['error'=> true, 'message' => 'Nhập mật khẩu cần reset!']);
            }
            
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Reset mật khảu thất bại!']);
        }
    }
    public function viewFunction($request){
        try {
            $user = AccountUsers::whereIdSite($request->input('id_site'))->whereLevel(1)->first();
            $permissions = SysFunctionPermissionsAccordingToUser::whereUserId($user->id)->get();

            return response()->json(['error'=>false, 'list' => $permissions ]);
        } catch(Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lỗi phân quyền!']);
        }
    }
    public function editFunction($request){
        try {
            $input = $request->all();
            $id_site = $input['id_site'];
            $array_function_permissions = $input['array_function_permissions'];

            $user = AccountUsers::whereIdSite($id_site)->whereLevel(1)->first();
            foreach($array_function_permissions as $function_permission){
                $permission = SysFunctionPermissionsAccordingToUser::whereUserId($user->id)
                                                    ->whereAction($function_permission['action'])
                                                    ->first();
                if($permission){
                    $permission->function_permissions = $function_permission['function_permission'];
                    $permission->update();
                } else {
                    $permission = new SysFunctionPermissionsAccordingToUser;
                    $permission->user_id = $user->id;
                    $permission->function_permissions = $function_permission['function_permission'];
                    $permission->action = $function_permission['action'];
                    $permission->save();
                }
            }
             return response()->json(['error'=> false, 'message' => 'Cập nhập quyền thành công!']);    
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Cập nhập quyền thất bại!']);
        }
    }
    public function viewModule($request){
        try {
            $user = AccountUsers::whereIdSite($request->input('id_site'))->whereLevel(1)->first();
            $permissions = SysModulePermissionsAccordingToUser::whereUserId($user->id)->get();

            return response()->json(['error'=>false, 'list' => $permissions ]);
        } catch(Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lỗi phân quyền!']);
        }
    }
    public function editModule($request){
        try {
            $input = $request->all();
            $id_site = $input['id_site'];
            $array_module_permissions = $input['array_module_permissions'];
            $user = AccountUsers::whereIdSite($id_site)->whereLevel(1)->first();
            foreach($array_module_permissions as $module_permission){
                $permission = SysModulePermissionsAccordingToUser::whereUserId($user->id)
                                                    ->whereAction($module_permission['action'])
                                                    ->first();
                if($permission){
                    $permission->module_permissions = $module_permission['module_permission'];
                    $permission->update();
                } else {
                    $permission = new SysModulePermissionsAccordingToUser;
                    $permission->user_id = $user->id;
                    $permission->module_permissions = $module_permission['module_permission'];
                    $permission->action = $module_permission['action'];
                    $permission->save();
                }
            }
            return response()->json(['error'=>false, 'message' => 'Phân quyền thành công!']);
        } catch(Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lỗi phân quyền!']);
        }
    }
}
