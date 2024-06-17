<?php

namespace App\Http\Controllers\Modules\AIIntegratedStatistics;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
//Models
use App\Models\Modules\ModuleIntegratedStatistics;
use App\Models\Modules\ModuleTrainingSpecialties;
use App\Models\Modules\ModuleTypeOfCourses;
//Requests
use App\Http\Requests\Module\ModuleIntegratedStatisticsRequest;
//Controllers
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Http\Controllers\MainStructure\Users\GlobalFunction;
//Export
use App\Exports\Form1Export;
use Maatwebsite\Excel\Facades\Excel;

class AIIntegratedStatisticsController extends Controller {

    public function index(Request $request) {
        if(GlobalFunction::checkRoleModuleByUser('view') == false || GlobalFunction::checkRoleFunctionByUser('view',200) == false){
             abort('404');
        } else {
            if(!$request->input('form') || $request->input('form') == 1){
                $data['data'] = Form1Controller::form($request);
                if( $request->input('export') == 'true' ) {
                    $export = new Form1Export([
                        $data['data']
                    ]);
                    return Excel::download($export, 'invoices.xlsx');
                }
                $data['list_courses'] = ModuleTypeOfCourses::whereIdSite( Auth::guard('user')->user()->id_site )
                                                ->orderBy('year')
                                                ->orderBy('id_training_specialty')
                                                ->get();
                return view('modules.AIIntegratedStatistics.form_1.index', $data);
            }
            else if($request->input('form') == 2){
                if( $request->input('year') && $request->input('month')) {
                    $data['data'] = Form2Controller::form($request);
                }
                $data['years'] = ModuleTypeOfCourses::select('year')->orderBy('year', 'desc')->get()->unique('year');
                return view('modules.AIIntegratedStatistics.form_2.index', $data);

            }

        }
    }

    
    public function form_2(){
        
    }

}
