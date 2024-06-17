<?php

namespace App\Http\Requests\MainStructure;

use Illuminate\Foundation\Http\FormRequest;

class SiteRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                       =>'required | unique:sys_sites,name,'.$id,
            'folder_for_save'            =>'required | unique:sys_sites,folder_for_save,'.$id,
            'storage'                    =>'required',
        ];
    }

    public function messages() {
        return [
        	'name.unique'                =>'Tên site đã tồn tại!',
            'name.required'              =>'Vui lòng nhập tên site!',
            'folder_for_save.required'   =>'Vui lòng nhập thư mục lưu trữ!',
            'folder_for_save.unique'     =>'Thư mục lưu trữ đã tồn tại!',
            'storage.required'           =>'Vui lòng nhập dung lượng lưu trữ!',
        ];
    }

    public function rules1() {
        return [
            'account'                    =>'required | unique:account_users',
            'password'                   =>'required',
        ];
    }

    public function messages1() {
        return [
            'account.required'           =>'Vui lòng nhập tên đăng nhập',
            'account.unique'             =>'Tên đăng nhập đã tồn tại',
            'password.required'          =>'Vui lòng nhập mật khẩu',
        ];
    }

}
