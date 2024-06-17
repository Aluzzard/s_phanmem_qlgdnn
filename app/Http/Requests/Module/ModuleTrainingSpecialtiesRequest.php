<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleTrainingSpecialtiesRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                              => 
                [
                    'required', 
                    Rule::unique('module_training_specialties')
                    ->where(function ($query) {
                        $query->where('id_site', Auth::guard('user')->user()->id_site);
                    })
                    ->ignore($id)
                ],
            'duration_by_month'                 => 'required',
            'duration_by_day'                   => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.required'              =>'Vui lòng nhập danh mục ngành đào tạo!',
            'name.unique'                =>'Danh mục ngành đào tạo đã tồn tại!',
            'duration_by_month.required' =>'Vui lòng nhập thời gian đào tạo (tháng)!',
            'duration_by_day.required'   =>'Vui lòng nhập thời gian đào tạo (ngày)!',
        ];
    }    
}
