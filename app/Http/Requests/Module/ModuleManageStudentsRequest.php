<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleManageStudentsRequest extends FormRequest {

    public function rules($id) {
        return [
            'name' => 
                [
                    'required'
                ],
            'identification_id_card' => [
                'required',
                Rule::unique('module_manage_students')
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
            'name.required'              =>'Vui lòng nhập tên thông tin học viên!',
            'identification_id_card.required' => 'Vui lòng nhập số chứng minh nhân dân!',
            'identification_id_card.unique' => 'Số chứng minh nhân dân đã tồn tại!',
        ];
    }    
}
