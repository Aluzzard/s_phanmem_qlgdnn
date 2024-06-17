<?php
namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
//Models
use App\Models\MainStructure\AccountUsers;
use App\Models\MainStructure\AccountAdministrators;

class ChangePasswordController extends Controller {
    
    public function index() {
        return view('auth.change_password');
    }

    public function ajax(Request $request){
    	try {
    		$input = $request->all();
            Auth::guard('admin')->check() == 1 ? $user = AccountAdministrators::findOrFail(Auth::id()) : $user = AccountUsers::findOrFail(Auth::id()) ;
    		if( $input['new_password'] != $input['confirm_password'] ){
	    		return response()->json(['error'=>true, 'message'=>'Mật khẩu mới và xác nhận mật khẩu mới không trùng khớp']);
    		} else if( Hash::check($input['old_password'], $user->password) ){
    			$user->fill([
			    	'password' => Hash::make($input['new_password'])
			    ])->save();

    			return response()->json(['error'=>false, 'message'=>'Đổi mật khẩu thành công!']);
    		} else {
			    return response()->json(['error'=>true, 'message'=>'Mật khẩu cũ không đúng!']);
			}

    	} catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Đổi mật khẩu thất bại!']);
        }
    }



}
