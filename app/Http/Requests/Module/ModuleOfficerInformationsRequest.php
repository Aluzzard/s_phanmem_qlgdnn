<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleOfficerInformationsRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name' => 
                [
                    'required', 
                    Rule::unique('module_officer_informations')
                    ->where(function ($query) {
                        $query->where('id_site', Auth::guard('user')->user()->id_site);
                    })
                    ->ignore($id),
                ]
        ];
    }

    public function messages()
    {
        return [
            'name.required'              =>'Vui lòng nhập tên thông tin cán bộ, giáo viên!',
            'name.unique'                =>'Thông tin cán bộ, giáo viên đã tồn tại!',
        ];
    }    
}
