<?php

namespace App\Http\Controllers\MainStructure\Admins;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\SysGroupsModules;
use App\Models\MainStructure\SysFunctionOfControllers;

class ModuleController extends Controller {

/* ------------------------------------ Danh sách các modules ------------------------------------- */
	public function __construct() {
        $this->path = "/upload/mainstructure/icon/module/";
        if (!\File::exists(public_path().$this->path)) {
            \File::makeDirectory(public_path().$this->path, 0755, true);
        }
    }

	public function list_module(){
		$groups = SysGroupsModules::all();
		$html = $this->dataTable();
		return view('mainstructure.pages.admins.Module.Module',['groups' => $groups, 'table_module' => $html]);
	}
	//
	public function action_module(Request $request){
		$action_type = $request->input('input_action_type');
		if ( $action_type == 'viewModule' ) {
			try {
				$module = SysListModules::find( $request->input('id_module') );
				return response()->json(['error'=>false, 'module'=>$module]);
			} catch(Exception $e) {
				return response()->json(['error'=>true, 'message'=>'Không thể lấy dữ liệu!']);
			}
		}
		else if( $action_type == 'addModule' ) {
			try{
            	$module = new SysListModules;
                $module->name = $request->input('input_name');
                $module->slug = $request->input('input_slug');
                $module->path_controller = $request->input('input_path_controller');
                $module->path_view = $request->input('input_name_blade');
                $module->type = $request->input('input_type');
                $module->order = $request->input('input_order');
                $module->id_group = $request->input('input_group_module');
                if($request->hasFile('input_avatar')){
	                // $file_name = $file->getClientOriginalName();
		            $file = $request->file('input_avatar');
		    		$file_extension = $file->getClientOriginalExtension(); // Lấy đuôi của file
	                $file->move(public_path().$this->path,$request->input('input_name_controller').'.'.$file_extension);
	                $module->avatar = $this->path.$request->input('input_name_controller').'.'.$file_extension;
		    	}
                $module->controller = $request->input('input_name_controller');
                $module->description = $request->input('input_description');
                $module->active = $request->input('input_active') == 1 ? 1 : 0;
                $module->save();
                $html = $this->dataTable();
				return response()->json(['error'=>false, 'message'=>'Thêm mới thành công!', 'table_module' => $html]);
            } catch (Exception $e) {
                return response()->json(['error'=>true, 'message'=>'Thêm mới thất bại!']);
            }
		}
		else if( $action_type == 'editModule' ) {
			try{
            	$module = SysListModules::find( $request->input('input_id_module') );
                $module->name = $request->input('input_name');
                $module->slug = $request->input('input_slug');
                $module->path_controller = $request->input('input_path_controller');
                $module->path_view = $request->input('input_name_blade');
                $module->type = $request->input('input_type');
                $module->order = $request->input('input_order');
                $module->id_group = $request->input('input_group_module');
                if($request->hasFile('input_avatar')){
                	if($module->avatar != ''){
                        unlink(public_path().$module->avatar);
                    }
		    		$file = $request->file('input_avatar');
		    		$file_extension = $file->getClientOriginalExtension(); // Lấy đuôi của file
	                $file->move(public_path().$this->path,$request->input('input_name_controller').'.'.$file_extension);
	                $module->avatar = $this->path.$request->input('input_name_controller').'.'.$file_extension;
		    	}
                $module->controller = $request->input('input_name_controller');
                $module->description = $request->input('input_description');
                $module->active = $request->input('input_active') == 1 ? 1 : 0;
                $module->save();
                $html = $this->dataTable();
				return response()->json(['error'=>false, 'message'=>'Chỉnh sửa thành công!', 'table_module' => $html]);
            } catch (Exception $e) {
                return response()->json(['error'=>true, 'message'=>'Chỉnh sửa thất bại!']);
            }
		}
		else if( $action_type == 'delModule' ) {
			try{
            	$module = SysListModules::find( $request->input('input_id_module') );
                $module->delete();
                if($module->avatar != ''){
                        unlink(public_path().$module->avatar);
                    }
                $html = $this->dataTable();
				return response()->json(['error'=>false, 'message'=>'Xoá thành công!', 'datatable' => $html, 'type' => $action_type]);
            } catch (Exception $e) {
                return response()->json(['error'=>true, 'message'=>'Xoá thất bại!']);
            }
		} else if ( $action_type == 'viewFunctionModule') {
			try {
				$functions = SysFunctionOfControllers::where('id_module', $request->input('id_module'))->get();
				$htmlFunction = $this->dataFunctionModule($functions);
				return response()->json(['error'=>false, 'html'=>$htmlFunction, 'id_module'=>$request->input('id_module') ]);
			} catch (Exception $e) {
                return response()->json(['error'=>true, 'message'=>'Chỉnh sửa thất bại!']);
            }
		} else if ( $action_type == 'viewGroupsModule') {
			try {
				$group_modules = $this->dataGroupModule();
				return response()->json(['error'=>false, 'html'=>$group_modules ]);
			} catch (Exception $e) {
                return response()->json(['error'=>true, 'message'=>'Chỉnh sửa thất bại!']);
            }
		}

	}

