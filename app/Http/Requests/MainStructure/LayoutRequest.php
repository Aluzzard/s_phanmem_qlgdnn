<?php

namespace App\Http\Requests\MainStructure;

use Illuminate\Foundation\Http\FormRequest;

class LayoutRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                       =>'required | unique:sys_guest_layouts,name,'.$id,
        ];
    }

    public function messages()
    {
        return [
        	'name.unique'                =>'Tên đã tồn tại!',
            'name.required'              =>'Vui lòng nhập tên!',
        ];
    }
}
