<?php
	Route::get('dashboard', 'MainStructure\Admins\DashboardController@dashboard')->name('admin.get.dashboard');

    //Logs
    Route::get('logs', 'MainStructure\Admins\LogsController@index')->name('admin.get.logs.index');
    //Language
    Route::get('language', 'MainStructure\Admins\LanguageController@index')->name('admin.get.language');
    Route::post('language', 'MainStructure\Admins\LanguageController@ajax')->name('admin.action.language');
    Route::group(['prefix' => 'system'], function(){
        Route::get('site', 'MainStructure\Admins\SiteController@index')->name('admin.get.site');
        Route::post('site', 'MainStructure\Admins\SiteController@ajax')->name('admin.ajax.site');

        //Manager list module
        Route::get('module', 'MainStructure\Admins\ModuleController@list_module')->name('admin.get.module');
        Route::post('action-module', 'MainStructure\Admins\ModuleController@action_module')->name('admin.action.module');
        Route::post('action-function', 'MainStructure\Admins\ModuleController@action_function')->name('admin.action.function');
        Route::post('action-groups-module', 'MainStructure\Admins\ModuleController@action_groups_modules')
                ->name('admin.action.group.modules');
    });
    
?>
