<?php

namespace App\Http\Controllers\Modules\AIIntegratedStatistics;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleIntegratedStatistics;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\ModuleManageStudents;
//Requests
use App\Http\Requests\Module\ModuleIntegratedStatisticsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;
//Export
use App\Exports\Form1Export;
use Maatwebsite\Excel\Facades\Excel;

class Form1Controller extends Controller {

    public static function form($request){
        if( $request->input('form') ) {
            $array_admissionIds = explode(',', $request->input('admissionIds')); //array khóa học tuyển sinh
            $array_graduationIds = explode(',', $request->input('graduationIds')); //array khóa học tốt nghiệp
            //Phi nông nghiệp
            //Sơ cấp
            $array_training_specialty_ts_pnn_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 2) //Sơ cấp
                                            ->where('type_2', 1) //Phi nông nghiệp
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts_pnn_so_cap = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_ts_pnn_so_cap)
                                            ->whereIn('id', $array_admissionIds)
                                            ->get()->pluck('id')
                                            ->toArray();

            $students_ts_pnn_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_ts_pnn_so_cap)
                                            ->get();

            $data['tuyensinh']['phinn']['socap']['under25']['detail'] = self::partialForm1($students_ts_pnn_so_cap, 'under25');
            $data['tuyensinh']['phinn']['socap']['under25']['sum'] = self::sum_array($data['tuyensinh']['phinn']['socap']['under25']['detail']);
            $data['tuyensinh']['phinn']['socap']['26to45']['detail'] = self::partialForm1($students_ts_pnn_so_cap, '26to45');
            $data['tuyensinh']['phinn']['socap']['26to45']['sum'] = self::sum_array($data['tuyensinh']['phinn']['socap']['26to45']['detail']);
            $data['tuyensinh']['phinn']['socap']['above45']['detail'] = self::partialForm1($students_ts_pnn_so_cap, 'above45');
            $data['tuyensinh']['phinn']['socap']['above45']['sum'] = self::sum_array($data['tuyensinh']['phinn']['socap']['above45']['detail']);
            $data['tuyensinh']['phinn']['socap']['sum'] = self::sum_array($data['tuyensinh']['phinn']['socap']);
    
            //Dưới 3 tháng
            $array_training_specialty_ts_pnn_below_3m = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 1)
                                            ->where('type_2', 1)
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts_pnn_below_3m = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_ts_pnn_below_3m)
                                            ->whereIn('id', $array_admissionIds)
                                            ->get()->pluck('id')
                                            ->toArray();
            $students_ts_pnn_below_3m = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_ts_pnn_below_3m)
                                            ->get();

            $data['tuyensinh']['phinn']['below_3m']['under25']['detail'] = self::partialForm1($students_ts_pnn_below_3m, 'under25');
            $data['tuyensinh']['phinn']['below_3m']['under25']['sum'] = self::sum_array($data['tuyensinh']['phinn']['below_3m']['under25']['detail']);
            $data['tuyensinh']['phinn']['below_3m']['26to45']['detail'] = self::partialForm1($students_ts_pnn_below_3m, '26to45');
            $data['tuyensinh']['phinn']['below_3m']['26to45']['sum'] = self::sum_array($data['tuyensinh']['phinn']['below_3m']['26to45']['detail']);
            $data['tuyensinh']['phinn']['below_3m']['above45']['detail'] = self::partialForm1($students_ts_pnn_below_3m, 'above45');
            $data['tuyensinh']['phinn']['below_3m']['above45']['sum'] = self::sum_array($data['tuyensinh']['phinn']['below_3m']['above45']['detail']);
            $data['tuyensinh']['phinn']['below_3m']['sum'] = self::sum_array($data['tuyensinh']['phinn']['below_3m']);


            //Tổng phi nông nghiệp
            $data['tuyensinh']['phinn']['sum'] = self::sum_array( [$data['tuyensinh']['phinn']['socap']['sum'], $data['tuyensinh']['phinn']['below_3m']['sum']] );

            //TS Nông nghiệp
            //Sơ cấp
            $array_training_specialty_ts_nn_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 2) // Sơ cấp
                                            ->where('type_2', 2) // Nông nghiệp
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts_nn_so_cap = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_ts_nn_so_cap)
                                            ->whereIn('id', $array_admissionIds)
                                            ->get()->pluck('id')
                                            ->toArray();
            $students_ts_nn_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_ts_nn_so_cap)
                                            ->get();
            $data['tuyensinh']['nn']['socap']['under25']['detail'] = self::partialForm1($students_ts_nn_so_cap, 'under25');

            $data['tuyensinh']['nn']['socap']['under25']['sum'] = self::sum_array($data['tuyensinh']['nn']['socap']['under25']['detail']);
            $data['tuyensinh']['nn']['socap']['26to45']['detail'] = self::partialForm1($students_ts_nn_so_cap, '26to45');
            $data['tuyensinh']['nn']['socap']['26to45']['sum'] = self::sum_array($data['tuyensinh']['nn']['socap']['26to45']['detail']);
            $data['tuyensinh']['nn']['socap']['above45']['detail'] = self::partialForm1($students_ts_nn_so_cap, 'above45');
            $data['tuyensinh']['nn']['socap']['above45']['sum'] = self::sum_array($data['tuyensinh']['nn']['socap']['above45']['detail']);
            $data['tuyensinh']['nn']['socap']['sum'] = self::sum_array($data['tuyensinh']['nn']['socap']);

            //TS NN Dưới 3 tháng
            $array_training_specialty_ts_nn_below_3m = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 1)
                                            ->where('type_2', 2)
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts_nn_below_3m = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_ts_nn_below_3m)
                                            ->whereIn('id', $array_admissionIds)
                                            ->get()->pluck('id')
                                            ->toArray();
            $students_ts_nn_below_3m = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_ts_nn_below_3m)
                                            ->get();

            $data['tuyensinh']['nn']['below_3m']['under25']['detail'] = self::partialForm1($students_ts_nn_below_3m, 'under25');
            $data['tuyensinh']['nn']['below_3m']['under25']['sum'] = self::sum_array($data['tuyensinh']['nn']['below_3m']['under25']['detail']);
            $data['tuyensinh']['nn']['below_3m']['26to45']['detail'] = self::partialForm1($students_ts_nn_below_3m, '26to45');
            $data['tuyensinh']['nn']['below_3m']['26to45']['sum'] = self::sum_array($data['tuyensinh']['nn']['below_3m']['26to45']['detail']);
            $data['tuyensinh']['nn']['below_3m']['above45']['detail'] = self::partialForm1($students_ts_nn_below_3m, 'above45');
            $data['tuyensinh']['nn']['below_3m']['above45']['sum'] = self::sum_array($data['tuyensinh']['nn']['below_3m']['above45']['detail']);
            $data['tuyensinh']['nn']['below_3m']['sum'] = self::sum_array($data['tuyensinh']['nn']['below_3m']);

            // Tổng nông nghiệp
            $data['tuyensinh']['nn']['sum'] = self::sum_array( [$data['tuyensinh']['nn']['socap']['sum'], $data['tuyensinh']['nn']['below_3m']['sum']] );

            // Tổng tuyển sinh
            $data['tuyensinh']['sum'] = self::sum_array( [$data['tuyensinh']['phinn']['sum'], $data['tuyensinh']['nn']['sum']] );

