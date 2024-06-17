<?php

namespace App\Http\Controllers\MainStructure\Users;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\SysModulePermissionsAccordingToUser;
use App\Models\MainStructure\SysFunctionPermissionsAccordingToUser;
use Illuminate\Support\Facades\Auth;

class GlobalFunction extends Controller {
    //Check module permission by user
    public function checkRoleModuleByUser($action) {
        $user_id = Auth::guard('user')->id();
        $access_request_slug_module = request()->segment(count(request()->segments()));
        $access_request_slug_module_after = preg_replace("/[0-9]/", "", $access_request_slug_module); //Loại bỏ các ký tự số khi gọi ajax
        $module_id = SysListModules::where('slug', 'like', $access_request_slug_module_after)
                                                        ->firstOrFail()
                                                        ->id;
        $list_module_permission = SysModulePermissionsAccordingToUser::whereUserId( $user_id )
                                                        ->whereAction($action)
                                                        ->firstOrFail()
                                                        ->module_permissions;

        $array_permission = explode(",", $list_module_permission );
        
        if( !in_array($module_id, $array_permission) == 1){
            return false;
        } else {
            return true;
        }    	
    }
    //Check function permission by user
    public function checkRoleFunctionByUser($action, $function_id) {
        $user_id = Auth::guard('user')->id();
        if( $user_id != 1 ) {
            $list_permission = SysFunctionPermissionsAccordingToUser::whereUserId( $user_id )
                                                            ->whereAction($action)
                                                            ->firstOrFail()
                                                            ->function_permissions;
            $array_permission = explode(",", $list_permission );
            if( !in_array($function_id, $array_permission) == 1){
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    }
}
