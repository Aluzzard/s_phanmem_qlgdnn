<?php
namespace App\Http\Requests\MainStructure;

use Illuminate\Foundation\Http\FormRequest;

class WebsiteInformationRequest extends FormRequest {

    public function rules($id) {
        return [
        	'name'                       =>'required',
            'address'                    =>'required'
        ];
    }

    public function messages()
    {
        return [
        	'name.required'              =>'Nhập tên doanh nghiệp!',
            'address.required'           =>'Nhập địa chỉ!',
        ];
    }
}
