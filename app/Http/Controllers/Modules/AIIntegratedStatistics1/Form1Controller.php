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
        if( $request->input('form') && $request->input('year') ) {
            //Phi nông nghiệp
            //Sơ cấp
            $array_training_specialty_so_cap = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 2) //Sơ cấp
                                            ->where('type_2', 1) //Phi nông nghiệp
                                            ->get()->pluck('id')
                                            ->toArray();
            $courses_so_cap = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->whereIn('id_training_specialty', $array_training_specialty_so_cap)
                                            ->get();
            if(count($courses_so_cap) > 0) {
                $data['socap']['detail'] = self::partialForm1($courses_so_cap, null);
                $data['socap']['sum'] = self::sum_array($data['socap']['detail']);
            } else {
                $data['socap']['sum'] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            }
    
            //Dưới 3 tháng
            $array_training_specialty_duoi_3_thang = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_1', 1)
                                            ->where('type_2', 1)
                                            ->get()->pluck('id')
                                            ->toArray();
            $courses_duoi_3_thang = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->whereIn('id_training_specialty', $array_training_specialty_duoi_3_thang)
                                            ->get();
            if(count($courses_duoi_3_thang) > 0) {
                $data['duoi3thang']['detail'] = self::partialForm1($courses_duoi_3_thang, null);
                $data['duoi3thang']['sum'] = self::sum_array($data['duoi3thang']['detail']);
            } else {
                $data['duoi3thang']['sum'] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            }
            //Tổng phi nông nghiệp
            $data['phinn']['sum'] = self::sum_array( [$data['socap']['sum'], $data['duoi3thang']['sum']] );
    //         echo '<pre>';
    // print_r($data['socap']['sum']);
    // echo '</pre>';die;
            //Nông nghiệp
            $array_training_specialty_nong_nghiep = ModuleTrainingSpecialties::select('id')
                                            ->whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('type_2', 2)
                                            ->get()
                                            ->pluck('id')
                                            ->toArray();
            $courses_nong_nghiep = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->whereIn('id_training_specialty', $array_training_specialty_nong_nghiep)
                                            ->get();
            if(count($courses_nong_nghiep) > 0) {
                $data['nongnghiep']['detail'] = self::partialForm1($courses_nong_nghiep, null);
                $data['nongnghiep']['sum'] = self::sum_array($data['nongnghiep']['detail']);
            }



            //Độ tuổi
            $courses_do_tuoi = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->where('year', $request->input('year') )
                                            ->get();
            $data['under25']['detail'] = self::partialForm1($courses_do_tuoi, 'under25');
            $data['under25']['sum'] = self::sum_array($data['under25']['detail']);

            $data['26to30']['detail'] = self::partialForm1($courses_do_tuoi, '26to30');
            $data['26to30']['sum'] = self::sum_array($data['26to30']['detail']);

            $data['31to45']['detail'] = self::partialForm1($courses_do_tuoi, '31to45');
            $data['31to45']['sum'] = self::sum_array($data['31to45']['detail']);

            $data['above45']['detail'] = self::partialForm1($courses_do_tuoi, 'above45');
            $data['above45']['sum'] = self::sum_array($data['above45']['detail']);


    //         echo '<pre>';
    // print_r( $data['socap']['sum'] + $data['duoi3thang']['sum'] );
    // echo '</pre>';die;

 

                                            // ModuleManageStudents
            // $data['socap'] = [0, 90, 0, 90, 0, 0, 0, 88, 2, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0];
            return $data;
        }
        
    }

    public static function partialForm1($courses, $ageCondition = null) {
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
        return $data;
    }
    public static function sum_array($data) {
        // Số cột trong mảng con
        $numColumns = count($data[0]) - 1;

        // Khởi tạo mảng để lưu trữ tổng theo cột
        $totalColumns = array_fill(1, $numColumns, 0);

        // Lặp qua các mảng con và cộng tổng theo cột
        foreach ($data as $row) {
            for ($i = 1; $i < $numColumns; $i++) {
                $totalColumns[$i] += $row[$i];
            }
        }
        return $totalColumns;
    }

}
