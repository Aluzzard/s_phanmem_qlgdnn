<?php

namespace App\Http\Requests\MainStructure;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest {

    public function rules($id) {
        return [
        	'account'                       =>'min: 8 | unique:account_users,account,'.$id,
            'name'                          =>'min: 8',
            'password'                      =>'nullable | min:8'
        ];
    }

    public function messages()
    {
        return [
        	'account.unique'                =>'Tên đăng nhập đã tồn tại!',
            'account.min'                   =>'Tên đăng nhập tối thiểu 8 ký tự!',
            'name.min'                      =>'Tên người dùng tối thiểu 8 ký tự!',
            'password.min'                  =>'Mật khẩu tối thiểu 8 ký tự!'
        ];
    }
}
