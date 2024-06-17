<?php

namespace App\Http\Controllers\Modules\AIIntegratedStatistics;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleManageStudents;

use App\Models\Modules\ModuleIntegratedStatistics;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
//Requests
use App\Http\Requests\Module\ModuleIntegratedStatisticsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;
//Export
use App\Exports\Form1Export;
use Maatwebsite\Excel\Facades\Excel;

class Form2Controller extends Controller {

    public static function form($request){
        $data = [];
        if( $request->input('form') && $request->input('year') ) {
            $input_from_the_time = sprintf('%04d-%02d-08', $request->input('year'), $request->input('month'));
            $input_till_the_time = date('Y-m-d', strtotime($request->input('year') . '-' . $request->input('month') . '-08 +1 month'));

        //Tuyển sinh
            //Phi nông nghiệp
            //Sơ cấp
            $array_training_specialty_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 2)  //Sơ cấp
                                            ->where('type_2', 1) //Phi nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->get()->pluck('id')->toArray();                                
            $students_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->whereIn('id_course', $array_courses_ts)
                                            ->get();
            $data['tuyensinh']['phinn']['socap']['under25'] = self::partialForm1($students_so_cap, 'under25');
            $data['tuyensinh']['phinn']['socap']['26to45'] = self::partialForm1($students_so_cap, '26to45');
            $data['tuyensinh']['phinn']['socap']['above45'] = self::partialForm1($students_so_cap, 'above45');
            $data['tuyensinh']['phinn']['socap']['sum'] = self::sum_array('type_1', $data['tuyensinh']['phinn']['socap']);

            // //Dưới 3 tháng
            $array_training_specialty_duoi_3_thang = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 1) //Dưới 3 tháng
                                            ->where('type_2', 1) //Phi nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $courses_duoi_3_thang = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_duoi_3_thang)
                                            ->get();
            $data['tuyensinh']['phinn']['duoi3thang']['under25']['detail'] = self::partialForm2($courses_duoi_3_thang, 'under25');
            $data['tuyensinh']['phinn']['duoi3thang']['26to45']['detail'] = self::partialForm2($courses_duoi_3_thang, '26to45');
            $data['tuyensinh']['phinn']['duoi3thang']['above45']['detail'] = self::partialForm2($courses_duoi_3_thang, 'above45');

            $data['tuyensinh']['phinn']['duoi3thang']['under25']['sum'] = self::sum_array('type_1', $data['tuyensinh']['phinn']['duoi3thang']['under25']['detail']);
            $data['tuyensinh']['phinn']['duoi3thang']['26to45']['sum'] = self::sum_array('type_1', $data['tuyensinh']['phinn']['duoi3thang']['26to45']['detail']);
            $data['tuyensinh']['phinn']['duoi3thang']['above45']['sum'] = self::sum_array('type_1', $data['tuyensinh']['phinn']['duoi3thang']['above45']['detail']);

            $data['tuyensinh']['phinn']['duoi3thang']['sum'] = self::sum_array( 'type_2', [$data['tuyensinh']['phinn']['duoi3thang']['under25']['sum'], $data['tuyensinh']['phinn']['duoi3thang']['26to45']['sum'], $data['tuyensinh']['phinn']['duoi3thang']['above45']['sum']] );

            //Tổng phi nông nghiệp
            $data['tuyensinh']['phinn']['sum'] = self::sum_array( 'type_2', [$data['tuyensinh']['phinn']['socap']['sum'], $data['tuyensinh']['phinn']['duoi3thang']['sum']] );

