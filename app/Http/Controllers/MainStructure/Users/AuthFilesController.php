<?php

namespace App\Http\Controllers\MainStructure\Users;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\SysModulePermissionsAccordingToUser;
use App\Models\MainStructure\SysFunctionPermissionsAccordingToUser;
use Illuminate\Support\Facades\Auth;

class AuthFilesController extends Controller {
    public function __construct() {
        $this->middleware('auth');
    }

    public function view($folder, $path) {
        $file = storage_path('/app/public/cth/'.$folder.'/files/'.$path);

        if (file_exists($file)) {
            $array_file = explode('.', $file);
            if(end($array_file) == 'pdf') {
                $headers = [
                    'Content-Type' => 'application/pdf'
                ];
                return response()->download($file, 'Test File', $headers, 'inline');
            } else {
                return response()->download($file);

            }
            
        } else {
            abort(404, 'File not found!');
        }
    }
}
