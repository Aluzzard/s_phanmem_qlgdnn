<?php
	//Dashboard
    Route::get('dashboard', 'MainStructure\Users\DashboardController@dashboard')->name('user.get.dashboard');
    //Manager function permission according to user
    Route::get('function-permission', 'MainStructure\Users\FunctionPermissionsAccordingToUser@index')
            ->name('user.get.function.permission');
    Route::post('function-permission', 'MainStructure\Users\FunctionPermissionsAccordingToUser@ajax')
            ->name('user.action.function.permission');
    //Manager list users
    Route::get('users', 'MainStructure\Users\UsersController@index')->name('user.get.index');
    Route::post('users', 'MainStructure\Users\UsersController@ajax')->name('user.post.ajax');
    //Manager module permission
    Route::get('module-permission', 'MainStructure\Users\ModulePermissionsAccordingToUser@index')->name('user.get.module.permission');
    Route::post('module-permission', 'MainStructure\Users\ModulePermissionsAccordingToUser@ajax')->name('user.action.module.permission');

    Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
         \UniSharp\LaravelFilemanager\Lfm::routes();
    });
?>