	// Danh sách các modules
	public function dataTable(){
		$modules = SysListModules::orderBy('active', 'desc')->orderBy('id_group')->get();
		$html = '';
		if($modules){
			foreach ($modules as $key=>$module){
				$html .= '<tr>';
				$html .= '	<td>'.($key+1).'</td>';
				$html .= '	<td>'.$module->name.'</td>';
				$html .= '	<td>'.$module->description.'</td>';
				if( $module->active == 1 ){
					$html .= '	<td class="text-success"><strong>Mở</strong></td>';
				} else if ( $module->active == 0 ) {
					$html .= '	<td class="text-danger"><strong>Tắt</strong></td>';
				}
				if( $module->type == 1 ){
					$html .= '	<td>AI</td>';
				} else if ( $module->type == 2 ) {
					$html .= '	<td>UI</td>';
				}
				$html .= '	<td>'.$module->controller.'</td>';
				$html .= '	<td>'.$module->by_group->name.'</td>';
				$html .= '	<td>';
				$html .= '			<button type="button" class="btn btn-custon-four btn-warning" data-toggle="modal" data-target="#ActionModule" onclick="func_buttonClick(`editModule`,'.$module->id.')">
										<i class="fa big-icon fa-pencil"></i><span class="ml-2">Sửa</span>
									</button>';
				$html .= '			<button type="button" class="btn btn-custon-four btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delModule`,'.$module->id.')">
										<i class="fa big-icon fa-times"></i><span class="ml-2">Xóa</span>
									</button>';
				$html .= '			<button type="button" class="btn btn-custon-four btn-info" data-toggle="modal" data-target="#configModule" onclick="func_buttonClick(`configModule`,'.$module->id.')">
										<i class="fa big-icon fa-cogs"></i><span class="ml-2">Cấu hình</span>
									</button>';
				$html .= '	</td>';
				$html .= '</tr>';
			}
		}
		return $html;
	}

/* ------------------------------------ Cấu hình các chức năng của module ------------------------------------- */

	//Data function module
	public function dataFunctionModule($p_data){
		$html = '';
		if($p_data){
			foreach ($p_data as $function){
				$html .= '<tr onclick="func_buttonModalConfigClick(`editFunction`,'.$function->id.')">';
				if ( $function->method == 1 ){
					$html .= '	<td><span class="btn btn-warning"> GET </span></td>';
				} else {
					$html .= '	<td><span class="btn btn-primary"> POST </span></td>';
				}

				$html .= '	<td>'.$function->function.'</td>';
				$html .= '	<td>'.$function->description.'</td>';
				$html .= '	<td>';
				$html .= '			<button type="button" class="btn btn-custon-four btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonModalConfigClick(`delFunction`,'.$function->id.')">
										<i class="fa big-icon fa-times"></i><span class="ml-2">Xóa</span>
									</button>';
				$html .= '	</td>';
				$html .= '</tr>';
			}
		}
		return $html;
	}

