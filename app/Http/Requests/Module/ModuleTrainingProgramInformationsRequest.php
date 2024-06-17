<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleTrainingProgramInformationsRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                 => 
                [
                    'required', 
                    Rule::unique('module_training_program_informations')
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
            'name.required'              =>'Vui lòng nhập tên chương trình đào tạo!',
            'name.unique'                =>'Chương trình đào tạo đã tồn tại!'
        ];
    }    
}
