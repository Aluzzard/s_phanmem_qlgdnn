<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleTypeOfCoursesRequest extends FormRequest {

    public function rules($request) {
        return [
            'id_training_specialty' =>'required', 
        	'name'                  => 
                [
                    'required', 
                    Rule::unique('module_type_of_courses')
                            ->where('id_site', Auth::guard('user')->user()->id_site)
                            ->where('id_training_specialty', $request['id_training_specialty'])
                            ->where('year', $request['year'])
                            ->ignore($request['id'])
                ],
            'from_the_time'         =>'required', 
            'till_the_time'         =>'required',
            'exam_date'             =>'required'
        ];
    }

    public function messages()
    {
        return [
            'id_training_specialty.required'        =>'Vui lòng chọn Ngành đào tạo', 
            'name.required'                         =>'Vui lòng nhập Tên khóa học!',
            'name.unique'                           =>'Khóa học đã tồn tại!',
            'from_the_time.required'                =>'Vui lòng nhập Thời gian bắt đầu khóa học!',
            'till_the_time.required'                =>'Vui lòng nhập Thời gian kết thúc khóa học!',
            'exam_date.required'                    =>'Vui lòng nhập Thời gian thi!'
        ];
    }    
}
