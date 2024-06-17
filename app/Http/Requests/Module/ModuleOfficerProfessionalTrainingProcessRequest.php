<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleOfficerProfessionalTrainingProcessRequest extends FormRequest {

    public function rules($id) {
        return [
            'school_name'           => 'required',
            'specialized'           => 'required',
        ];
    }

    public function messages()
    {
        return [
            'school_name.required'              =>'Vui lòng nhập Tên trường!',
            'specialized.required'              =>'Vui lòng nhập Chuyên ngành đào tạo, bồi dưỡng!',
        ];
    }    
}
