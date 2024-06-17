<?php
use App\Models\MainStructure\SysListModules;
use App\Models\MainStructure\SysFunctionOfControllers;

// Module
Route::group(['prefix' => 'module'], function() {
    Route::get('', 'MainStructure\Users\UsersModuleController@listModule')->name('user.get.list.module');

    try {
        $pages = SysListModules::whereActive(1)->get();
        foreach ($pages as $page) {
            if (!empty($page->path_controller)) {
                $functions = SysFunctionOfControllers::where('id_module', $page->id)->get();

                foreach ($functions as $key => $function) {
                    $routeMethod = $function->method == 1 ? 'get' : 'post';
                    $routeName = $function->method == 1 ? 'get' : 'post';

                    if ($function->method == 1) { // Nếu là phương thức GET
                        if ($function->function === 'index') {
                            $routePath = $page->slug;
                        } else {
                            $routePath = 'get-' . $page->slug . '-' . $key;
                        }
                    } else {
                        $routePath = $page->slug . $key; // Giữ nguyên cho POST
                    }

                    Route::$routeMethod('/' . $routePath, $page->path_controller . '@' . $function->function)
                        ->name($page->controller . '.' . $routeName . '.' . $function->function);
                }
            }
        }
    } catch (\Exception $e) {
        Log::error('Error fetching database pages: ' . $e->getMessage());
    }

    Route::post('ajax', 'MainStructure\Users\UsersModuleController@ajaxSearchModule')->name('user.ajax.list.module');
});

?>