// ------------------------- Tốt nghiệp --------------------------------------------------------------
            $array_training_specialty_tn_pnn_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 2) //Sơ cấp
                                            ->where('type_2', 1) //Phi nông nghiệp
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_tn_pnn_so_cap = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_tn_pnn_so_cap)
                                            ->whereIn('id', $array_graduationIds)
                                            ->get()->pluck('id')
                                            ->toArray();

            $students_tn_pnn_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_tn_pnn_so_cap)
                                            ->get();

            $data['totnghiep']['phinn']['socap']['under25']['detail'] = self::partialForm1($students_tn_pnn_so_cap, 'under25');
            $data['totnghiep']['phinn']['socap']['under25']['sum'] = self::sum_array($data['totnghiep']['phinn']['socap']['under25']['detail']);
            $data['totnghiep']['phinn']['socap']['26to45']['detail'] = self::partialForm1($students_tn_pnn_so_cap, '26to45');
            $data['totnghiep']['phinn']['socap']['26to45']['sum'] = self::sum_array($data['totnghiep']['phinn']['socap']['26to45']['detail']);
            $data['totnghiep']['phinn']['socap']['above45']['detail'] = self::partialForm1($students_tn_pnn_so_cap, 'above45');
            $data['totnghiep']['phinn']['socap']['above45']['sum'] = self::sum_array($data['totnghiep']['phinn']['socap']['above45']['detail']);
            $data['totnghiep']['phinn']['socap']['sum'] = self::sum_array($data['totnghiep']['phinn']['socap']);
    
            //Dưới 3 tháng
            $array_training_specialty_tn_pnn_below_3m = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 1)
                                            ->where('type_2', 1)
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_tn_pnn_below_3m = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_tn_pnn_below_3m)
                                            ->whereIn('id', $array_graduationIds)
                                            ->get()->pluck('id')
                                            ->toArray();
            $students_tn_pnn_below_3m = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_tn_pnn_below_3m)
                                            ->get();

            $data['totnghiep']['phinn']['below_3m']['under25']['detail'] = self::partialForm1($students_tn_pnn_below_3m, 'under25');
            $data['totnghiep']['phinn']['below_3m']['under25']['sum'] = self::sum_array($data['totnghiep']['phinn']['below_3m']['under25']['detail']);
            $data['totnghiep']['phinn']['below_3m']['26to45']['detail'] = self::partialForm1($students_tn_pnn_below_3m, '26to45');
            $data['totnghiep']['phinn']['below_3m']['26to45']['sum'] = self::sum_array($data['totnghiep']['phinn']['below_3m']['26to45']['detail']);
            $data['totnghiep']['phinn']['below_3m']['above45']['detail'] = self::partialForm1($students_tn_pnn_below_3m, 'above45');
            $data['totnghiep']['phinn']['below_3m']['above45']['sum'] = self::sum_array($data['totnghiep']['phinn']['below_3m']['above45']['detail']);
            $data['totnghiep']['phinn']['below_3m']['sum'] = self::sum_array($data['totnghiep']['phinn']['below_3m']);


            //Tổng phi nông nghiệp
            $data['totnghiep']['phinn']['sum'] = self::sum_array( [$data['totnghiep']['phinn']['socap']['sum'], $data['totnghiep']['phinn']['below_3m']['sum']] );

            //TN Nông nghiệp
            //Sơ cấp
            $array_training_specialty_tn_nn_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 2) // Sơ cấp
                                            ->where('type_2', 2) // Nông nghiệp
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_tn_nn_so_cap = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_tn_nn_so_cap)
                                            ->whereIn('id', $array_graduationIds)
                                            ->get()->pluck('id')
                                            ->toArray();
            $students_tn_nn_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_tn_nn_so_cap)
                                            ->get();
            $data['totnghiep']['nn']['socap']['under25']['detail'] = self::partialForm1($students_tn_nn_so_cap, 'under25');

            $data['totnghiep']['nn']['socap']['under25']['sum'] = self::sum_array($data['totnghiep']['nn']['socap']['under25']['detail']);
            $data['totnghiep']['nn']['socap']['26to45']['detail'] = self::partialForm1($students_tn_nn_so_cap, '26to45');
            $data['totnghiep']['nn']['socap']['26to45']['sum'] = self::sum_array($data['totnghiep']['nn']['socap']['26to45']['detail']);
            $data['totnghiep']['nn']['socap']['above45']['detail'] = self::partialForm1($students_tn_nn_so_cap, 'above45');
            $data['totnghiep']['nn']['socap']['above45']['sum'] = self::sum_array($data['totnghiep']['nn']['socap']['above45']['detail']);
            $data['totnghiep']['nn']['socap']['sum'] = self::sum_array($data['totnghiep']['nn']['socap']);

            //TS NN Dưới 3 tháng
            $array_training_specialty_tn_nn_below_3m = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 1)
                                            ->where('type_2', 2)
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_tn_nn_below_3m = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_tn_nn_below_3m)
                                            ->whereIn('id', $array_graduationIds)
                                            ->get()->pluck('id')
                                            ->toArray();
            $students_tn_nn_below_3m = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_course', $array_courses_tn_nn_below_3m)
                                            ->get();

            $data['totnghiep']['nn']['below_3m']['under25']['detail'] = self::partialForm1($students_tn_nn_below_3m, 'under25');
            $data['totnghiep']['nn']['below_3m']['under25']['sum'] = self::sum_array($data['totnghiep']['nn']['below_3m']['under25']['detail']);
            $data['totnghiep']['nn']['below_3m']['26to45']['detail'] = self::partialForm1($students_tn_nn_below_3m, '26to45');
            $data['totnghiep']['nn']['below_3m']['26to45']['sum'] = self::sum_array($data['totnghiep']['nn']['below_3m']['26to45']['detail']);
            $data['totnghiep']['nn']['below_3m']['above45']['detail'] = self::partialForm1($students_tn_nn_below_3m, 'above45');
            $data['totnghiep']['nn']['below_3m']['above45']['sum'] = self::sum_array($data['totnghiep']['nn']['below_3m']['above45']['detail']);
            $data['totnghiep']['nn']['below_3m']['sum'] = self::sum_array($data['totnghiep']['nn']['below_3m']);

            // Tổng nông nghiệp
            $data['totnghiep']['nn']['sum'] = self::sum_array( [$data['totnghiep']['nn']['socap']['sum'], $data['totnghiep']['nn']['below_3m']['sum']] );

            // Tổng tốt nghiệp
            $data['totnghiep']['sum'] = self::sum_array( [$data['totnghiep']['phinn']['sum'], $data['totnghiep']['nn']['sum']] );
            
            // Tổng tất cả
            $data['total']['sum'] = self::sum_array( [$data['tuyensinh']['sum'], $data['totnghiep']['sum']] );

            return $data;
        }
        
    }

    
    public static function partialForm1($students, $ageCondition = null) {
        $groupedByCourse = $students->groupBy('id_course');
        $data = [];

        foreach ($groupedByCourse as $courseId => $groupedStudents) {
            $courseName = $groupedStudents->first()->course->training_specialty->name .' - K'. $groupedStudents->first()->course->name;
            
            if ($ageCondition === 'under25') {
                $groupedStudents = $groupedStudents->where('date_of_birth', '>', now()->subYears(25));
            } elseif ($ageCondition === '26to45') {
                $groupedStudents = $groupedStudents->where('date_of_birth', '<=', now()->subYears(25))
                                                   ->where('date_of_birth', '>=', now()->subYears(45));
            } elseif ($ageCondition === 'above45') {
                $groupedStudents = $groupedStudents->where('date_of_birth', '<', now()->subYears(45));
            }


            $courseData = array_fill(0, 22, 0);
            $courseData[0] = count($groupedStudents);
            $courseData[1] = count($groupedStudents->where('gender', 'nu'));
            $courseData[3] = count($groupedStudents->where('policy', 18)); // Người có công CM
            $courseData[4] = count($groupedStudents->where('policy', 20)); // Hộ nghèo
            $courseData[5] = count($groupedStudents->where('policy', 21)->where('gender', 'nu')); // Dân tộc thiểu số nữ
            $courseData[6] = count($groupedStudents->where('policy', 21)->where('id_ethnic', 19)); // Dân tộc thiểu số Khmer
            $courseData[7] = count($groupedStudents->where('policy', 21)->where('id_ethnic', 18)); // Dân tộc thiểu số Hoa
            $courseData[8] = count($groupedStudents->where('policy', 23)); // Lao động nữ bị mất việc làm
            $courseData[9] = count($groupedStudents->where('policy', 22)); // Người khuyết tật
            $courseData[10] = count($groupedStudents->where('policy', 37)); // Người thuộc hộ bị thu hồi đất
            $courseData[11] = count($groupedStudents->where('policy', 41)); // Người mới thoát nghèo dưới 36 tháng
            $courseData[12] = count($groupedStudents->where('policy', 24)); // Cận nghèo
            $courseData[13] = count($groupedStudents->where('policy', 25)); // Cận nghèo
            $courseData[14] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->count(); // Tổng Thanh niên
            $courseData[15] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('policy', '==', 21) //Dân tộc thiểu số
                                ->count(); //Thanh niên dân tộc
            $courseData[16] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('gender','nu') //Nữ thanh niên
                                ->count();
            $courseData[17] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('policy', '==', 21) //Dân tộc thiểu số
                                ->where('gender','nu') //Nữ thanh niên dân tộc
                                ->count();
            $courseData[18] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('policy', 21)
                                ->where('id_ethnic', '==', 19) //Thanh niên dân tộc khmer
                                ->count();
            $courseData[19] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('policy', 21)
                                ->where('id_ethnic', '==', 18) //Thanh niên dân tộc hoa
                                ->count();
            $courseData[20] = $groupedStudents
                                ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('policy', 21)
                                ->where('id_ethnic', '==', 19) //Thanh niên dân tộc khmer
                                ->where('id_ethnic', '==', 18) //Thanh niên dân tộc hoa
                                ->count(); // Dân tộc khác
            $courseData[21] = $groupedStudents
                                ->where('class', '>', 9) // Tốt nghiệp THCS
                                ->count();

            $courseData[2] = $courseData[3] + $courseData[4] + $courseData[6] + $courseData[7] + $courseData[8] + $courseData[9] + $courseData[10] + $courseData[11]; // Tổng số người thực tế thuộc đối tượng 1
            $data[$courseName] = $courseData;
        }

        // Sắp xếp mảng theo tên khóa học
        ksort($data);

        return $data;
    }

    // Updated sum_array function:
    public static function sum_array($data) {
        $totalColumns = [];

        foreach ($data as $key => $courseData) {
            // Loại bỏ phần tử "sum" nếu tồn tại
            if ($key === 'sum') {
                continue;
            }

            // Nếu là mảng nhiều cấp độ, gọi đệ quy
            if (isset($courseData['sum'])) {
                $courseData = $courseData['sum'];
            }

            // Khởi tạo mảng $totalColumns nếu chưa được khởi tạo
            if (empty($totalColumns)) {
                $totalColumns = array_fill(0, count($courseData), 0);
            }

            foreach ($courseData as $index => $value) {
                if (is_numeric($value)) {
                    $totalColumns[$index] += $value;
                }
            }
        }

        return $totalColumns;
    }
}
