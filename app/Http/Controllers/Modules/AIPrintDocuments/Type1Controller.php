<?php

namespace App\Http\Controllers\Modules\AIPrintDocuments;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\ModuleVocationalEducationPolicities;
use App\Models\Modules\ModuleConfigPrintDocuments;
//Requests
use App\Http\Requests\Module\ModuleIntegratedStatisticsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;
//Export
use App\Exports\Form1Export;
use Maatwebsite\Excel\Facades\Excel;

class Type1Controller extends Controller {

    public static function callback($request){
        $data = self::table_html($request);
        
        $configured = ModuleConfigPrintDocuments::whereIdUser( Auth::guard('user')->id() )
                                                ->whereType( 1 )
                                                ->first();
        if($configured){
            $configured->config = json_encode($request->input());
            $configured->update();
        } else {
            $input['id_user'] = Auth::guard('user')->id();
            $input['type'] = 1;
            $input['config'] = json_encode($request->input());
            ModuleConfigPrintDocuments::create($input);
        }
        
        return $data;
    }

    public static function table_html($request) {
        $current_id_site = Auth::guard('user')->user()->id_site;
        $course = ModuleTypeOfCourses::find($request->input('id_course'));
        $policies = ModuleVocationalEducationPolicities::whereIdSite($current_id_site)->orderBy('order')->get();
        $students = $course->students()->where('is_active', 1)->orderBy('first_name')->get(); // Sắp xếp theo first_name

        $html = '';

        $html .= '<div class="header" style="display: flex;">';
        $html .= '  <div class="left-panel" style="width: 30%; text-align: center;">';
        $html .= '      <div>' . ($request->name_department ?: "\"Nhập tên đơn vị\"") . '</div>';
        $html .= '      <div><strong>' . ($request->name_department_sub ?: "\"Nhập tên đơn vị trực thuộc\"") . '</strong></div>';
        $html .= '      <span class="underline"></span>';
        $html .= '  </div>';
        $html .= '  <div class="right-panel" style="width: 70%; text-align: center;">';
        $html .= '      <div><strong>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</strong></div>';
        $html .= '      <div><strong>Độc lập - Tự do - Hạnh phúc</strong></div>';
        $html .= '      <div class="underline"></div>';
        $html .= '  </div>';
        $html .= '</div>';
        $html .= '<div style="text-align: right; margin-top: 20px;">' . ($request->location ?: "\"Nhập nơi in\"") . ', ngày ' . date('d', time()) . ' tháng ' . date('m', time()) . ' năm ' . date('Y', time()) . '</div>';
        $html .= '<div style="text-align: center;">';
        $html .= '<div style="font-size: 16pt; font-weight: bold;">DANH SÁCH HỌC VIÊN</div>';
        $date_issue = $request->date_issue ? date('d', strtotime($request->date_issue)) . ' tháng ' . date('m', strtotime($request->date_issue)) . ' năm ' . date('Y', strtotime($request->date_issue)) : "\"Nhập ngày ban hành quyết định\"";
        $html .= '<div>Kèm theo ' . ($request->decision_name ?: "\"Nhập quyết định đi kèm\"") . ', ngày ' . $date_issue . ' của Trung tâm Giáo dục nghề nghiệp - GDTX Thạnh Trị</div>';

        $html .= '<div>Lớp: ' . $course->training_specialty->name . ' k' . $course->name . '-GDNN/' . $course->year . ', Tổng số học viên: ' . $students->count() . '</div>';
        $html .= '<div>Thời gian đào tạo: Từ ngày ' . date('d/m/Y', strtotime($course->from_the_time)) . ' đến ngày ' . date('d/m/Y', strtotime($course->till_the_time)) . '</div>';
        $html .= '<div>Địa điểm: ' . $course->address . '</div>';
        $html .= '</div>';
        $html .= '<table width="100%;">';
        $html .= '  <thead>';
        $html .= '      <tr>';
        $html .= '          <th rowspan="3" colspan="1">STT</th>';
        $html .= '          <th rowspan="3">HỌ VÀ TÊN</th>';
        $html .= '          <th rowspan="1" colspan="2">NĂM SINH</th>';
        $html .= '          <th rowspan="1" colspan="' . count($policies) . '">Nhóm đối tượng theo quy định của QĐ 1956/QD-TTg </th>';
        $html .= '          <th rowspan="3" colspan="1">ĐỊA CHỈ</th>';
        $html .= '          <th rowspan="3" colspan="1">GHI CHÚ</th>';
        $html .= '      </tr>';
        $html .= '      <tr>';
        $html .= '          <th rowspan="2">NAM</th>';
        $html .= '          <th rowspan="2">NỮ</th>';
        $html .= '          <th rowspan="1" colspan="' . count($policies->where('type', 1)) . '">Nhóm 1</th>';
        $html .= '          <th rowspan="1" colspan="' . count($policies->where('type', 2)) . '">Nhóm 2</th>';
        $html .= '          <th rowspan="1" colspan="' . count($policies->where('type', 3)) . '">Nhóm 3</th>';
        $html .= '      </tr>';
        $html .= '      <tr>';
        foreach ($policies->where('type', 1) as $policy) {
            $html .= '          <th rowspan="1">' . $policy->name . '</th>';
        }
        foreach ($policies->where('type', 2) as $policy) {
            $html .= '          <th rowspan="1">' . $policy->name . '</th>';
        }
        foreach ($policies->where('type', 3) as $policy) {
            $html .= '          <th rowspan="1">' . $policy->name . '</th>';
        }
        $html .= '      </tr>';
        $html .= '      <tr>';
        $html .= '          <th rowspan="1" colspan="1">A</th>';
        $html .= '          <th rowspan="1" colspan="1">B</th>';
        $html .= '          <th rowspan="1" colspan="1">1</th>';
        $html .= '          <th rowspan="1" colspan="1">2</th>';

        $i = 3;
        foreach ($policies->where('type', 1) as $policy) {
            $html .= '          <th rowspan="1" colspan="1">' . $i++ . '</th>';
        }
        foreach ($policies->where('type', 2) as $policy) {
            $html .= '          <th rowspan="1" colspan="1">' . $i++ . '</th>';
        }
        foreach ($policies->where('type', 3) as $policy) {
            $html .= '          <th rowspan="1" colspan="1">' . $i++ . '</th>';
        }
        $html .= '          <th rowspan="1" colspan="1">' . $i++ . '</th>';
        $html .= '          <th rowspan="1" colspan="1">' . $i++ . '</th>';

        $html .= '      </tr>';
        $html .= '  </thead>';

        $html .= '  <tbody>';
        $index = 1;
        foreach ($students as $student) {
            $html .= '      <tr>';
            $html .= '          <td>' . $index++ . '</td>';
            $html .= '          <td>' . $student->last_name . ' ' . $student->first_name . '</td>';
            $html .= '          <td style="text-align: center;">' . ($student->gender == 'nam' ? date('Y', strtotime($student->date_of_birth)) : '') . '</td>';
            $html .= '          <td style="text-align: center;">' . ($student->gender == 'nu' ? date('Y', strtotime($student->date_of_birth)) : '') . '</td>';
            
            foreach ($policies->where('type', 1) as $policy) {
                $html .= '          <td style="text-align: center;">' . ($student->policy == $policy->id ? 'X' : '') . '</td>';
            }
            foreach ($policies->where('type', 2) as $policy) {
                $html .= '          <td style="text-align: center;">' . ($student->policy == $policy->id ? 'X' : '') . '</td>';
            }
            foreach ($policies->where('type', 3) as $policy) {
                $html .= '          <td style="text-align: center;">' . ($student->policy == $policy->id ? 'X' : '') . '</td>';
            }

            $html .= '          <td>' . $student->permanent_residence . '</td>';
            $html .= '          <td>' . $student->note . '</td>';
            $html .= '      </tr>';
        }
        $html .= '  </tbody>';

        $html .= '</table>';

        $html .= '<div class="footer" style="display: flex; padding-top: 30px">';
        $html .= '  <div class="left-panel" style="width: 30%; text-align: center;">';
        $html .= '      <div><strong>Người lập bảng</strong></div>';
        $html .= '      <div style="padding-top: 100px;"><strong>' . $request->tabular_creator . '</strong></div>';
        $html .= '  </div>';
        $html .= '  <div class="right-panel" style="width: 70%; text-align: center;">';
        $html .= '      <div><strong>GIÁM ĐỐC</strong></div>';
        $html .= '      <div style="padding-top: 100px;"><strong>' . $request->signer . '</strong></div>';
        $html .= '  </div>';
        $html .= '</div>';
        return $html;
    }


    

}
