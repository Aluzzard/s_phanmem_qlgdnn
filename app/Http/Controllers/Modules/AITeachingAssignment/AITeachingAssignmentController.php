<?php

namespace App\Http\Controllers\Modules\AITeachingAssignment;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use DateTime;
//Models
use App\Models\Modules\ModuleTeachingAssignment;
use App\Models\Modules\ModuleOfficerInformations;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;

//Requests
use App\Http\Requests\Module\ModuleTeachingAssignmentRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AITeachingAssignmentController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->with(['courses' => function($query) {
                $query->orderBy('year', 'desc')->orderBy('name', 'desc');
            }])->get();

            $data['teachers'] = ModuleOfficerInformations::whereIdSite($current_id_site)->get();

            return view('modules.AITeachingAssignment.index', $data);
        }
    }

    public function ajax(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'loadCalendar' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->loadCalendar($request);
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
        $listofpeoples = ModuleTeachingAssignment::whereIdSite($current_id_site)->get();
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
    public function loadCalendar(Request $request) {
        try{
            $number_arrange = 0;
            $items = ModuleTeachingAssignment::whereIdCourse( $request->input('id_course') )
                                    ->get();
            $number_days_specialty = ModuleTypeOfCourses::find( $request->input('id_course') )
                                    ->training_specialty
                                    ->duration_by_day;
            $number_of_days = $this->partial_numberday($request);
            return response()->json(['error'=>false, 'items' => $items, 'number_of_days' => $number_of_days, 'number_days_specialty' => $number_days_specialty]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function view($request){
        try {
            $people = ModuleTeachingAssignment::find( $request->input('id') );
            return response()->json(['error'=> false, 'people'=>$people]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            if( $this->partial_check_add($request) == false ) {
                return response()->json(['error'=> true, 'message' => 'Giáo viên đã trùng lịch dạy!']);
            } 
            else if ( $this->partial_check_numberday($request) == false ) {
                return response()->json(['error'=> true, 'message' => 'Đã đạt giới hạn ngày dạy!']);
            }
            else {
                $input = $request->all();
                $input['id_officer'] = $request->input('id');
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleTeachingAssignment::create($input);

                // LogsController::write("AITeachingAssignment", "Thêm", "Chức vụ cán bộ: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Thêm thành công']);
            }                
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm chức vụ cán bộ thất bại']);
        }
    }
    public function edit($request){
        try {
            if( $this->partial_check_add($request) == false ) {
                return response()->json(['error'=> true, 'message' => 'Giáo viên đã trùng lịch dạy!']);
            } 
            else if ( $this->partial_check_numberday($request) == false ) {
                return response()->json(['error'=> true, 'message' => 'Đã đạt giới hạn ngày dạy!']);
            }
            else {
                $input = $request->all();
                
                $input['start_time'] = $request->input('start_time');
                $input['start_time'] = preg_replace('/\s\(.*\)/', '', $input['start_time']);
                $input['start_time'] = date('Y-m-d', strtotime($input['start_time']));

                $input['end_time'] = $request->input('end_time');
                $input['end_time'] = preg_replace('/\s\(.*\)/', '', $input['end_time']);
                $input['end_time'] = date('Y-m-d', strtotime($input['end_time']));
                
                $assignment = ModuleTeachingAssignment::find( $request->input('id') );
                $assignment->update($input);
            
                // LogsController::write("AITeachingAssignment", "Sửa", "Chức vụ cán bộ: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Điều chỉnh thành công']);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa chức vụ cán bộ thất bại']);
        }
    }
    public function delete($request){
        try {
            $assignment = ModuleTeachingAssignment::find( $request->input('id') );
            $assignment->delete();
            // LogsController::write("AITeachingAssignment", "Xoá", "Chức vụ cán bộ: ".$people->name);
            
            return response()->json(['error'=> false, 'message' => 'Xóa thành công']);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa chức vụ cán bộ thất bại']);
        }
    }

    //Hàm check đã tồn tại lịch
    public function partial_check_add(Request $request){
        $check = true;
        
        //Thu Sep 07 2023 07:00:00 GMT+0700 (Indochina Time) -> 2023-09-07
        if($request->input('action_type') != 'add' ){
            $input_start_time = $request->input('start_time');
            $input_start_time = preg_replace('/\s\(.*\)/', '', $input_start_time);
            $input_start_time = date('Y-m-d', strtotime($input_start_time));

            $input_end_time = $request->input('end_time');
            $input_end_time = preg_replace('/\s\(.*\)/', '', $input_end_time);
            $input_end_time = date('Y-m-d', strtotime($input_end_time));
        } 
        // 2023-09-03
        else {
            $input_start_time = $request->input('start_time');
            $input_end_time = $request->input('end_time');
        }

        $query = ModuleTeachingAssignment::whereIdSite(Auth::guard('user')->user()->id_site)
                                ->whereIdCourse($request->input('id_course'));

        if ($request->input('action_type') != 'add') {
            $query->where('id', '!=', $request->input('id'));
        }

        $array = $query->get();

        foreach ($array as $item) {
            $start_time = $item->start_time;
            $end_time = $item->end_time;

            if( ($start_time < $input_start_time && $input_start_time < $end_time) || ($start_time < $input_end_time && $input_end_time < $end_time) ) {
                $check = false;   
            } 
            else if ( ($input_start_time < $start_time && $start_time < $input_end_time) || ($input_start_time < $end_time && $end_time < $input_end_time) ) {
                $check = false;
            }
            else if ( ($start_time <= $input_start_time && $input_start_time < $end_time) || ($start_time < $input_end_time && $input_end_time <= $end_time) ) {
                $check = false;
            }
        }
        return $check;
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
        //Số ngày được thêm vào
        if($request->input('action_type') == 'add'){
            $number_add = 1;
        } else {
            $number_add = 0;
            $start_time = $request->input('start_time');
            $start_time = preg_replace('/\s\(.*\)/', '', $start_time);
            $start_time = date('Y-m-d', strtotime($start_time));

            $end_time = $request->input('end_time');
            $end_time = preg_replace('/\s\(.*\)/', '', $end_time);
            $end_time = date('Y-m-d', strtotime($end_time));

            $start_time = new DateTime($start_time);
            $end_time = new DateTime($end_time);
            $diff = $end_time->diff($start_time);
            $number_add += $diff->days;
        }

        if( ($number_of_days + $number_add) > $number_days_specialty ) $check = false;
        return $check;
    }
    //Hàm cắt chuỗi
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
