<?php

namespace App\Http\Controllers\Modules\AIManageStudents;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

//Models
use App\Models\Modules\ModuleManageStudents;
use App\Models\Modules\ModuleTypeOfEthnics;
use App\Models\Modules\ModuleTypeOfReligions;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\ModuleGraduationScoreInformations;
use App\Models\Modules\ModuleVocationalEducationPolicities;
use App\Models\Modules\ModuleAttendance;
//Requests
use App\Http\Requests\Module\ModuleManageStudentsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;
//Imports
use App\Imports\TemplateStudentsImport;
use Maatwebsite\Excel\Facades\Excel;
//Exports
use App\Exports\TemplateStudentsExport;

class AIManageStudentsController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
            abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->with(['courses' => function($query) {
                $query->orderBy('year', 'desc')->orderBy('name', 'desc');
            }])->get();
            $data['ethnics'] = ModuleTypeOfEthnics::whereIdSite($current_id_site)->get();
            $data['regions'] = ModuleTypeOfReligions::whereIdSite($current_id_site)->get();
            $data['vocational_education_policities'] = ModuleVocationalEducationPolicities::whereIdSite($current_id_site)->get();

            return view('modules.AIManageStudents.index', $data);
        }
    }

    public function downloadTemplate(){
        return Excel::download(new TemplateStudentsExport, 'Mẫu nhập học viên.xlsx');
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
    
    public function dataTable(Request $request){
        $current_id_site = Auth::guard('user')->user()->id_site;
        $id_course = $request->input('id_course');
        $items = ModuleManageStudents::whereIdSite($current_id_site)
                                    ->whereIdCourse($id_course)
                                    ->orderBy('is_active', 'desc')
                                    ->orderBy('first_name')
                                    ->get();
        $html = '';
        if($items){
            foreach ($items as $item){
                $html .= '<tr>';
                $html .= '  <td>'.$item->last_name.' '.$item->first_name.'</td>';
                $html .= ($item->is_active == 1) ? '<td class="text-success"><strong>Đang học</strong></td>' : '<td class="text-danger"><strong>Đã nghỉ</strong></td>';
                $html .= '  <td>'.(($item->gender == 'nam') ? 'Nam' : 'Nữ').'</td>';
                $html .= '  <td>'.date('d/m/Y', strtotime($item->date_of_birth)).'</td>';
                $html .= '  <td>'.$item->ethnic->name.'</td>';
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
                if( GlobalFunction::checkRoleModuleByUser('delete') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delete`,'.$item->id.')"><i class="fa fa-recycle pr-3"></i>Xóa</a>
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
            $table_html = $this->dataTable($request);
            return response()->json(['error'=>false, 'table_html' => $table_html]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function view($request){
        try {
            $item = ModuleManageStudents::find( $request->input('id') );
            return response()->json(['error'=> false, 'item'=>$item]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleManageStudentsRequest::rules($request->input('id')), ModuleManageStudentsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $fullName = $request->input('name');
                // Tách tên và họ
                $parts = explode(' ', $fullName);
                $firstName = array_pop($parts); // Lấy tên (phần cuối cùng)
                $lastName = implode(' ', $parts); // Ghép các phần còn lại thành họ và chữ đệm
                // Gán giá trị vào $input
                $input['first_name'] = $firstName;
                $input['last_name'] = $lastName;
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                $id_student = ModuleManageStudents::create($input)->id;

                //Thêm vào quản lý điểm
                $input_score['id_site'] = Auth::guard('user')->user()->id_site;
                $input_score['id_student'] = $id_student;
                $input_score['id_course'] = $request->input('id_course');
                ModuleGraduationScoreInformations::create($input_score);
                //Thêm vào quản lý điểm danh
                $input_attendance['id_site'] = Auth::guard('user')->user()->id_site;
                $input_attendance['id_student'] = $id_student;
                $input_attendance['id_course'] = $request->input('id_course');
                $information_course = ModuleTypeOfCourses::find( $request->input('id_course') );
                $information_training_specialty = ModuleTrainingSpecialties::find($information_course->id_training_specialty)->duration_by_day;
                $attendances = '';
                for( $i=0; $i<$information_training_specialty; $i++ ) {
                    $attendances .= ',0';
                }
                $input_attendance['attendance'] = substr($attendances, 1);
                ModuleAttendance::create($input_attendance);

                LogsController::write("AIManageStudents", "Thêm", "Thông tin học viên: ".$input["name"]);

                $html = $this->dataTable($request);
                return response()->json(['error'=> false, 'message' => 'Thêm thông tin học viên thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm thông tin học viên thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleManageStudentsRequest::rules($request->input('id')), ModuleManageStudentsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $item = ModuleManageStudents::find($request->input('id'));
                $input = $request->all();

                // Tách tên và họ từ đầu vào
                $fullName = $request->input('name');
                $parts = explode(' ', $fullName);
                $firstName = array_pop($parts); // Lấy tên (phần cuối cùng)
                $lastName = implode(' ', $parts); // Ghép các phần còn lại thành họ và chữ đệm

                // Gán giá trị vào $input
                $input['first_name'] = $firstName;
                $input['last_name'] = $lastName;
                $input['is_active'] = ($request->input('is_active') == 1 ? 1 : 0);

                // Cập nhật dữ liệu
                $item->update($input);

                LogsController::write("AIManageStudents", "Sửa", "Thông tin học viên: ".$input["name"]);

                $html = $this->dataTable($request);
                return response()->json(['error'=> false, 'message' => 'Sửa thông tin học viên thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa thông tin học viên thất bại']);
        }
    }
    public function delete($request){
        try {
            $id_item = $request->input('id');    
            $item = ModuleManageStudents::find( $id_item );
            $item->delete();
  
            LogsController::write("AIManageStudents", "Xoá", "Thông tin học viên: ".$item->last_name." ".$item->first_name);

            return response()->json(['error'=> false, 'message' => 'Xóa thông tin học viên thành công']);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa thông tin học viên thất bại']);
        }
    }

// Import Excel
// ---------------------------------------------------------------------------------------------
    public function ajaxImports(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'preview' ) {
                if( GlobalFunction::checkRoleModuleByUser('add') == true ){
                    $array = Excel::toArray(new TemplateStudentsImport, request()->file('file_import'));
                    $array = $this->filterVisibleColumns($array[0]);

                    if( $this->checkOverlap($array) == 0 ) {
                        return response()->json(['error'=>false, 'array'=>$array]);
                    } 
                    else {
                        return response()->json(['error'=>true, 'message'=>'Có học sinh trùng nhau, vui lòng kiểm tra lại CCCD/CMND!']);
                    }
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            } else if ($action_type == 'upload' ) {
                if( GlobalFunction::checkRoleModuleByUser('add') == true ){
                    $array = Excel::toArray(new TemplateStudentsImport, request()->file('file_import'));
                    $array = $this->filterVisibleColumns($array[0]);

                    $array_check = [];
                    //Kiểm tra validate từng người
                    foreach($array as $key=>$item) {
                        $temp = ModuleManageStudents::whereIdCourse($request->input('id_course'))
                                                ->whereIdentificationIdCard($item[4])
                                                ->get();
                        if(count($temp) > 0) {
                            array_push($array_check, $key+1);
                        }
                    }
                    if( count($array_check) == 0 ) {
                        foreach($array as $item) {
                            $this->addImport($request, $item);
                        }
                        return response()->json(['error'=>false, 'message'=>'Đã thêm '.count($array).' học viên thành công!']);
                    } 
                    else {
                        return response()->json(['error'=>true, 'message'=>'Các dòng '.implode(', ', $array_check).' đã tồn tại trong dữ liệu!']);
                    }
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            
        } else {
            abort('404');
        }
    }

    public function checkOverlap($data) {
        $cccdCheck = [];

        foreach ($data as $item) {
            // Kiểm tra CCCD/CMND
            if ($item[4] !== null) {
                if (isset($cccdCheck[$item[4]])) {
                    return 1; // Trùng CCCD/CMND
                }
                $cccdCheck[$item[4]] = true;
            }
        }

        return 0; // Không có trùng lặp
    }

    public function addImport($request, $item) {
        // Tách tên và họ từ $item[0]
        $fullName = $item[0];
        $parts = explode(' ', $fullName);
        $firstName = array_pop($parts); // Lấy tên (phần cuối cùng)
        $lastName = implode(' ', $parts); // Ghép các phần còn lại thành họ và chữ đệm

        // Gán giá trị vào $input
        $input['first_name'] = $firstName;
        $input['last_name'] = $lastName;
        
        $input['id_site']                               = Auth::guard('user')->user()->id_site;
        $input['date_of_birth']                         = $this->convertExcelDate($item[1]);
        $input['numberphone']                           = $item[2];
        $input['email']                                 = $item[3];
        $input['identification_id_card']                = $item[4];
        $input['date_of_issue']                         = $this->convertExcelDate($item[5]);
        $input['department_of_issue']                   = $item[6];
        $input['permanent_residence']                   = $item[7];
        $input['place_of_live']                         = $item[8];
        $input['id_ethnic']                             = ModuleTypeOfEthnics::whereName($item[9])->first()->id ?? null;
        $input['region' ]                               = ModuleTypeOfReligions::whereName($item[10])->first()->id ?? null;
        $input['gender']                                = $item[11] == "Nam" ? "nam" : "nu";
        $input['is_active']                             = '1';
        $input['class']                                 = $item[12];
        $input['policy']                                = ModuleVocationalEducationPolicities::whereName($item[13])->first()->id ?? null;
        $input['note']                                  = $item[14];
        $input['id_course']                             = $request->input('id_course');

        $id_student = ModuleManageStudents::create($input)->id;

        //Thêm vào quản lý điểm
        $input_score['id_site'] = Auth::guard('user')->user()->id_site;
        $input_score['id_student'] = $id_student;
        $input_score['id_course'] = $request->input('id_course');
        ModuleGraduationScoreInformations::create($input_score);
        //Thêm vào quản lý điểm danh
        $input_attendance['id_site'] = Auth::guard('user')->user()->id_site;
        $input_attendance['id_student'] = $id_student;
        $input_attendance['id_course'] = $request->input('id_course');

        $information_course = ModuleTypeOfCourses::find( $request->input('id_course') );
        $information_training_specialty = ModuleTrainingSpecialties::find($information_course->id_training_specialty)->duration_by_day;
        $attendances = '';
        for( $i=0; $i<$information_training_specialty; $i++ ) {
            $attendances .= ',0';
        }
        $input_attendance['attendance'] = substr($attendances, 1);
        ModuleAttendance::create($input_attendance);
    }

    public function convertExcelDate($excelDate) {
        // Kiểm tra nếu dữ liệu là năm (4 ký tự và đều là số)
        if (strlen($excelDate) == 4 && ctype_digit($excelDate)) {
            return $excelDate . '-01-01';  // Trả về ngày đầu tiên của năm với định dạng dd/mm/YYYY
        }

        // Xử lý các định dạng ngày tháng khác
        try {
            // Nếu dữ liệu là một số, giả định đây là định dạng ngày của Excel
            if (is_numeric($excelDate)) {
                $date = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($excelDate);
            } else {
                // Nếu dữ liệu có định dạng dd-mm-yy hoặc dd-mm-yyyy
                $date = \DateTime::createFromFormat('d-m-y', $excelDate);
                if (!$date) {
                    $date = \DateTime::createFromFormat('d-m-Y', $excelDate);
                }
            }

            // Nếu chuyển đổi thành công, trả về định dạng dd/mm/YYYY
            if ($date) {
                return $date->format('Y-m-d');
            } else {
                // Nếu định dạng ngày không hợp lệ
                return null; // Hoặc trả về giá trị mặc định, tùy theo yêu cầu của ứng dụng
            }
        } catch (\Exception $e) {
            // Log lỗi hoặc xử lý nếu định dạng ngày không hợp lệ
            return null; // Hoặc trả về giá trị mặc định, tùy theo yêu cầu của ứng dụng
        }
    }


    private function filterVisibleColumns($data) {
        $filteredData = [];
        foreach ($data as $row) {
            // Chỉ lấy các cột hiển thị từ file Excel và bỏ qua các cột không cần thiết
            $filteredRow = [
                $row[0], // Tên học viên
                $row[1], // Ngày sinh
                $row[2], // Số điện thoại
                $row[3], // Email
                $row[4], // CCCD/CMND
                $row[5], // Ngày cấp
                $row[6], // Nơi cấp
                $row[7], // Địa chỉ thường trú
                $row[8], // Nơi ở hiện tại
                $row[9], // Dân tộc
                $row[10], // Tôn giáo
                $row[11], // Giới tính
                $row[12], // Trình độ học vấn
                $row[13], // Chính sách
                $row[14], // Ghi chú
            ];
            
            // Bỏ qua các hàng mà tất cả các giá trị đều trống
            if (array_filter($filteredRow)) {
                $filteredData[] = $filteredRow;
            }
        }
        return $filteredData; // Trả về tất cả các hàng không trống
    }

}
