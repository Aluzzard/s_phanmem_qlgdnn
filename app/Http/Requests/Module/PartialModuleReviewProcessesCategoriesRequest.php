<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class PartialModuleReviewProcessesCategoriesRequest extends FormRequest {

    public function rules($request) {
        return [
        	'name' => 
                [
                    'required', 
                    Rule::unique('partial_module_review_processes_categories')
                            ->where('id_site', Auth::guard('user')->user()->id_site)
                            ->where('type', $request['type'])
                            ->where('id_training_specialty', $request['id_training_specialty'])
                            ->ignore($request['id'])
                ]
        ];
    }

    public function messages()
    {
        return [
            'name.required'              =>'Vui lòng nhập tên danh mục!',
            'name.unique'                =>'Danh mục đã tồn tại!',
        ];
    }    
}
