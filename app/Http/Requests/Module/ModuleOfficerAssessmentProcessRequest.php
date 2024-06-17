<?php

namespace App\Http\Requests\Module;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ModuleOfficerAssessmentProcessRequest extends FormRequest {

    public function rules($id) {
        return [
            'health_assessment'             => 'required',
            'moral_assessment'              => 'required',
            'professional_assessment'       => 'required',
            'general_assessment'            => 'required',
            'id_course'                     => 'required',
            'id_semester'                   => 'required'
        ];
    }

    public function messages()
    {
        return [
            
        ];
    }    
}