	public function action_function(Request $request){
		$action_type = $request->input('input_action_type');

		if($action_type == 'viewFunction'){
			try {
				$function = SysFunctionOfControllers::find( $request->input('id_module') );
				return response()->json(['error'=>false, 'message'=>'Lấy dữ liệu chức năng thành công!', 'function' => $function]); 
			} catch (Exception $e) {
				return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu chức năng thất bại!']); 
			}
			
		} else if ($action_type == 'addFunction'){
			try {
				$function = new SysFunctionOfControllers;
				$function->function = $request->input('input_name_function');
				$function->id_module = $request->input('input_id_module');
				$function->method = $request->input('input_method_function');
				$function->description = $request->input('input_description_function');
				$function->save();

				$functions = SysFunctionOfControllers::where('id_module', $request->input('input_id_module') )->get();
				$html = $this->dataFunctionModule($functions);
				return response()->json(['error'=>false, 'message'=>'Thêm mới chức năng thành công!', 'datatable' => $html]); 
			} catch (Exception $e) {
				return response()->json(['error'=>true, 'message'=>'Thêm mới chức năng thất bại!']); 
			}
		} else if ($action_type == 'editFunction') {
			$function = SysFunctionOfControllers::find( $request->input('input_id_function') );
			$function->function = $request->input('input_name_function');
			$function->id_module = $request->input('input_id_module');
			$function->method = $request->input('input_method_function');
			$function->description = $request->input('input_description_function');
			$function->update();

			$functions = SysFunctionOfControllers::where('id_module', $request->input('input_id_module') )->get();
			$html = $this->dataFunctionModule($functions);
			return response()->json(['error'=>false, 'message'=>'Cập nhật thành công!', 'datatable' => $html]); 
		} else if ($action_type == 'delFunction') {
			$function = SysFunctionOfControllers::find( $request->input('input_id_module') );
			$function->delete();

			$functions = SysFunctionOfControllers::where('id_module', $function->id_module )->get();
			$html = $this->dataFunctionModule($functions);
			return response()->json(['error'=>false, 'message'=>'Xóa dữ liệu thành công!', 'datatable' => $html, 'type' => $action_type]); 
		}	
	}
//End cấu hình các chức năng

/* ------------------------------------ Nhóm các modules ------------------------------------- */
	//Data function module
	public function dataGroupModule(){
		$html = '';
		$groupModules = SysGroupsModules::orderBy('order')->get();
		if($groupModules){
			foreach ($groupModules as $groupModule){
				$html .= '<tr onclick="func_buttonModalGroupsModuleClick(`editGroupModules`,'.$groupModule->id.')">';
				$html .= '	<td>'.$groupModule->name.'</td>';
				$html .= '	<td>'.$groupModule->order.'</td>';
				$html .= '	<td>';
				$html .= '			<button type="button" class="btn btn-custon-four btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonModalGroupsModuleClick(`delGroupModules`,'.$groupModule->id.')">
										<i class="fa big-icon fa-times"></i><span class="ml-2">Xóa</span>
									</button>';
				$html .= '	</td>';
				$html .= '</tr>';
			}
		}
		return $html;
	}

	public function action_groups_modules(Request $request){
		$action_type = $request->input('input_action_type');

		if($action_type == 'viewGroupModules'){
			try {
				$group_modules = SysGroupsModules::find( $request->input('id_group_module') );
				return response()->json(['error'=>false, 'message'=>'Lấy dữ liệu chức năng thành công!', 'group_modules' => $group_modules]); 
			} catch (Exception $e) {
				return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu chức năng thất bại!']); 
			}
			
		} else if ($action_type == 'addGroupModules'){
			try {
				$group_modules = new SysGroupsModules;
				$group_modules->name = $request->input('input_name_group_modules');
				$group_modules->order = $request->input('input_order_group_modules') == '' ? '0' : $request->input('input_order_group_modules');
				$group_modules->save();

				$html_group_modules = $this->dataGroupModule();
				return response()->json(['error'=>false, 'message'=>'Thêm mới nhóm module thành công!', 'html_group_modules' => $html_group_modules]); 
			} catch (Exception $e) {
				return response()->json(['error'=>true, 'message'=>'Thêm mới nhóm module thất bại!']); 
			}
		} else if ($action_type == 'editGroupModules') {
			$group_modules = SysGroupsModules::find( $request->input('input_id_group_modules') );
			$group_modules->name = $request->input('input_name_group_modules');
			$group_modules->order = $request->input('input_order_group_modules') == '' ? '0' : $request->input('input_order_group_modules');
			$group_modules->update();

			$html_group_modules = $this->dataGroupModule();
			return response()->json(['error'=>false, 'message'=>'Cập nhật thành công!', 'html_group_modules' => $html_group_modules]); 
		} else if ($action_type == 'delGroupModules') {
			$group_modules = SysGroupsModules::find( $request->input('input_id_module') );
			$group_modules->delete();

			$html_group_modules = $this->dataGroupModule();
			return response()->json(['error'=>false, 'message'=>'Xóa dữ liệu thành công!', 'datatable' => $html_group_modules, 'type' => $action_type]); 
		}	
	}

//End nhóm các modules

}
