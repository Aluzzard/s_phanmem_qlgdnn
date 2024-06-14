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
            $type = $request->input('type', 1);
            
            if($request->input('type') == 2){
                if( $request->input('year') && $request->input('month')) {
                    $data['data'] = Form2Controller::type($request);
                }
                $data['years'] = ModuleTypeOfCourses::select('year')->orderBy('year', 'desc')->get()->unique('year');
                return view('modules.AIPrintDocuments.type_2.index', $data);
            }
            else{
                $data['courses'] = ModuleTypeOfCourses::whereIdSite(Auth::guard('user')->user()->id_site)->get();
                if( $request->input('edit') == true && $request->input('id_course')) {
                    $data['data'] = Type1Controller::callback($request);
                }
                return view('modules.AIPrintDocuments.type_1.index', $data);
            }

        }
    }

    
    public function type_2(){
        
    }

}
