<?php

namespace App\Http\Controllers\Modules\AIOfficerAssessmentProcess;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleOfficerInformations;
use App\Models\Modules\ModuleOfficerAssessmentProcess;
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\ModuleTypeOfSemesters;
//Requests
use App\Http\Requests\Module\ModuleOfficerAssessmentProcessRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIOfficerAssessmentProcessController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            $data['courses'] = ModuleTypeOfCourses::whereIdSite($current_id_site)->get();
            $data['semesters'] = ModuleTypeOfSemesters::whereIdSite($current_id_site)->get();
            return view('modules.AIOfficerAssessmentProcess.index', $data);
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
            else if ($action_type == 'viewList' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->viewList($request);
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
        $officers = ModuleOfficerInformations::whereIdSite($current_id_site)->get();
        $html = '';
        if($officers){
            foreach ($officers as $officer){
                $html .= '<tr>';
                $html .= '  <td>'.$officer->name.'</td>';
                $html .= '  <td>'.date('d/m/Y', strtotime($officer->date_of_birth)).'</td>';    
                $html .= '  <td>';
                $html .= '      <div class="button-ap-list responsive-btn">
                                    <div class="btn-group btn-custom-groups btn-custom-groups-one btn-mg-b-10">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Thao tác <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu btn-dropdown-menu" role="menu">';
                // if( GlobalFunction::checkRoleModuleByUser('view') == true){
                // $html .= '                  <li>
                //                                 <a data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`viewList`,'.$officer->id.')"><i class="fa fa-eye pr-3"></i>Xem</a>
                //                             </li>';
                // }
                if( GlobalFunction::checkRoleModuleByUser('edit') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`editList`,'.$officer->id.')"><i class="fa fa-pencil pr-3"></i>Chỉnh sửa</a>
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
    public function dataListWorkProgress($id_officer){
        $html = '';
        $list = ModuleOfficerAssessmentProcess::whereIdOfficer($id_officer)->get();
        if($list){
            foreach ($list as $item){
                $html .= '<tr onclick="func_buttonClick(`edit`,'.$item->id.')">';
                $html .= '  <td>'.$item->course->name.'</td>';
                $html .= '  <td>'.$item->semester->name.'</td>';
                if($item->health_assessment == 1){
                    $html .= '  <td>Tốt</td>';
                } elseif($item->health_assessment == 2){
                    $html .= '  <td>Khá</td>';
                } elseif($item->health_assessment == 3){
                    $html .= '  <td>Trung bình</td>';
                } else {
                    $html .= '  <td>Kém</td>';
                }
                if($item->moral_assessment == 1){
                    $html .= '  <td>Tốt</td>';
                } elseif($item->moral_assessment == 2){
                    $html .= '  <td>Khá</td>';
                } elseif($item->moral_assessment == 3){
                    $html .= '  <td>Trung bình</td>';
                } else {
                    $html .= '  <td>Kém</td>';
                }
                if($item->professional_assessment == 1){
                    $html .= '  <td>Giỏi</td>';
                } elseif($item->professional_assessment == 2){
                    $html .= '  <td>Khá</td>';
                } elseif($item->professional_assessment == 3){
                    $html .= '  <td>Trung bình</td>';
                } else {
                    $html .= '  <td>Yếu</td>';
                }
                if($item->general_assessment == 1){
                    $html .= '  <td>Tốt</td>';
                } elseif($item->general_assessment == 2){
                    $html .= '  <td>Khá</td>';
                } elseif($item->general_assessment == 3){
                    $html .= '  <td>Trung bình</td>';
                } else {
                    $html .= '  <td>Kém</td>';
                }
                $html .= '  <td>'.$item->note.'</td>';
                $html .= '  <td>';
                $html .= '      <button type="button" class="btn btn-custon-four btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delete`,'.$item->id.')">
                                    <i class="fa big-icon fa-times"></i><span class="ml-2">Xóa</span>
                                </button>';
                $html .= '  </td>';
                $html .= '</tr>';
            }
        }
        return $html;
    }
    public function loaddt(Request $request) {
        try{
            $table_html = $this->dataTable();
            return response()->json(['error'=>false, 'table_html' => $table_html]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function viewList($request){
        try {
            $table_html = $this->dataListWorkProgress($request->input('id'));
            return response()->json(['error'=> false, 'table_html'=>$table_html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function view($request){
        try {
            $officer = ModuleOfficerAssessmentProcess::find( $request->input('id') );
            return response()->json(['error'=> false, 'officer'=>$officer]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleOfficerAssessmentProcessRequest::rules($request->input('id')), ModuleOfficerAssessmentProcessRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleOfficerAssessmentProcess::create($input);
                $html = $this->dataListWorkProgress($input['id_officer']);

                $name_officer_for_log = ModuleOfficerInformations::whereId($input['id_officer'])->first()->name;
                LogsController::write("AIOfficerAssessmentProcess", "Thêm", "Quá trình đào tạo chuyên môn nghiệp vụ: ".$input["specialized"]."của người dùng ".$name_officer_for_log);
                return response()->json(['error'=> false, 'message' => 'Thêm quá trình đào tạo chuyên môn nghiệp vụ thành công', 'html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm quá trình đào tạo chuyên môn nghiệp vụ thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleOfficerAssessmentProcessRequest::rules($request->input('id')), ModuleOfficerAssessmentProcessRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $officer = ModuleOfficerAssessmentProcess::find( $request->input('id') );
                $officer->update($input);
                $html = $this->dataListWorkProgress($input['id_officer']);

                $name_officer_for_log = ModuleOfficerInformations::whereId($input['id_officer'])->first()->name;
                LogsController::write("AIOfficerAssessmentProcess", "Sửa", "Quả trình đào tạo chuyên môn nghiệp vụ: ".$name_officer_for_log);
                return response()->json(['error'=> false, 'message' => 'Sửa quá trình đào tạo chuyên môn nghiệp vụ thành công', 'html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa quá trình đào tạo chuyên môn nghiệp vụ thất bại']);
        }
    }
    public function delete($request){
        try {
            $officer = ModuleOfficerAssessmentProcess::find( $request->input('id') );
            $officer->delete();
            LogsController::write("AIOfficerAssessmentProcess", "Xoá", "Quá trình đào tạo chuyên môn nghiệp vụ: ".$officer->name);
            
            $html = $this->dataListWorkProgress($officer->id_officer);
            return response()->json(['error'=> false, 'message' => 'Xóa quá trình đào tạo chuyên môn nghiệp vụ thành công', 'html' => $html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa quá trình đào tạo chuyên môn nghiệp vụ thất bại']);
        }
    }
}
