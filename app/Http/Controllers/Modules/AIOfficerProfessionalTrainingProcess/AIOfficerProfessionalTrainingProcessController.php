<?php

namespace App\Http\Controllers\Modules\AIOfficerProfessionalTrainingProcess;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleOfficerInformations;
use App\Models\Modules\ModuleOfficerProfessionalTrainingProcess;
use App\Models\Modules\ModuleTypeOfTrainingForms;
use App\Models\Modules\ModuleTypeOfCertificates;
//Requests
use App\Http\Requests\Module\ModuleOfficerProfessionalTrainingProcessRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIOfficerProfessionalTrainingProcessController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            $data['training_forms'] = ModuleTypeOfTrainingForms::whereIdSite($current_id_site)->get();
            $data['certificates'] = ModuleTypeOfCertificates::whereIdSite($current_id_site)->get();
            return view('modules.AIOfficerProfessionalTrainingProcess.index', $data);
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
                $html .= '  <td>';
                if($officer->professional_training_process) 
                    foreach($officer->professional_training_process->sortBy('from_the_time') as $t) 
                        $html .= '<p>'.$t->specialized.' - '.$t->school_name.'</p>';
                $html .= '  </td>';    
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
        $list = ModuleOfficerProfessionalTrainingProcess::whereIdOfficer($id_officer)->get();
        if($list){
            foreach ($list as $item){
                $html .= '<tr onclick="func_buttonClick(`edit`,'.$item->id.')">';
                $html .= '  <td>'.$item->school_name.'</td>';
                $html .= '  <td>'.$item->specialized.'</td>';
                $html .= '  <td>'.$item->from_the_time.'</td>';
                $html .= '  <td>'.$item->till_the_time.'</td>';
                $html .= '  <td>'.$item->training_form->name.'</td>';
                $html .= '  <td>'.$item->certificate->name.'</td>';
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
            $officer = ModuleOfficerProfessionalTrainingProcess::find( $request->input('id') );
            return response()->json(['error'=> false, 'officer'=>$officer]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleOfficerProfessionalTrainingProcessRequest::rules($request->input('id')), ModuleOfficerProfessionalTrainingProcessRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleOfficerProfessionalTrainingProcess::create($input);
                $html = $this->dataListWorkProgress($input['id_officer']);

                $name_officer_for_log = ModuleOfficerInformations::whereId($input['id_officer'])->first()->name;
                LogsController::write("AIOfficerProfessionalTrainingProcess", "Thêm", "Quá trình đào tạo chuyên môn nghiệp vụ: ".$input["information"]."của người dùng ".$name_officer_for_log);
                return response()->json(['error'=> false, 'message' => 'Thêm quá trình đào tạo chuyên môn nghiệp vụ thành công', 'html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm quá trình đào tạo chuyên môn nghiệp vụ thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleOfficerProfessionalTrainingProcessRequest::rules($request->input('id')), ModuleOfficerProfessionalTrainingProcessRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $officer = ModuleOfficerProfessionalTrainingProcess::find( $request->input('id') );
                $officer->update($input);
                $html = $this->dataListWorkProgress($input['id_officer']);

                $name_officer_for_log = ModuleOfficerInformations::whereId($input['id_officer'])->first()->name;
                LogsController::write("AIOfficerProfessionalTrainingProcess", "Sửa", "Quả trình đào tạo chuyên môn nghiệp vụ: ".$name_officer_for_log);
                return response()->json(['error'=> false, 'message' => 'Sửa quá trình đào tạo chuyên môn nghiệp vụ thành công', 'html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa quá trình đào tạo chuyên môn nghiệp vụ thất bại']);
        }
    }
    public function delete($request){
        try {
            $officer = ModuleOfficerProfessionalTrainingProcess::find( $request->input('id') );
            $officer->delete();
            LogsController::write("AIOfficerProfessionalTrainingProcess", "Xoá", "Quá trình đào tạo chuyên môn nghiệp vụ: ".$officer->name);
            
            $html = $this->dataListWorkProgress($officer->id_officer);
            return response()->json(['error'=> false, 'message' => 'Xóa quá trình đào tạo chuyên môn nghiệp vụ thành công', 'html' => $html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa quá trình đào tạo chuyên môn nghiệp vụ thất bại']);
        }
    }
}
