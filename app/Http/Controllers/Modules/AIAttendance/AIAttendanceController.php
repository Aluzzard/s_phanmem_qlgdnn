<?php

namespace App\Http\Controllers\Modules\AIAttendance;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use DateTime;

//Models
use App\Models\Modules\ModuleAttendance;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\ModuleTeachingAssignment;

//Requests
use App\Http\Requests\Module\ModuleAttendanceRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIAttendanceController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->with(['courses' => function($query) {
                $query->orderBy('year', 'desc')->orderBy('name', 'desc');
            }])->get();

            return view('modules.AIAttendance.index', $data);
        }
    }

    public function ajax(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'loadTableAttendance' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    if( $this->partial_check_numberday($request) == true ) {
                        return $this->loadTableAttendance($request);
                    } else {
                        return response()->json(['validate'=>false, 'message'=> 'Khóa học chưa được phân công giảng dạy đủ số buổi!']);
                    }
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
        } else {
            abort('404');
        }
    }
    
    public function dataTableAttendance(Request $request){
        $assignments = ModuleTeachingAssignment::whereIdCourse( $request->input('id_course') )
                                                    ->orderBy('start_time')
                                                    ->get();
        $attendances = ModuleAttendance::whereIdCourse( $request->input('id_course') )
                                                    ->get();
        
        $html = '<table><thead>';
        $html .= '   <tr>';
        $html .= '       <th>Tên học viên</th>';
        $html .= '       <th>Đã vắng</th>';


        $resultArray = [];
        foreach ($assignments as $item) {
            $startDate = new DateTime($item["start_time"]);
            $endDate = new DateTime($item["end_time"]);

            while ($startDate < $endDate) {
                $resultArray[] = $startDate->format("d/m/Y");
                $startDate->modify("+1 day");
            }
        }
        $newArray = [];
        $temp = 0;
        foreach ($resultArray as $date) {
            $parts = explode('/', $date);
            $newDate = $parts[0];
            if ($temp != $parts[1]) {
                $newDate .= '</br>/' . $parts[1];
            }
            $temp = $parts[1];
            $newArray[] = $newDate;
        }
        foreach($newArray as $item) {
            $html .= '   <th>'.$item.'</th>';
        }

        $html .= '   </tr>';
        $html .= '</thead>';
        $html .= '<tbody>';
        foreach($attendances as $attendance) {
            $temp = explode(",", $attendance->attendance );
        
            $html .= '   <tr data-id-student="'.$attendance->id_student.'">';
            $html .= '      <td>'.$attendance->student->last_name.' '.$attendance->student->first_name.'</td>';
            $html .= '   <td>'.(substr_count($attendance->attendance, "K") + substr_count($attendance->attendance, "P")).'</td>';

            for($i = 0; $i < count($temp); $i++) {
                if($temp[$i] == '0') {
                    $html .= '  <td class="box-attendance"></td>';
                } else {
                    $html .= '  <td class="box-attendance">'.$temp[$i].'</td>';
                }
            }
            $html .= '   </tr>';
        }

        $html .= '</tbody>';
        $html .= '</table>';
        return $html;
    }
    public function loadTableAttendance($request){
        try {
            $html = $this->dataTableAttendance($request);
            
            return response()->json(['error'=> false, 'html'=>$html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleAttendanceRequest::rules($request->input('id')), ModuleAttendanceRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $array_is_checked = $request->input('array_is_checked');
                $id_training_specialty = ModuleTypeOfCourses::find($request->input('id_course'))->id_training_specialty;
                foreach($array_is_checked as $item){
                    $attendance = ModuleAttendance::whereIdStudent($item['id_student'])
                                                        ->first();
                    if($attendance){
                        $attendance->attendance = $item['attendance'];
                        $attendance->update();
                    } else {
                        $attendance = new ModuleAttendance;
                        $attendance->id_site = Auth::guard('user')->user()->id_site;
                        $attendance->id_student = $item['id_student'];
                        $attendance->attendance = $item['attendance'];
                        $attendance->id_course = $request->input('id_course');
                        $attendance->save();
                    }
                }                
                return response()->json(['error'=> false, 'message' => 'Điểm danh thành công']);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Điểm danh thất bại']);
        }
    }
    //Hàm kiểm tra số ngày trong khóa học
    public function partial_check_numberday(Request $request){
        $check = true;
        //Số ngày bắt buộc phải nhập
        $number_days_specialty = ModuleTypeOfCourses::find( $request->input('id_course') )
                                    ->training_specialty
                                    ->duration_by_day;
        //Số ngày thực tế đã nhập
        $number_of_days = $this->partial_numberday( $request );

        if( $number_of_days != $number_days_specialty ) $check = false;
        return $check;
    }
    public function partial_numberday(Request $request){
        $query = ModuleTeachingAssignment::whereIdSite( Auth::guard('user')->user()->id_site )
                                        ->whereIdCourse( $request->input('id_course') );
        if ($request->input('action_type') != 'add') {
            $query->where('id', '!=', $request->input('id'));
        }

        $array = $query->get();

        $number_of_days = 0;
        foreach ($array as $item) {
            $start_time = new DateTime($item["start_time"]);
            $end_time = new DateTime($item["end_time"]);
            $diff = $end_time->diff($start_time);
            $number_of_days += $diff->days;
        }
        return $number_of_days;
    }
}