            //Nông nghiệp
            //Sơ cấp
            $array_training_specialty_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 2)  //Sơ cấp
                                            ->where('type_2', 2) //nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->get()->pluck('id')->toArray();                                
            $students_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->whereIn('id_course', $array_courses_ts)
                                            ->get();
            $data['tuyensinh']['nn']['socap']['under25'] = self::partialForm1($students_so_cap, 'under25');
            $data['tuyensinh']['nn']['socap']['26to45'] = self::partialForm1($students_so_cap, '26to45');
            $data['tuyensinh']['nn']['socap']['above45'] = self::partialForm1($students_so_cap, 'above45');

            $data['tuyensinh']['nn']['socap']['sum'] = self::sum_array('type_1', $data['tuyensinh']['nn']['socap']);

            // //Dưới 3 tháng
            $array_training_specialty_duoi_3_thang = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 1) //Dưới 3 tháng
                                            ->where('type_2', 2) //Phi nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $courses_duoi_3_thang = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_duoi_3_thang)
                                            ->get();            
            $data['tuyensinh']['nn']['duoi3thang']['under25']['detail'] = self::partialForm2($courses_duoi_3_thang, 'under25');
            $data['tuyensinh']['nn']['duoi3thang']['26to45']['detail'] = self::partialForm2($courses_duoi_3_thang, '26to45');
            $data['tuyensinh']['nn']['duoi3thang']['above45']['detail'] = self::partialForm2($courses_duoi_3_thang, 'above45');

            $data['tuyensinh']['nn']['duoi3thang']['under25']['sum'] = self::sum_array('type_1', $data['tuyensinh']['nn']['duoi3thang']['under25']['detail']);
            $data['tuyensinh']['nn']['duoi3thang']['26to45']['sum'] = self::sum_array('type_1', $data['tuyensinh']['nn']['duoi3thang']['26to45']['detail']);
            $data['tuyensinh']['nn']['duoi3thang']['above45']['sum'] = self::sum_array('type_1', $data['tuyensinh']['nn']['duoi3thang']['above45']['detail']);

            $data['tuyensinh']['nn']['duoi3thang']['sum'] = self::sum_array( 'type_2', [$data['tuyensinh']['nn']['duoi3thang']['under25']['sum'], $data['tuyensinh']['nn']['duoi3thang']['26to45']['sum'], $data['tuyensinh']['nn']['duoi3thang']['above45']['sum']] );

            //Tổng nông nghiệp
            $data['tuyensinh']['nn']['sum'] = self::sum_array( 'type_2', [$data['tuyensinh']['nn']['socap']['sum'], $data['tuyensinh']['nn']['duoi3thang']['sum']] );
        //Tốt nghiệp
            //Phi nông nghiệp
            //Sơ cấp
            $array_courses_tn = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('till_the_time', '>=', $input_from_the_time)
                                            ->where('till_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->get()->pluck('id')->toArray();                                
            $students_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->whereIn('id_course', $array_courses_tn)
                                            ->get();
            $data['totnghiep']['phinn']['socap']['under25'] = self::partialForm1($students_so_cap, 'under25');
            $data['totnghiep']['phinn']['socap']['26to45'] = self::partialForm1($students_so_cap, '26to45');
            $data['totnghiep']['phinn']['socap']['above45'] = self::partialForm1($students_so_cap, 'above45');

            $data['totnghiep']['phinn']['socap']['sum'] = self::sum_array('type_1', $data['totnghiep']['phinn']['socap']);

            // //Dưới 3 tháng
            $array_training_specialty_duoi_3_thang = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 1) //Dưới 3 tháng
                                            ->where('type_2', 1) //Phi nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $courses_duoi_3_thang = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_duoi_3_thang)
                                            ->get();
            $data['totnghiep']['phinn']['duoi3thang']['under25']['detail'] = self::partialForm2($courses_duoi_3_thang, 'under25');
            $data['totnghiep']['phinn']['duoi3thang']['26to45']['detail'] = self::partialForm2($courses_duoi_3_thang, '26to45');
            $data['totnghiep']['phinn']['duoi3thang']['above45']['detail'] = self::partialForm2($courses_duoi_3_thang, 'above45');

            $data['totnghiep']['phinn']['duoi3thang']['under25']['sum'] = self::sum_array('type_1', $data['totnghiep']['phinn']['duoi3thang']['under25']['detail']);
            $data['totnghiep']['phinn']['duoi3thang']['26to45']['sum'] = self::sum_array('type_1', $data['totnghiep']['phinn']['duoi3thang']['26to45']['detail']);
            $data['totnghiep']['phinn']['duoi3thang']['above45']['sum'] = self::sum_array('type_1', $data['totnghiep']['phinn']['duoi3thang']['above45']['detail']);

            $data['totnghiep']['phinn']['duoi3thang']['sum'] = self::sum_array( 'type_2', [$data['totnghiep']['phinn']['duoi3thang']['under25']['sum'], $data['totnghiep']['phinn']['duoi3thang']['26to45']['sum'], $data['totnghiep']['phinn']['duoi3thang']['above45']['sum']] );

            //Tổng phi nông nghiệp
            $data['totnghiep']['phinn']['sum'] = self::sum_array( 'type_2', [$data['totnghiep']['phinn']['socap']['sum'], $data['totnghiep']['phinn']['duoi3thang']['sum']] );
            
            //Nông nghiệp
            //Sơ cấp
            $array_training_specialty_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 2)  //Sơ cấp
                                            ->where('type_2', 2) //nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $array_courses_ts = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->get()->pluck('id')->toArray();                                
            $students_so_cap = ModuleManageStudents::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->whereIn('id_course', $array_courses_ts)
                                            ->get();

            $data['totnghiep']['nn']['socap']['under25'] = self::partialForm1($students_so_cap, 'under25');
            $data['totnghiep']['nn']['socap']['26to45'] = self::partialForm1($students_so_cap, '26to45');
            $data['totnghiep']['nn']['socap']['above45'] = self::partialForm1($students_so_cap, 'above45');

            $data['totnghiep']['nn']['socap']['sum'] = self::sum_array('type_1', $data['totnghiep']['nn']['socap']);

            // //Dưới 3 tháng
            $array_training_specialty_duoi_3_thang = ModuleTrainingSpecialties::select('id')
                                            ->where('type_1', 1) //Dưới 3 tháng
                                            ->where('type_2', 2) //Phi nn
                                            ->get()->pluck('id')
                                            ->toArray();
            $courses_duoi_3_thang = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->where('from_the_time', '>=', $input_from_the_time)
                                            ->where('from_the_time', '<=', $input_till_the_time)
                                            ->whereIn('id_training_specialty', $array_training_specialty_duoi_3_thang)
                                            ->get();
            $data['totnghiep']['nn']['duoi3thang']['under25']['detail'] = self::partialForm2($courses_duoi_3_thang, 'under25');
            $data['totnghiep']['nn']['duoi3thang']['26to45']['detail'] = self::partialForm2($courses_duoi_3_thang, '26to45');
            $data['totnghiep']['nn']['duoi3thang']['above45']['detail'] = self::partialForm2($courses_duoi_3_thang, 'above45');

            $data['totnghiep']['nn']['duoi3thang']['under25']['sum'] = self::sum_array('type_1', $data['totnghiep']['nn']['duoi3thang']['under25']['detail']);
            $data['totnghiep']['nn']['duoi3thang']['26to45']['sum'] = self::sum_array('type_1', $data['totnghiep']['nn']['duoi3thang']['26to45']['detail']);
            $data['totnghiep']['nn']['duoi3thang']['above45']['sum'] = self::sum_array('type_1', $data['totnghiep']['nn']['duoi3thang']['above45']['detail']);

            $data['totnghiep']['nn']['duoi3thang']['sum'] = self::sum_array( 'type_2', [$data['totnghiep']['nn']['duoi3thang']['under25']['sum'], $data['totnghiep']['nn']['duoi3thang']['26to45']['sum'], $data['totnghiep']['nn']['duoi3thang']['above45']['sum']] );
            //Tổng phi nông nghiệp
            $data['totnghiep']['nn']['sum'] = self::sum_array( 'type_2', [$data['totnghiep']['nn']['socap']['sum'], $data['tuyensinh']['nn']['duoi3thang']['sum']] );
            return $data;
        }
        
    }
    //Tuyển sinh
    public static function partialForm1($students, $ageCondition = null) {
        $count_student = 0;
        if(count($students) > 0){
            if ($ageCondition === 'under25') {
                $students = $students->where('date_of_birth', '>=', now()->subYears(25));
            } elseif ($ageCondition === '26to45') {
                $students = $students->where('date_of_birth', '>=', now()->subYears(45))
                                     ->where('date_of_birth', '<=', now()->subYears(26));
            } elseif ($ageCondition === 'above45') {
                $students = $students->where('date_of_birth', '<', now()->subYears(45));
            }
            
            $data[0] = count( $students->groupby('id_course') );
            $data[1] = count( $students );

            $data[2] = count( $students->where('gender','nu') );
            $data[3] = count( $students->where('type_1', '==', 18) ); //18 người có công CM
            $data[4] = count( $students->where('type_1', '==', 22) ); //22 là id Người khuyết tật
            $data[5] = count( $students->where('type_1', '==', 37) ); //37 là id Người thuộc hộ bị thu hồi đất
            $data[6] = count( $students->where('type_1', '==', 38) ); //38 là id Ngư dân
            $data[7] = count( $students->where('type_1', '==', 20) ); //20 là id Hộ nghèo
            $data[8] = count( $students->where('type_1', '==', 35) ); //35 là id Cận nghèo
            $data[9] = count( $students->where('type_1', '==', 21) ); //21 là id Dân tộc thiểu số
            $data[10] = $students->where('type_1', '==', 21)
                                ->where('gender','nu')
                                ->count(); //Dân tộc thiểu số nữ
            $data[11] = $students->where('type_1', '==', 21)
                                ->where('gender','nu')
                                ->where('id_ethnic', 19)
                                ->count(); //Dân tộc thiểu số nữ Khmer
            $data[12] = $students->where('type_1', '==', 21)
                                ->where('gender','nu')
                                ->where('id_ethnic', 18)
                                ->count(); //Dân tộc thiểu số nữ Hoa
            $data[13] = $students->where('type_1', '==', 21)
                                ->where('gender','nu')
                                ->whereNotIn('id_ethnic', [18,19])
                                ->count(); //Dân tộc thiểu số nữ Khác
            $data[14] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->count();
            $data[15] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('type_1', '==', 39) //Người hoàn thành nghĩa vụ
                                ->count();
            $data[16] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('type_1', '==', 21) //Dân tộc thiểu số
                                ->count();
            $data[17] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('type_1', '==', 21) //Dân tộc thiểu số
                                ->where('gender','nu') //Nữ thanh niên
                                ->count();
            $data[18] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('type_1', '==', 21) //Dân tộc thiểu số
                                ->where('id_ethnic', 19) //Khmer
                                ->count();
            $data[19] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('type_1', '==', 21) //Dân tộc thiểu số
                                ->where('id_ethnic', 18) //Hoa
                                ->count();
            $data[20] = $students->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                ->where('type_1', '==', 21) //Dân tộc thiểu số
                                ->whereNotIn('id_ethnic', [18,19])
                                ->count();
        } else {
            for($i = 0; $i < 21; $i++) {
                $data[$i] = 0;
            }
        } 
        return $data;

    }
    //
    public static function partialForm2($courses, $ageCondition = null) {
        if(count($courses) > 0){
            foreach($courses as $key=>$course){
                $students = $course->students;
                if ($ageCondition === 'under25') {
                    $students = $students->where('date_of_birth', '>=', now()->subYears(25));
                } elseif ($ageCondition === '26to30') {
                    $students = $students->where('date_of_birth', '>=', now()->subYears(30))
                                         ->where('date_of_birth', '<=', now()->subYears(26));
                } elseif ($ageCondition === '31to45') {
                    $students = $students->where('date_of_birth', '>=', now()->subYears(45))
                                         ->where('date_of_birth', '<=', now()->subYears(31));
                }elseif ($ageCondition === 'above45') {
                    $students = $students->where('date_of_birth', '<', now()->subYears(45));
                }
                // for(int $i; $i < 21; $i++){
                $data[$key][0] = $course->training_specialty->name.' - K'.$course->name;
                $data[$key][1] = 1;

                
                $data[$key][2] = count($students);
                $data[$key][3] = count($students->where('gender','nu'));
                $data[$key][4] = count($students->where('type_1', '<>', null));
                $data[$key][5] = count($students->where('type_1', '==', 18));
                $data[$key][6] = count($students->where('type_2', '==', 20)); //20 là id hộ nghèo
                $data[$key][7] = $students->where('gender','nu')
                                            ->where('type_1', '<>', null)
                                            ->whereIn('id_ethnic', [18, 19])
                                            ->count(); //21 là id dân tộc thiểu số nữ
                $data[$key][8] = count($students->where('id_ethnic',19)); //19 là id dân tộc khmer
                $data[$key][9] = count($students->where('id_ethnic','==',18)); //18 là id dân tộc Hoa
                $data[$key][10] = count($students->where('gender','nu')->where('type_1', '==', 23)); //23 là id Lao động nữ bị mất việc làm
                $data[$key][11] = count($students->where('type_1', '==', 22)); //24 là id Người khuyết tật
                $data[$key][12] = count($students->where('type_1', '==', 37)); //25 là id Người thuộc hộ bị thu hồi đất
                $data[$key][13] = count($students->where('type_2', '==', 24)); //24 là id Hộ cận nghèo
                $data[$key][14] = count($students->where('type_3', '==', 25)); //25 là id Lao động nông thôn khác
                $data[$key][15] = $students
                                    ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                    ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                    ->count();
                $data[$key][16] = $students
                                    ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                    ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                    ->where('type_1', '==', 21) //Dân tộc thiểu số
                                    ->count();
                $data[$key][17] = $students
                                    ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                    ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                    ->where('gender','nu') //Nữ thanh niên
                                    ->count();
                $data[$key][18] = $students
                                    ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                    ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                    ->where('type_1', '==', 21) //Dân tộc thiểu số
                                    ->where('gender','nu') //Nữ thanh niên dân tộc
                                    ->count();
                $data[$key][19] = $students
                                    ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                    ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                    ->where('id_ethnic', '==', 19) //Thanh niên dân tộc khmer
                                    ->count();
                $data[$key][20] = $students
                                    ->where('date_of_birth', '>=', now()->subYears(30)) // Ngày sinh lớn hơn hoặc bằng 30 năm trước
                                    ->where('date_of_birth', '<=', now()->subYears(15)) // Ngày sinh nhỏ hơn hoặc bằng 15 năm trước
                                    ->where('id_ethnic', '==', 18) //Thanh niên dân tộc hoa
                                    ->count();
                $data[$key][21] = $students
                                    ->where('class', '>', 9) // Tốt nghiệp THCS
                                    ->count();
            }
        } else {
            for($i = 0; $i < 21; $i++) {
                $data[0][$i] = 0;
            }
        }
    //     echo '<pre>';
    // print_r($data);
    // echo '</pre>';die;

        return $data;
    }

    public static function sum_array($type, $data) {

        if($type == 'type_1') {
            // Kiểm tra xem phần tử đầu tiên của mỗi mảng con có phải là số hay không
            $isNumericFirstElement = is_numeric(reset($data)[0]);

            if(is_numeric(reset($data)[0]) == 1) {
                // Số cột trong mảng con
                $numColumns = count(reset($data));
                // Khởi tạo mảng để lưu trữ tổng theo cột
                $totalColumns = array_fill(0, $numColumns, 0);
            } else {
                $numColumns = count(reset($data)) - 1;
                $totalColumns = array_fill(1, $numColumns, 0);
            }
            // Lặp qua các mảng con và cộng tổng theo cột
            foreach ($data as $row) {
                // Bắt đầu từ vị trí 0 nếu phần tử đầu tiên là số, ngược lại bắt đầu từ vị trí 1
                $startIdx = $isNumericFirstElement ? 0 : 1;

                for ($i = $startIdx; $i < $numColumns; $i++) {
                    // Kiểm tra xem giá trị có phải là số không
                    if (is_numeric($row[$i])) {            
                        $totalColumns[$i] += $row[$i];
                    }
                }
            }
        } else {
    
 
            $numColumns = count(reset($data));
            $totalColumns = array_fill(0, $numColumns, 0);
            // Lặp qua các mảng con và cộng tổng theo cột
            foreach ($data as $row) {
                // Bắt đầu từ vị trí 0 nếu phần tử đầu tiên là số, ngược lại bắt đầu từ vị trí 1

                for ($i = 0; $i < $numColumns; $i++) {

                    // Kiểm tra xem giá trị có phải là số không
                    if (is_numeric($row[$i])) {            
                        $totalColumns[$i] += $row[$i];
                    }
                }
            }
        }
        

        

        return $totalColumns;
    }

        // if(is_numeric(reset($data)[0]) == 1) {
        //     // Số cột trong mảng con
        //     $numColumns = count(reset($data));
        //     // Khởi tạo mảng để lưu trữ tổng theo cột
        //     $totalColumns = array_fill(0, $numColumns, 0);
        // } else {
        //     $numColumns = count(reset($data)) - 1;
        //     $totalColumns = array_fill(1, $numColumns, 0);
        // }
            
        // // Lặp qua các mảng con và cộng tổng theo cột
        // foreach ($data as $row) {
        //     for ($i = 0; $i < $numColumns; $i++) {
        //         if(is_numeric( $row[$i] ) == 1 )
        //             $totalColumns[$i] += $row[$i];
        //     }
        // }

}
