<?php
namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
//Models
use App\Models\MainStructure\AccountUsers;
use App\Models\MainStructure\AccountAdministrators;

class DetailAccountController extends Controller {
    
    public function __construct() {
        $this->path = '/upload/mainstructure/avatar_account/';
        if (!\File::exists(public_path().$this->path)) {
            \File::makeDirectory(public_path().$this->path, 0755, true);
        }
    }

    public function index() {
        return view('auth.detail_account');
    }

    public function ajax(Request $request){
    	try {
    		$action_type = $request->input('action_type');
    		if ( $action_type == 'view') {
    			Auth::guard('admin')->check() == 1 ? $user = AccountAdministrators::findOrFail(Auth::id()) 
	            								   : $user = AccountUsers::findOrFail(Auth::id());
	            return response()->json(['error'=>false, 'message'=>'Lấy dữ liệu thành công!', 'result' => $user]);
    		} else if ( $action_type == 'edit') {
    			$input = $request->all();
	            Auth::guard('admin')->check() == 1 ? $user = AccountAdministrators::findOrFail(Auth::id()) 
	            								   : $user = AccountUsers::findOrFail(Auth::id());
	    		if($request->hasFile('avatar')){
					if($user->avatar_path != ''){
						unlink(public_path().$user->avatar_path);
					}
		    		$file = $request->file('avatar');
		    		$file_extension = $file->getClientOriginalExtension(); // Lấy đuôi của file
	                $file_name = $file->getClientOriginalName();
	                $file->move(public_path().$this->path,$file_name);
	                $user->avatar_path = $this->path.$file_name;
		    	}
		    	$user->name = $request->input('name');
		    	$user->email = $request->input('email');
		    	$user->numberphone = $request->input('numberphone');
				$user->update();
				return response()->json(['error'=>false, 'message'=>'Thay đổi thông tin thành công!', 'option_response_private' => true, 'data' => $user]);
    		}
    	} catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Thay đổi thông tin thất bại!']);
        }
    }



}
