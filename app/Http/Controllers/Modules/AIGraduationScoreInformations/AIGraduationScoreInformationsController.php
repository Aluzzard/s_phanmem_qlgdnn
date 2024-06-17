<?php

namespace App\Http\Controllers\Modules\AIGraduationScoreInformations;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleGraduationScoreInformations;
use App\Models\Modules\ModuleTypeOfEthnics;
use App\Models\Modules\ModuleTypeOfReligions;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
//Requests
use App\Http\Requests\Module\ModuleGraduationScoreInformationsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIGraduationScoreInformationsController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->get();
            $data['courses'] = ModuleTypeOfCourses::whereIdSite($current_id_site)
                                                    ->whereIdTrainingSpecialty($data['training_specialties']->first()->id)
                                                    ->get();
            $data['ethnics'] = ModuleTypeOfEthnics::whereIdSite($current_id_site)->get();
            $data['regions'] = ModuleTypeOfReligions::whereIdSite($current_id_site)->get();
            return view('modules.AIGraduationScoreInformations.index', $data);
        }
    }

    public function ajax(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'course' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->course($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if ($action_type == 'loaddt' ) {
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
    
    public function dataTable(Request $request){
        $current_id_site = Auth::guard('user')->user()->id_site;
        $id_training_specialty = $request->input('id_training_specialty');
        $id_course = $request->input('id_course');
        $items = ModuleGraduationScoreInformations::whereIdSite($current_id_site)
                                    ->where(function($query) use ( $id_training_specialty ) {
                                        if($id_training_specialty!=0) $query->whereIdTrainingSpecialty($id_training_specialty);
                                    })
                                    ->where(function($query) use ( $id_course ) {
                                        if($id_course!=0) $query->whereIdCourse($id_course);
                                    })
                                    ->get();
        $html = '';
        if($items){
            foreach ($items as $item){
                $html .= '<tr>';
                $html .= '  <td>'.$item->training_specialty->name.'</td>';
                $html .= '  <td>'.$item->course->name.'/'.$item->course->year.'</td>';
                $html .= '  <td>'.$item->student->last_name.' '.$item->student->first_name.'</td>';
                $html .= '  <td>'.$item->subject_1.'</td>';
                $html .= '  <td>'.$item->subject_2.'</td>';
                $html .= '  <td>'.$item->subject_3.'</td>';
                $html .= '  <td>'.$item->subject_4.'</td>';
                $html .= '  <td>'.$item->subject_5.'</td>';
                $html .= '  <td>'.$item->subject_6.'</td>';
                $html .= '  <td>'.$item->theory.'</td>';
                $html .= '  <td>'.$item->practice.'</td>';
                $html .= '  <td>'.$item->final_score.'</td>';
                $html .= '  <td>'.$item->average.'</td>';
                $html .= '  <td>'.$item->classification.'</td>';
                $html .= '  <td>';
                $html .= '      <div class="button-ap-list responsive-btn">
                                    <div class="btn-group btn-custom-groups btn-custom-groups-one btn-mg-b-10">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Thao tác <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu btn-dropdown-menu" role="menu">';
                if( GlobalFunction::checkRoleModuleByUser('edit') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$item->id.')"><i class="fa fa-edit pr-3"></i>Sửa</a>
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
    public function course(Request $request) {
        try{
            $courses = ModuleTypeOfCourses::whereIdTrainingSpecialty($request->input('id'))->get();
            return response()->json(['error'=>false, 'courses' => $courses]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function loaddt(Request $request) {
        try{
            $table_html = $this->dataTable($request);
            return response()->json(['error'=>false, 'table_html' => $table_html]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function view($request){
        try {
            $item = ModuleGraduationScoreInformations::find( $request->input('id') );
            return response()->json(['error'=> false, 'item'=>$item]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleGraduationScoreInformationsRequest::rules($request->input('id')), ModuleGraduationScoreInformationsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $people = ModuleGraduationScoreInformations::find( $request->input('id') );
                $people->update($input);
                $html = $this->dataTable($request);
                
                return response()->json(['error'=> false, 'message' => 'Sửa điểm học viên thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa điểm học viên thất bại']);
        }
    }
}
