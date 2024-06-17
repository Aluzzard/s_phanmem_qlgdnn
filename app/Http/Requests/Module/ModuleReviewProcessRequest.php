<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleReviewProcessRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                 => 
                [
                    'required', 
                    Rule::unique('module_review_processes')
                    ->where(function ($query) {
                        $query->where('id_site', Auth::guard('user')->user()->id_site);
                    })
                    ->ignore($id)
                ],
        ];
    }

    public function messages()
    {
        return [
            'name.required'              =>'Vui lòng nhập tên khóa học!',
            'name.unique'                =>'Khóa học đã tồn tại!'
        ];
    }    
}
