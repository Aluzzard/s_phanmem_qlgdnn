<?php

namespace App\Http\Controllers\Modules\AITypeOfEthnics;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleTypeOfEthnics;
//Requests
use App\Http\Requests\Module\ModuleTypeOfEthnicsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AITypeOfEthnicsController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            return view('modules.AITypeOfEthnics.index', $data);
        }
    }

    public function ajax(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'loaddt' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->loaddt($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if ($action_type == 'view' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->view($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if($action_type == 'add' ) {
                if( GlobalFunction::checkRoleModuleByUser('add') == true ){
                    return $this->add($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if( $action_type == 'edit' ) {
                if( GlobalFunction::checkRoleModuleByUser('edit') == true ){
                    return $this->edit($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if($action_type == 'delete' ) {
                if( GlobalFunction::checkRoleModuleByUser('delete') == true ){
                    return $this->delete($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
        } else {
            abort('404');
        }
    }
    
    public function dataTable(){
        $current_id_site = Auth::guard('user')->user()->id_site;
        $listofpeoples = ModuleTypeOfEthnics::whereIdSite($current_id_site)->get();
        $html = '';
        if($listofpeoples){
            foreach ($listofpeoples as $people){
                $html .= '<tr>';
                $html .= '  <td>'.$people->name.'</td>';
                $html .= '  <td>';
                $html .= '      <div class="button-ap-list responsive-btn">
                                    <div class="btn-group btn-custom-groups btn-custom-groups-one btn-mg-b-10">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Thao tác <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu btn-dropdown-menu" role="menu">';
                if( GlobalFunction::checkRoleModuleByUser('edit') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$people->id.')"><i class="fa fa-edit pr-3"></i>Sửa</a>
                                            </li>';
                }
                if( GlobalFunction::checkRoleModuleByUser('delete') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delete`,'.$people->id.')"><i class="fa fa-recycle pr-3"></i>Xóa</a>
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
    public function loaddt(Request $request) {
        try{
            $table_html = $this->dataTable($request->input());
            return response()->json(['error'=>false, 'table_html' => $table_html]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function view($request){
        try {
            $people = ModuleTypeOfEthnics::find( $request->input('id') );
            return response()->json(['error'=> false, 'people'=>$people]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleTypeOfEthnicsRequest::rules($request->input('id')), ModuleTypeOfEthnicsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleTypeOfEthnics::create($input);
                $html = $this->dataTable($request->input());
                LogsController::write("AITypeOfEthnics", "Thêm", "Dân tộc: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Thêm dân tộc thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm dân tộc thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleTypeOfEthnicsRequest::rules($request->input('id')), ModuleTypeOfEthnicsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $people = ModuleTypeOfEthnics::find( $request->input('id') );
                $people->update($input);
                $html = $this->dataTable($request->input());
                LogsController::write("AITypeOfEthnics", "Sửa", "Dân tộc: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Sửa dân tộc thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa dân tộc thất bại']);
        }
    }
    public function delete($request){
        try {
            $people_id = $request->input('id');
            $people = ModuleTypeOfEthnics::find( $people_id );
            $people->delete();
            LogsController::write("AITypeOfEthnics", "Xoá", "Dân tộc: ".$people->name);
            
            $html = $this->dataTable($request->input());
            return response()->json(['error'=> false, 'message' => 'Xóa dân tộc thành công', 'table_html' => $html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa dân tộc thất bại']);
        }
    }
}
