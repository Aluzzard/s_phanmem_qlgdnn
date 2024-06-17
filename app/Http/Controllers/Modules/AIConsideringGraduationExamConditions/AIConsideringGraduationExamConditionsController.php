<?php

namespace App\Http\Controllers\Modules\AIConsideringGraduationExamConditions;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleAttendance;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
//Requests
use App\Http\Requests\Module\ModuleAttendanceRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIConsideringGraduationExamConditionsController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->get();
            $data['courses'] = ModuleTypeOfCourses::whereIdSite($current_id_site)
                                                    ->whereIdTrainingSpecialty($data['training_specialties']->first()->id)
                                                    ->get();
            
            $attendances = ModuleAttendance::whereIdCourse( 18 )->get();
            $training_specialty = ModuleTrainingSpecialties::whereId( $attendances->first()->id_training_specialty )->first();
            return view('modules.AIConsideringGraduationExamConditions.index', $data);
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
        $html = '';

        if($request->input('id_training_specialty') != 0 && $request->input('id_course') != 0) {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $id_training_specialty = $request->input('id_training_specialty');
            $id_course = $request->input('id_course');
            $attendances = ModuleAttendance::whereIdSite($current_id_site)
                                        ->where(function($query) use ( $id_training_specialty ) {
                                            if($id_training_specialty!=0) $query->whereIdTrainingSpecialty($id_training_specialty);
                                        })
                                        ->where(function($query) use ( $id_course ) {
                                            if($id_course!=0) $query->whereIdCourse($id_course);
                                        })
                                        ->get();
            $information_course = ModuleTypeOfCourses::find($id_course);
            if( count($attendances)>0) {
                $training_specialty = ModuleTrainingSpecialties::whereId( $attendances->first()->id_training_specialty )->first();
                                        
                $html .= '<thead>';
                $html .= '   <tr>';
                $html .= '       <th rowspan="2">Tên học viên</th>';
                $html .= '       <th rowspan="2">Xét</th>';

                $html .= '       <th rowspan="2">Buổi vắng</th>';
                $html .= '       <th rowspan="2">Ngày thi</th>';


                
                $html .= '   <th colspan="'.$training_specialty->duration_by_day.'" data-sortable="false">Buổi</th>';
                
                $html .= '   </tr>';
                $html .= '   <tr>';
                

                for($i = 1; $i <= $training_specialty->duration_by_day; $i++) {
                    $html .= '   <th>'.$i.'</th>';
                }
                $html .= '   </tr>';
                $html .= '</thead>';
                $html .= '<tbody>';

                foreach($attendances as $attendance) {
                    $temp = explode(",", $attendance->attendance );
                    $html .= '   <tr data-id-student="'.$attendance->id_student.'">';
                    $html .= '      <td>'.$attendance->student->last_name.' '.$attendance->student->first_name.'</td>';
                    if( (substr_count($attendance->attendance, "K") + substr_count($attendance->attendance, "P") ) <= 5 ){
                        $html .= '  <td class="text-success"><strong>Đủ điều kiện</strong></td>';
                    } else {
                        $html .= '  <td class="text-danger"><strong>Không điều kiện</strong></td>';
                    }

                    $html .= '      <td>'.(substr_count($attendance->attendance, "K") + substr_count($attendance->attendance, "P") ).'</td>';
                    $html .= '      <td>'.date('d/m/Y',strtotime($information_course->exam_date)).'</td>';

                    for($i = 0; $i < count($temp); $i++) {
                        if($temp[$i] != '0') {
                            $html .= '  <td>'.$temp[$i].'</td>';
                        } else {
                            $html .= '  <td></td>';
                        }
                    }
                    $html .= '   </tr>';
                }
                $html .= '</tbody>';
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

}
