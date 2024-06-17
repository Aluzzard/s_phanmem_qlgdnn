<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleTypeOfRecruitmentsRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name' => 
                [
                    'required', 
                    Rule::unique('module_type_of_recruitments')
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
            'name.required'              =>'Vui lòng nhập danh mục tuyển sinh/ưu tiên!',
            'name.unique'                =>'Danh mục tuyển sinh/ưu tiên đã tồn tại!',
        ];
    }    
}
