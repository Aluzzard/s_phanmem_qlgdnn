<?php

namespace App\Http\Controllers\Modules\AITrainingProgramInformations;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
//Models
use App\Models\Modules\ModuleTrainingProgramInformations;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\PartialModuleTrainingProgramInformationsFiles;
//Requests
use App\Http\Requests\Module\ModuleTrainingProgramInformationsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AITrainingProgramInformationsController extends Controller {
    public function __construct() {
        $this->path = '/app/public/cth/program/files/';
        if (!\File::exists(storage_path().$this->path)) {
            \File::makeDirectory(storage_path().$this->path, 0755, true);
        }
    }

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->get();
            return view('modules.AITrainingProgramInformations.index', $data);
        }
    }

    public function ajax(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'loaddt' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->loaddt($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if ($action_type == 'view' ) {
                if( GlobalFunction::checkRoleModuleByUser('view') == true ){
                    return $this->view($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if($action_type == 'add' ) {
                if( GlobalFunction::checkRoleModuleByUser('add') == true ){
                    return $this->add($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if( $action_type == 'edit' ) {
                if( GlobalFunction::checkRoleModuleByUser('edit') == true ){
                    return $this->edit($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
            else if($action_type == 'delete' ) {
                if( GlobalFunction::checkRoleModuleByUser('delete') == true ){
                    return $this->delete($request);
                } else {
                    return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
                }
            }
        } else {
            abort('404');
        }
    }
    
    public function dataTable(){
        $current_id_site = Auth::guard('user')->user()->id_site;
        $items = ModuleTrainingProgramInformations::whereIdSite($current_id_site)->get();
        $html = '';
        if($items){
            foreach ($items as $item){
                $html .= '<tr>';
                $html .= '  <td>'.$item->year.'</td>';
                $html .= '  <td>'.$item->training_specialty->name.'</td>';
                $html .= '  <td>'.$item->name.'</td>';
                $html .= '  <td>';
                $html .= '      <div class="button-ap-list responsive-btn">
                                    <div class="btn-group btn-custom-groups btn-custom-groups-one btn-mg-b-10">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Thao tác <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu btn-dropdown-menu" role="menu">';
                if( GlobalFunction::checkRoleModuleByUser('edit') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#fileModal" onclick="func_buttonClick(`file`,'.$item->id.')"><i class="fa fa-file pr-3"></i>File</a>
                                            </li>';
                }
                if( GlobalFunction::checkRoleModuleByUser('edit') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$item->id.')"><i class="fa fa-edit pr-3"></i>Sửa</a>
                                            </li>';
                }
                if( GlobalFunction::checkRoleModuleByUser('delete') == true){
                $html .= '                  <li>
                                                <a data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delete`,'.$item->id.')"><i class="fa fa-recycle pr-3"></i>Xóa</a>
                                            </li>';
                }
                $html .= '              </ul>
                                    </div>
                                </div>';
                $html .= '  </td>';                     
                $html .= '</tr>';
            }
        }
        return $html;
    }
    public function loaddt(Request $request) {
        try{
            $table_html = $this->dataTable($request->input());
            return response()->json(['error'=>false, 'table_html' => $table_html]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']);
        }
    }
    public function view($request){
        try {
            $item = ModuleTrainingProgramInformations::find( $request->input('id') );
            return response()->json(['error'=> false, 'item'=>$item]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleTrainingProgramInformationsRequest::rules($request->input('id')), ModuleTrainingProgramInformationsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleTrainingProgramInformations::create($input);
                $html = $this->dataTable($request->input());
                LogsController::write("AITrainingProgramInformations", "Thêm", "Chương trình đào tạo: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Thêm chương trình đào tạo thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm chương trình đào tạo thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleTrainingProgramInformationsRequest::rules($request->input('id')), ModuleTrainingProgramInformationsRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $item = ModuleTrainingProgramInformations::find( $request->input('id') );
                $item->update($input);
                $html = $this->dataTable($request->input());
                LogsController::write("AITrainingProgramInformations", "Sửa", "Chương trình đào tạo: ".$input["name"]);
                return response()->json(['error'=> false, 'message' => 'Sửa chương trình đào tạo thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa chương trình đào tạo thất bại']);
        }
    }
    public function delete($request){
        try {
            $item_id = $request->input('id');
            $item = ModuleTrainingProgramInformations::find( $item_id );
            $item->delete();
            LogsController::write("AITrainingProgramInformations", "Xoá", "Chương trình đào tạo: ".$item->name);
            
            $html = $this->dataTable($request->input());
            return response()->json(['error'=> false, 'message' => 'Xóa chương trình đào tạo thành công', 'table_html' => $html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa chương trình đào tạo thất bại']);
        }
    }
// Function File
    public function ajaxFile(Request $request){
        if( GlobalFunction::checkRoleModuleByUser('edit') == true ){
            $action_type = $request->input('action_type');
            if( $action_type == 'list' ) {
                try {
                    $id_program = $request->input('id');
                    $fileslibrary = PartialModuleTrainingProgramInformationsFiles::where('id_program',$id_program)->get();

                    if(count($fileslibrary)>0){
                        $html=$this->htmlViewPartialModuleTrainingProgramInformationsFiles($id_program);
                        return response()->json(['error'=>false, 'html'=>$html]);
                    } else {
                        return response()->json(['error'=>false, 'html'=>'<div class="px-3">Không có file trong chương trình đào tạo file</div>']);
                    }
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu không thành công!']);
                }
            }
            if( $action_type == 'file' ){
                try {
                    $file = PartialModuleTrainingProgramInformationsFiles::find( $request->input('id') );
                    return response()->json(['error'=>false, 'message'=>'Lấy dữ liệu thành công!', 'file'=>$file]);
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu không thành công!']);
                }
            } 
            if( $action_type == 'add' ){
                try{
                    $myFile = $_FILES['addfiles'];
                    $fileCount = count($myFile["name"]);
                    for ($i = 0; $i < $fileCount; $i++) {
                        $file = new PartialModuleTrainingProgramInformationsFiles;
                        $file->id_program=$request->input('id_program');
                        $random_file_name = Str::random(4).'_'.$myFile["name"][$i];
                        while(file_exists(storage_path().$this->path.$random_file_name)){
                            $random_file_name = Str::random(4).'_'.$file_name;
                        }
                        $file->name = $random_file_name;
                        $file->path = $this->path.$random_file_name;
                        move_uploaded_file($myFile["tmp_name"][$i], storage_path().$this->path.$random_file_name);
                        $file->save();
                    }
                    $html = $this->htmlViewPartialModuleTrainingProgramInformationsFiles( $request->input('id_program') );
                    LogsController::write("AIFileLibraries", "Thêm file", "Chương trình đào tạo file: ".$file->library->name."; Tên file: ".$random_file_name); 
                    return response()->json(['error'=>false, 'message'=>'Thêm file thành công!', 'html'=>$html]);
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Thêm không thành công!']);
                }
            }
            if( $action_type == 'edit' ){
                try{
                    $input = $request->all();
                    $input['status'] = ($request->input('status') == 1 ? 1 : 0);
                    $file = PartialModuleTrainingProgramInformationsFiles::find( $request->input('id') );
                    rename( storage_path().$file->path , storage_path().$this->path.$input['name'] );
                    $input['path'] = $this->path.$input['name'];
                    $file->update($input);

                    $html = $this->htmlViewPartialModuleTrainingProgramInformationsFiles( $file->id_program );  
                    return response()->json(['error'=>false, 'message'=>'Chỉnh sửa file thành công!', 'html'=>$html]);
                    LogsController::write("AIFileLibraries", "Sửa file", "Chương trình đào tạo file: ".$file->library->name."; Tên file: ".$input['name']); 
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Chỉnh sửa không thành công!']);
                }
            } 
            else if ( $action_type == 'delete' ) {
                try{
                    $file = PartialModuleTrainingProgramInformationsFiles::find( $request->input('id') );
                    File::delete( storage_path().$file->path );
                    $file->delete();

                    $html = $this->htmlViewPartialModuleTrainingProgramInformationsFiles( $file->id_program );
                    LogsController::write("AIFileLibraries", "Xoá file", "Chương trình đào tạo file: ".$file->library->name."; Tên file: ".$file->name); 
                    return response()->json(['error'=>false, 'message'=>'Xóa file thành công!', 'html'=>$html]);
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Xóa không thành công!']);
                }
            }
        } else {
            return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
        }

    }
    public function htmlViewPartialModuleTrainingProgramInformationsFiles($id_program){
        $html='';
        $files = PartialModuleTrainingProgramInformationsFiles::where('id_program',$id_program)->get();
        foreach($files as $key=>$file){
            $array_file = explode('.', $file->name);
            if( end($array_file) == 'pdf' ) $extension = 'pdf';
            elseif( end($array_file) == 'png' || end($array_file) == 'jpg' || end($array_file) == 'jpeg' ) $extension ='image';
            elseif( end($array_file) == 'doc' ) $extension ='doc';
            elseif( end($array_file) == 'docx' ) $extension ='docx';
            else $extension ='file';


            $html.='<div class="item-file">';
            $html.='    <img id="file_'.$key.'" src="/assets/administration/mainstructure/img/'.$extension.'.png" class="file-in-view-form">';
            $html.='    <div><a href="/protect-file/'.$file->name.'" target="_blank">'.$file->name.'</a></div>';
            
            $html.='<span class="delete-file" onclick="func_deleteFile('.$key.')">&times;</span>';
            $html.='</div>'; 
        }
        return $html;
    }
}
