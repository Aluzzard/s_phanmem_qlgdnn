<?php
namespace App\Http\Controllers\MainStructure\Admins;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Validator;
//Models
use App\Models\MainStructure\SysWebsiteInformation;
//Requests
use App\Http\Requests\MainStructure\WebsiteInformationRequest;
//Controllers
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class WebsiteInformationController extends Controller {

	public function __construct() {
        $this->path = '/upload/mainstructure/logo/';
        if (!\File::exists(public_path().$this->path)) {
            \File::makeDirectory(public_path().$this->path, 0755, true);
        }
    }

	public function index(){
		$data['information'] = SysWebsiteInformation::first();
		if (Auth::guard('user')->check() == true){
			if( GlobalFunction::checkRoleFunctionByUser('view', 100) == false ){
	    		abort('404');
	    	} else {
				return view('mainstructure.pages.users.WebsiteInformation.WebsiteInformation', $data);
			}
		} 
		else if (Auth::guard('admin')->check() == true){
			return view('mainstructure.pages.admins.WebsiteInformation.WebsiteInformation', $data);
		}
	}
	public function ajax(Request $request){
		$action_type = $request->input('action_type');
		if(Auth::guard('user')->check()){
			if ($action_type == 'view_website_information' ) {
				if( GlobalFunction::checkRoleFunctionByUser('view', 100) == true ){
					return $this->view_websiteInformation();
				} else {
					return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
				}
        	} else if ($action_type == 'edit_website_information' ) {
        		if( GlobalFunction::checkRoleFunctionByUser('view', 100) == true ){
					return $this->edit_websiteInformation($request);
				} else {
					return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
				}
        	} 
		} else if(Auth::guard('admin')->check()){
        	if ($action_type == 'view_website_information' ) {
        		return $this->view_websiteInformation();
        	}
        	else if ($action_type == 'edit_website_information' ) {
    	        return $this->edit_websiteInformation($request);
        	} 
        	else if ($action_type == 'edit_website_config' ) {
        		return $this->edit_websiteConfig($request);
        	}
        	else if ($action_type == 'edit_website_seo' ) {
        		return $this->edit_websiteSEO($request);
        	}
        } else {
            abort('404');
        }
	}

	public function view_websiteInformation(){
		try {
			$information = SysWebsiteInformation::find(1);
			return response()->json(['error'=> false, 'message' => 'Lấy dữ liệu thành công', 'result' => $information]);
		} catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
	}
	public function edit_websiteInformation($request){
		try {
			$validator = Validator::make($request->all(), WebsiteInformationRequest::rules($request->input('id')), WebsiteInformationRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
				$input = $request->input();
				$information = SysWebsiteInformation::find(1);
				if($request->hasFile('logo')){
					if($information->logo != ''){
						unlink(public_path().$information->logo);
					}
		    		$file = $request->file('logo');
		    		$file_extension = $file->getClientOriginalExtension(); // Lấy đuôi của file
	                $file_name = $file->getClientOriginalName();
	                $file->move(public_path().$this->path,$file_name);
	                $input['logo'] = $this->path.$file_name;
		    	}
				$information->update($input);
				return response()->json(['error'=> false, 'message' => 'Chỉnh sửa thông tin website thành công', 'option_response_private' => true, 'data'=>$information]);
			}
		} catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
	}
	public function edit_websiteConfig($request){
		try {
			// $validator = Validator::make($request->all(), WebsiteInformationRequest::rules($request->input('id')), WebsiteInformationRequest::messages());
   //          if($validator->fails()){
   //              return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
   //          } else {
				$information = SysWebsiteInformation::find(1);
				$information->color_gradient = $request->input('color_gradient');
				$information->color_background = $request->input('color_background');
				$information->color_font = $request->input('color_font');
				$information->color_font_hover = $request->input('color_font_hover');
				$information->color_font_focus = $request->input('color_font_focus');
				$information->update();
				return response()->json(['error'=> false, 'message' => 'Chỉnh sửa cấu hình website thành công', 'option_response_private' => true, 'data'=>$information]);
			// }
		} catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
	}
	public function edit_websiteSEO($request){
		try {
			// $validator = Validator::make($request->all(), WebsiteInformationRequest::rules($request->input('id')), WebsiteInformationRequest::messages());
   //          if($validator->fails()){
   //              return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
   //          } else {
				$information = SysWebsiteInformation::find(1);
				$information->meta_title 		= $request->input('meta_title');
				$information->meta_description 	= $request->input('meta_description');
				$information->keywords 			= $request->input('keywords');
				$information->author 			= $request->input('author');
				$information->country 			= $request->input('country');
				$information->meta_dc_title 	= $request->input('meta_dc_title');
				$information->meta_geo_region 	= $request->input('meta_geo_region');
				$information->meta_geo_placename= $request->input('meta_geo_placename');
				$information->meta_geo_position = $request->input('meta_geo_position');
				$information->meta_icbm 		= $request->input('meta_icbm');
				$information->update();
				return response()->json(['error'=> false, 'message' => 'Chỉnh sửa cấu hình website thành công', 'option_response_private' => true, 'data'=>$information]);
			// }
		} catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
	}
}
