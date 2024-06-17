<?php

namespace App\Http\Controllers\Modules\AICertificationList;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
//Models
use App\Models\Modules\ModuleCertificationList;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
//Requests
use App\Http\Requests\Module\ModuleCertificationListRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AICertificationListController extends Controller {
    public function __construct() {
        $this->path = '/app/public/cth/certification/files/';
        if (!\File::exists(storage_path().$this->path)) {
            \File::makeDirectory(storage_path().$this->path, 0755, true);
        }
    }

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $current_id_site = Auth::guard('user')->user()->id_site;
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($current_id_site)->get();
            $data['courses'] = ModuleTypeOfCourses::whereIdSite($current_id_site)
                                                    ->whereIdTrainingSpecialty($data['training_specialties']->first()->id)
                                                    ->get();
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            return view('modules.AICertificationList.index', $data);
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
        } else {
            abort('404');
        }
    }
    
    public function dataTable(){
        $current_id_site = Auth::guard('user')->user()->id_site;
        $items = ModuleTypeOfCourses::whereIdSite($current_id_site)->orderBy('till_the_time', 'desc')->get();
        $html = '';
        if($items){
            foreach ($items as $item){
                $html .= '<tr>';
                $html .= '  <td>'.$item->year.'</td>';
                $html .= '  <td>'.$item->training_specialty->name.'</td>';
                $html .= '  <td>Khóa '.$item->name.'/'.$item->year.'</td>';

                $html .= '  <td>'.$item->from_the_time.'</td>';

                $html .= '  <td>'.$item->till_the_time.'</td>';
                if( $item->till_the_time > date('Y-m-d'))
                    $html .= '  <td><strong class="text-success">Đang học</strong></td>';
                else
                    $html .= '  <td><strong class="text-danger">Đã kết thúc khóa học</strong></td>';

                
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
// Function File
    public function ajaxFile(Request $request){
        if( GlobalFunction::checkRoleModuleByUser('edit') == true ){
            $action_type = $request->input('action_type');
            if( $action_type == 'list' ) {
                try {
                    $id_course = $request->input('id');
                    $fileslibrary = ModuleCertificationList::where('id_course',$id_course)->get();

                    if(count($fileslibrary)>0){
                        $html=$this->htmlViewModuleCertificationList($id_course);
                        return response()->json(['error'=>false, 'html'=>$html]);
                    } else {
                        return response()->json(['error'=>false, 'html'=>'<div class="px-3">Không có file trong khóa</div>']);
                    }
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu không thành công!']);
                }
            }
            if( $action_type == 'file' ){
                try {
                    $file = ModuleCertificationList::find( $request->input('id') );
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
                        $file = new ModuleCertificationList;
                        $file->id_course=$request->input('id_course');
                        $random_file_name = Str::random(4).'_'.$myFile["name"][$i];
                        while(file_exists(storage_path().$this->path.$random_file_name)){
                            $random_file_name = Str::random(4).'_'.$file_name;
                        }
                        $file->name = $random_file_name;
                        $file->path = $this->path.$random_file_name;
                        move_uploaded_file($myFile["tmp_name"][$i], storage_path().$this->path.$random_file_name);
                        $file->save();
                    }
                    $html = $this->htmlViewModuleCertificationList( $request->input('id_course') );
                    LogsController::write("AICertificationList", "Thêm file", "Chứng nhận file: ".$file->library->name."; Tên file: ".$random_file_name); 
                    return response()->json(['error'=>false, 'message'=>'Thêm file thành công!', 'html'=>$html]);
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Thêm không thành công!']);
                }
            }
            if( $action_type == 'edit' ){
                try{
                    $input = $request->all();
                    $input['status'] = ($request->input('status') == 1 ? 1 : 0);
                    $file = ModuleCertificationList::find( $request->input('id') );
                    rename( storage_path().$file->path , storage_path().$this->path.$input['name'] );
                    $input['path'] = $this->path.$input['name'];
                    $file->update($input);

                    $html = $this->htmlViewModuleCertificationList( $file->id_course );  
                    return response()->json(['error'=>false, 'message'=>'Chỉnh sửa file thành công!', 'html'=>$html]);
                    LogsController::write("AICertificationList", "Sửa file", "Chứng nhận file: ".$file->library->name."; Tên file: ".$input['name']); 
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Chỉnh sửa không thành công!']);
                }
            } 
            else if ( $action_type == 'delete' ) {
                try{
                    $file = ModuleCertificationList::find( $request->input('id') );
                    File::delete( storage_path().$file->path );
                    $file->delete();

                    $html = $this->htmlViewModuleCertificationList( $file->id_course );
                    LogsController::write("AICertificationList", "Xoá file", "Chứng nhận file: ".$file->library->name."; Tên file: ".$file->name); 
                    return response()->json(['error'=>false, 'message'=>'Xóa file thành công!', 'html'=>$html]);
                } catch (Exception $e) {
                    return response()->json(['error'=>true, 'message'=>'Xóa không thành công!']);
                }
            }
        } else {
            return response()->json(['error'=>true, 'message'=>'Không được phân quyền!']);
        }

    }
    public function htmlViewModuleCertificationList($id_course){
        $html='';
        $files = ModuleCertificationList::where('id_course',$id_course)->get();
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
