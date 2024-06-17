<?php
namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Pagination\Paginator;
//Model

use App\Models\MainStructure\SysSites;
use App\Models\MainStructure\SysFunctionPermissionsAccordingToUser;
use App\Models\MainStructure\SysWebsiteInformation;
use App\Models\Modules\ModuleArticlesCategories;
use App\Models\Modules\ModuleVisitor;
use App\Models\Modules\ModuleBannerFooter;

use App\Http\Controllers\Modules\UICounterVisitors\UICounterVisitorsController;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot() {
        Paginator::useBootstrap();
        
        if(env('APP_ENV') !== 'local' && request()->getHttpHost() === env('APP_URL')) {
            URL::forceScheme('https');
        }
        //Get function permission data for following page below
        view()->composer(['mainstructure.pages.users.*', 'modules.*', 'auth.*'], function($view) {
            $id_current_user = Auth::guard('user')->id();
            $function_permissions_according_to_user = SysFunctionPermissionsAccordingToUser::whereUserId($id_current_user)->first();
            if($function_permissions_according_to_user){
                $data['function_permissions_according_to_user'] = explode(",", $function_permissions_according_to_user->function_permissions );
            } else {
                $data['function_permissions_according_to_user'] = "";
            }
            
            $view
                    ->with($data);
        });
        //Get function permission data for following page below
        view()->composer('*', function($view) {
            $data['information_website'] = SysWebsiteInformation::find(1);
            $view
                    ->with($data);
        });
        view()->composer(['guests.*'], function($view) {
            $data['site_information'] = \App\Models\MainStructure\SysSites::where('domain_1', request()->root() )
                                ->orWhere('domain_2', request()->root())
                                ->firstOrFail();
            $data['menus'] = ModuleArticlesCategories::whereIdLanguage( Session::get('website_language_id') )
                                                        ->where('status',1)
                                                        ->where('show_h_menu',1)
                                                        ->where('id_parent',0)
                                                        ->orderBy('display_h_order')
                                                        ->get();
            $view->with($data);            
        });
    }




}
