<?php

namespace App\Http\Controllers\Modules\AIPrintDocuments;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModulePrintDocuments;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
use App\Models\Modules\ModuleConfigPrintDocuments;

//Requests
use App\Http\Requests\Module\ModulePrintDocumentsRequest;
//Controllers
use App\Http\Controllers\Modules\AIPrintDocuments\Type1Controller;

use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;

class AIPrintDocumentsController extends Controller {

    public function index(Request $request) {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {            
            $data['config_history'] = json_decode(ModuleConfigPrintDocuments::whereIdUser( Auth::guard('user')->id() )->first()->config);
            $data['courses'] = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )->get();
            return view('modules.AIPrintDocuments.global.index', $data);
        }
    }



    
    public function ajax(Request $request){
        if( $request->input('type') == 1 ) {
            if( $request->input('id_course') ) {
                $html = Type1Controller::callback($request);
                return response()->json(['error'=>false, 'html'=>$html]);
            } else {
                return response()->json(['warning'=>true, 'message'=>'Vui lòng chọn khóa học!']);
            }
        } elseif( $request->input('type') == 2 ) {

        }
    }

}
