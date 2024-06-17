<?php

namespace App\Http\Controllers\Modules\AIOfficerInformations;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleOfficerInformations;
use App\Models\Modules\ModuleTypeOfEthnics;
use App\Models\Modules\ModuleTypeOfReligions;
use App\Models\Modules\ModuleTypeOfFamilyCompositions;
use App\Models\Modules\ModuleTypeOfTeachingLevels;
//Requests
use App\Http\Requests\Module\ModuleOfficerInformationsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIOfficerInformationsController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            $data['family_compositions'] = ModuleTypeOfFamilyCompositions::whereIdSite($current_id_site)->get();
            $data['teaching_levels'] = ModuleTypeOfTeachingLevels::whereIdSite($current_id_site)->get();
            $data['ethnics'] = ModuleTypeOfEthnics::whereIdSite($current_id_site)->get();
            $data['regions'] = ModuleTypeOfReligions::whereIdSite($current_id_site)->get();
            return view('modules.AIOfficerInformations.index', $data);
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
        $listofpeoples = ModuleOfficerInformations::whereIdSite($current_id_site)->get();
        $html = '';
        if($listofpeoples){
            foreach ($listofpeoples as $people){
                $html .= '<tr>';
                $html .= '  <td>'.$people->name.'</td>';
                $html .= ($people->gender == 'nam') ? '<td>Nam</td>' : '<td>Nữ</td>';
                $html .= '  <td>'.$people->date_of_birth.'</td>';
                $html .= '  <td>'.$people->numberphone.'</td>';
                $html .= '  <td>'.$people->email.'</td>';
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
            $people = ModuleOfficerInformations::find( $request->input('id') );
            return response()->json(['error'=> false, 'people'=>$people]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleOfficerInformationsRequest::rules($request->input('id')), ModuleOfficerInformationsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleOfficerInformations::create($input);
                $html = $this->dataTable($request->input());
                LogsController::write("AIOfficerInformations", "Thêm", "Thông tin cán bộ, giáo viên: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Thêm thông tin cán bộ, giáo viên thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm thông tin cán bộ, giáo viên thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleOfficerInformationsRequest::rules($request->input('id')), ModuleOfficerInformationsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $people = ModuleOfficerInformations::find( $request->input('id') );
                $people->update($input);
                $html = $this->dataTable($request->input());
                LogsController::write("AIOfficerInformations", "Sửa", "Thông tin cán bộ, giáo viên: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Sửa thông tin cán bộ, giáo viên thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa thông tin cán bộ, giáo viên thất bại']);
        }
    }
    public function delete($request){
        try {
            $people_id = $request->input('id');
            $people = ModuleOfficerInformations::find( $people_id );
            $people->delete();
            LogsController::write("AIOfficerInformations", "Xoá", "Thông tin cán bộ, giáo viên: ".$people->name);
            
            $html = $this->dataTable($request->input());
            return response()->json(['error'=> false, 'message' => 'Xóa thông tin cán bộ, giáo viên thành công', 'table_html' => $html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa thông tin cán bộ, giáo viên thất bại']);
        }
    }
}
