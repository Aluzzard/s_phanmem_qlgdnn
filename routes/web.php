<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('auth.get.login');
    Route::post('/import', 'ImportController@import');

});

Route::group(['prefix' => 'auth'], function(){
    Route::get('login', 'Auth\LoginController@login_get')->name('auth.get.login');
    Route::post('login', 'Auth\LoginController@login_post')->name('auth.post.login');
    Route::get('logout', 'Auth\LoginController@logout')->name('auth.get.logout');
});

Route::group(['middleware'=>['auth:admin,user']], function(){
    //Change password
    Route::get('change-password', 'Auth\ChangePasswordController@index')->name('user.get.changepassword');
    Route::post('change-password', 'Auth\ChangePasswordController@ajax')->name('user.post.changepassword');
    //Detail Account
    Route::get('account', 'Auth\DetailAccountController@index')->name('account.get.index');
    Route::post('account', 'Auth\DetailAccountController@ajax')->name('account.post.ajax');
    //Information website
    Route::get('website-information', 'MainStructure\Admins\WebsiteInformationController@index')
            ->name('admin.website.information.index');
    Route::post('website-information', 'MainStructure\Admins\WebsiteInformationController@ajax')
            ->name('admin.website.information.ajax');
    //Custom interface
        //Theme
        Route::get('theme', 'MainStructure\Admins\ThemeController@index')->name('user.custominterface.get.theme');
        Route::post('theme', 'MainStructure\Admins\ThemeController@ajax')->name('user.custominterface.post.theme');
        //Layout
        Route::get('layout', 'MainStructure\Admins\LayoutController@index')->name('user.custominterface.get.layout');
        Route::post('layout', 'MainStructure\Admins\LayoutController@ajax')->name('user.custominterface.post.layout');

    Route::get('protect-file/{folder}/{path}', 'MainStructure\Users\AuthFilesController@view');

});
Route::group(['prefix' => 'root','middleware'=>'auth:admin'], function(){
    require base_path('routes/partials/admin.php');
});
// end Admin

// User
Route::group(['prefix' => 'admin', 'middleware'=>'auth:user'], function(){
    require base_path('routes/partials/user.php');
    //Module
    require base_path('routes/partials/user_modules.php');
});
// end User
?>