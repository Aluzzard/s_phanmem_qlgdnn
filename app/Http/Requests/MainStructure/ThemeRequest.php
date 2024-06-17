<?php

namespace App\Http\Requests\MainStructure;

use Illuminate\Foundation\Http\FormRequest;

class ThemeRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                       =>'required | unique:sys_themes,name,'.$id,
            'code'                       =>'required | unique:sys_themes,code,'.$id,
        ];
    }

    public function messages()
    {
        return [
        	'name.unique'                =>'Tên đã tồn tại!',
            'name.required'              =>'Vui lòng nhập tên!',
            'code.unique'                =>'Tên rút gọn đã tồn tại!',
            'code.required'              =>'Vui lòng nhập tên rút gọn!',
        ];
    }
}
