<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleVocationalEducationPolicitiesRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                              => 
                [
                    'required', 
                    Rule::unique('module_vocational_education_policities')
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
            'name.required'              =>'Vui lòng nhập danh mục ngành đào tạo!',
            'name.unique'                =>'Danh mục ngành đào tạo đã tồn tại!'
        ];
    }    
}
