<?php

namespace App\Http\Controllers\Modules\AIPrintDocuments;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
// use App\Models\Modules\ModuleIntegratedStatistics;
// use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
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
        return $data;
    }

    public static function table_html($request) {
        $html = '';

        $html .= '<div class="header" style="display: flex;">';
        $html .= '<div class="left-panel" style="width: 30%; text-align: center;">';
        $html .= '<div>'.$request->input('name_department').'</div>';
        $html .= '<div><strong>'.$request->input('name_department_sub').'</strong></div>';
        $html .= '<span class="underline"></span>';
        $html .= '</div>';
        $html .= '<div class="right-panel" style="width: 70%; text-align: center;">';
        $html .= '<div><strong>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</strong></div>';
        $html .= '<div><strong>Độc lập - Tự do - Hạnh phúc</strong></div>';
        $html .= '<div class="underline"></div>';
        $html .= '</div>';
        $html .= '</div>';
        $html .= '<div style="text-align: right; margin-top: 20px;">Thạnh Trị, ngày 28 tháng 3 năm 2024</div>';
        $html .= '<div style="text-align: center;">';
        $html .= '<div style="font-size: 16pt; font-weight: bold;">DANH SÁCH HỌC VIÊN</div>';
        $html .= '<div>Kèm theo Quyết định số: 6/QĐ-GDNN-GDTX, ngày 28 tháng 3 năm 2024 của Trung tâm Giáo dục nghề nghiệp - GDTX Thạnh Trị</div>';
        $html .= '<div>Lớp: Máy công nghiệp k1-GDNN/2024, Tổng số học viên: 20</div>';
        $html .= '<div>Thời gian đào tạo: Từ ngày 29/03/2024 đến ngày 15/05/2024</div>';
        $html .= '<div>Địa điểm: Ấp B1, xã Thạnh Tân</div>';
        $html .= '</div>';
        $html .= '<table width="100%;">';
        $html .= '<thead>';
        $html .= '<tr>';
        $html .= '<th rowspan="3">STT</th>';
        $html .= '<th rowspan="3">HỌ VÀ TÊN</th>';
        $html .= '<th rowspan="1" colspan="2">NĂM SINH</th>';
        $html .= '<th rowspan="1" colspan="7">Nhóm đối tượng theo quy định của QĐ 1956/QD-TTg </th>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th rowspan="2">NAM</th>';
        $html .= '<th rowspan="2">NỮ</th>';
        $html .= '<th rowspan="1" colspan="5">Nhóm 1</th>';
        $html .= '<th rowspan="1" colspan="1">Nhóm 2</th>';
        $html .= '<th rowspan="1" colspan="1">Nhóm 3</th>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th rowspan="1">NAM</th>';
        $html .= '<th rowspan="1">NỮ</th>';
        $html .= '<th rowspan="1">NỮ</th>';
        $html .= '<th rowspan="1">NỮ</th>';
        $html .= '<th rowspan="1">NỮ</th>';
        $html .= '<th rowspan="1">NỮ</th>';
        $html .= '<th rowspan="1">NỮ</th>';
        $html .= '</tr>';
        $html .= '</thead>';
        $html .= '</table>';

        return $html;
    }

    

}
