<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleOfficerWorkProcessRequest extends FormRequest {

    public function rules($id) {
        return [
        	'information'           => 'required',
            'from_the_time'         => 'required',
            'till_the_time'         => 'required | after:from_the_time'
        ];
    }

    public function messages()
    {
        return [
            'information.required'              =>'Vui lòng nhập Chức danh, chức vụ, đơn vị công tác!',
            'from_the_time.required'            =>'Vui lòng nhập Từ thời điểm!',
            'till_the_time.required'            =>'Vui lòng nhập Đến thời điểm!',
            'till_the_time.after'               =>'Thời gian kết thúc sau ngày bắt đầu!'
        ];
    }    
}
