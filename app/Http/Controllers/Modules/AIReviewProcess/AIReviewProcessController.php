<?php

namespace App\Http\Controllers\Modules\AIReviewProcess;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use DateTime;
//Models
use App\Models\Modules\ModuleReviewProcess;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\PartialModuleReviewProcessesCategories;

//Requests
use App\Http\Requests\Module\ModuleReviewProcessRequest;
use App\Http\Requests\Module\PartialModuleReviewProcessesCategoriesRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIReviewProcessController extends Controller {

    public function index() {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            $this->id_site = Auth::guard('user')->user()->id_site;
            $data['check_add'] = GlobalFunction::checkRoleModuleByUser('add');
            $data['training_specialties'] = ModuleTrainingSpecialties::whereIdSite($this->id_site)->get();
            $data['courses'] = ModuleTypeOfCourses::whereIdSite($this->id_site)
                                                    ->whereIdTrainingSpecialty($data['training_specialties']->first()->id)
                                                    ->get();
                                                    


            $data['review_process_categories'] = PartialModuleReviewProcessesCategories::whereIdSite($this->id_site)
                                                                                        ->whereIdTrainingSpecialty( 28 )
                                                                                        ->get();

            return view('modules.AIReviewProcess.index', $data);
        }
    }

    public function ajaxEvent(Request $request){
        if(GlobalFunction::checkRoleModuleByUser('view') == true || GlobalFunction::checkRoleFunctionByUser('view',200) == true){
            $action_type = $request->input('action_type');
            if ($action_type == 'view' ) {
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
        $documents = ModuleSteeringDocument::whereIdSite( Auth::guard('user')->user()->id_site )
                                            ->orderBy('date_issue','desc')
                                            ->get();
        $html = '';
        if($documents){
            foreach ($documents as $key=>$document){
                $html .= '<tr>';
                $html .= '  <td>'.($key+1).'</td>';
                $html .= '  <td>'.$document->number.'</td>';
                $html .= '  <td>'.$document->content.'</td>';
                $html .= '  <td>'.$document->date_issue.'</td>';
                $html .= '  <td>'.$document->date_effect.'</td>';
                $html .= '  <td>'.$document->type->name.'</td>';
                $html .= '  <td>'.$document->organization->name.'</td>';
                $html .= '  <td>';
                if( GlobalFunction::checkRoleModuleByUser('edit') == true ){
                $html .= '      <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick(`edit`,'.$document->id.')">
                                    <i class="fa fa-pencil"></i><span class="ml-2">Sửa</span>
                                </button>';
                }
                if( GlobalFunction::checkRoleModuleByUser('delete') == true ){
                $html .= '      <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonClick(`delete`,'.$document->id.')">
                                    <i class="fa fa-times"></i><span class="ml-2">Xóa</span>
                                </button>';
                }
                $html .= '  </td>';                     
                $html .= '</tr>';
            }
        }
        return $html;
    }

    public function view($request){
        try {
            $document = ModuleSteeringDocument::find( $request->input('id') );
            return response()->json(['error'=> false, 'document'=>$document]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Lấy dữ liệu thất bại']);
        }
    }
    public function add($request){
        try {
            $validator = Validator::make($request->all(), ModuleSteeringDocumentRequest::rules($request->input('id')), ModuleSteeringDocumentRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $input['id_site'] = Auth::guard('user')->user()->id_site;
                ModuleSteeringDocument::create($input);
                $html = $this->dataTable();
                LogsController::write("AIReviewProcess", "Thêm", "Văn bản: ".$input["number"]);
                return response()->json(['error'=> false, 'message' => 'Thêm văn bản thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=> true, 'message' => 'Thêm văn bản thất bại']);
        }
    }
    public function edit($request){
        try {
            $validator = Validator::make($request->all(), ModuleSteeringDocumentRequest::rules($request->input('id')), ModuleSteeringDocumentRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->all();
                $document = ModuleSteeringDocument::find( $request->input('id') );
                $document->update($input);
                $html = $this->dataTable();
                LogsController::write("AIReviewProcess", "Sửa", "Văn bản: ".$input["number"]);
                return response()->json(['error'=> false, 'message' => 'Sửa văn bản thành công', 'table_html' => $html]);
            }
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Sửa văn bản thất bại']);
        }
    }
    public function delete($request){
        try {
            $document = ModuleSteeringDocument::find( $request->input('id') );
            unlink(public_path().$document->file_path);
            $document->delete();
            $html = $this->dataTable();
            LogsController::write("AIReviewProcess", "Xoá", "Văn bản: ".$document->number);
            return response()->json(['error'=> false, 'message' => 'Xóa văn bản thành công', 'table_html' => $html]);
        } catch (Exception $e) {
             return response()->json(['error'=> true, 'message' => 'Xóa văn bản thất bại']);
        }
    }


//-------------------------------------------------------------------------------------------
// Partial ---------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------

    public function ajaxPartial(Request $request){
        $action_type = $request->input('action_type');
        if ($action_type == 'listPartial' ) {
            return $this->listPartial($request);
        }
        else if( $action_type == 'viewPartial' ) {
            return $this->viewPartial($request);
        }
        else if($action_type == 'addPartial' ) {
            return $this->addPartial($request);
        }
        else if( $action_type == 'editPartial' ) {
            return $this->editPartial($request);
        }
        else if($action_type == 'deletePartial' ) {
            return $this->deletePartial($request);
        }
    }
    public function dataTablePartial($datas){
        $html = '';
        if($datas){
            foreach ($datas as $data){
                $html .= '<tr onclick="func_buttonModalPartialClick(`editPartial`,'.$data->id.')">';
                $html .= '  <td>'.$data->name.'</td>';
                $html .= '  <td>';
                $html .= '          <button type="button" class="btn btn-custon-four btn-danger" data-toggle="modal" data-target="#deleteModal" onclick="func_buttonModalPartialClick(`deletePartial`,'.$data->id.')">
                                        <i class="fa big-icon fa-times"></i><span class="ml-2">Xóa</span>
                                    </button>';
                $html .= '  </td>';
                $html .= '</tr>';
            }
        }
        return $html;
    }
    public function listPartial($request){
        try {
            $data = PartialModuleReviewProcessesCategories::whereIdSite( Auth::guard('user')->user()->id_site )
                                                            ->whereIdTrainingSpecialty( $request->input('id_training_specialty') )
                                                            ->whereType( $request->input('type') )
                                                            ->get();
            $html_table = $this->dataTablePartial($data);
            return response()->json(['error'=>false, 'message'=>'Lấy dữ liệu thành công!', 'html_table' => $html_table]);
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']); 
        }
    }
    public function viewPartial($request){
        try {
            $data = PartialModuleReviewProcessesCategories::find( $request->input('id') );
            return response()->json(['error'=>false, 'message'=>'Lấy dữ liệu thành công!', 'data' => $data]); 
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Lấy dữ liệu thất bại!']); 
        }
    }
    public function addPartial($request){
        try {
            $validator = Validator::make($request->all(), PartialModuleReviewProcessesCategoriesRequest::rules($request), PartialModuleReviewProcessesCategoriesRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->input();
                $input['id_site'] = Auth::guard('user')->user()->id_site;

                PartialModuleReviewProcessesCategories::create($input);
                LogsController::write("AIReviewProcess", "Thêm", "Danh mục: ".$request->input('name'));
                $data1 = PartialModuleReviewProcessesCategories::whereIdSite( Auth::guard('user')->user()->id_site )
                                                            ->whereIdTrainingSpecialty( $request->input('id_training_specialty') )
                                                            ->whereType( $request->input('type') )
                                                            ->get();
                $html_table = $this->dataTablePartial($data1);
                return response()->json(['error'=>false, 'message'=>'Thêm mới thành công!', 'html_table' => $html_table]); 
            }
            
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Thêm mới thất bại!']); 
        }
    }
    public function editPartial($request){
        try {
            $validator = Validator::make($request->all(), PartialModuleReviewProcessesCategoriesRequest::rules($request), PartialModuleReviewProcessesCategoriesRequest::messages());
            if($validator->fails()){
                return response()->json(['error' => true, 'validate' => false, 'message' => $validator->messages()->all()]);
            } else {
                $input = $request->input();
                $data = PartialModuleReviewProcessesCategories::find( $request->input('id') );
                $data->update($input);
                LogsController::write("AIReviewProcess", "Sửa", "Danh mục: ".$request->input('name'));
                $data1 = PartialModuleReviewProcessesCategories::whereIdSite( Auth::guard('user')->user()->id_site )
                                                            ->whereIdTrainingSpecialty( $request->input('id_training_specialty') )
                                                            ->whereType( $request->input('type') )
                                                            ->get();
                $html_table = $this->dataTablePartial($data1);
                return response()->json(['error'=>false, 'message'=>'Sửa đổi thành công!', 'html_table' => $html_table]);
            }
            
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Cập nhật thất bại!']); 
        }
    }
    public function deletePartial($request){
        try {
            $data = ModuleReviewProcess::whereIdActivity( $request->input('id') )
                                            ->orWhere('id_type', $request->input('id') )
                                            ->get();
            if(count($data)>0){
                return response()->json(['error'=>true, 'message'=>'Xoá thất bại! Danh mục đang sử dụng!']); 
            } else {
                $data = PartialModuleReviewProcessesCategories::find( $request->input('id') );
                $data->delete();
                LogsController::write("AIReviewProcess", "Xoá", "Danh mục: ".$data->name);
            
                $data1 = PartialModuleReviewProcessesCategories::whereIdSite( $data->id_site )
                                                            ->whereIdTrainingSpecialty( $data->id_training_specialty )
                                                            ->whereType( $data->type )
                                                            ->get();
                
                $html_table = $this->dataTablePartial($data1);
                return response()->json(['error'=>false, 'message'=>'Xoá thành công!', 'html_table' => $html_table]);
            }
        } catch (Exception $e) {
            return response()->json(['error'=>true, 'message'=>'Xoá thất bại!']); 
        }
    }
}
