<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleTypeOfDepartmentsRequest extends FormRequest {

    public function rules($id) {
        return [
            'code' => 'required',
        	'name' => 
                [
                    'required', 
                    Rule::unique('module_type_of_departments')
                    ->where(function ($query) {
                        $query->where('id_site', Auth::guard('user')->user()->id_site);
                    })
                    ->ignore($id)
                ]
        ];
    }

    public function messages()
    {
        return [
            'code.required'              =>'Vui lòng nhập mã khoa/phòng!',
            'name.required'              =>'Vui lòng nhập tên khoa/phòng!',
            'name.unique'                =>'Khóa học đã tồn tại!'
        ];
    }    
}
