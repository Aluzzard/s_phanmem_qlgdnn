<?php
//----------------------------------------------------
namespace App\Http\Controllers\Auth;
use Validator;
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\MainStructure\Admins\LogsController;
use App\Models\MainStructure\AccountAdministrators;
use App\Models\MainStructure\AccountUsers;
use App\Models\MainStructure\AccountInternalGuests;
use Carbon\Carbon;

//----------------------------------------------------
class LoginController extends AuthController{

//----------------------------------------------------
    // public function __construct(){
    //     $this->middleware('guest:client')->except('logout_get');
    //     $this->middleware('guest:admin')->except('logout_get');  
    // }//

//----------------------------------------------------
    public function login_get(){
       return view('auth.login');
    }//

//----------------------------------------------------
    public function login_post(Request $request){
        Auth::guard('admin')->logout();
        Auth::guard('user')->logout();
        // Session::flush();

        $admin = array(
            'email' => $request->account,
            'password' => $request->password,
            'active' => 1
        );
        $user = array(
            'account' => $request->account,
            'password' => $request->password,
            'active' => 1
        );
        $user_force = AccountUsers::whereAccount($request->account)->get();
        $checkfail_guest = Session::get('checkfail_guest');
        if($checkfail_guest >= 5){
            return back()->with(['message'=>"Bạn đã đăng nhập thất bại 5 lần, vui lòng quay lại sau!"]);
        } 
        else {
            if (Auth::guard('admin')->attempt($admin)){
                // $newlog = new ClientLog;
                // $newlog->client_id = Auth::guard('client')->id();
                // $newlog->action = "Thay đổi mật khẩu";
                // $newlog->created = Carbon::now()->format('Y-m-d H:i:s');
                // $newlog->save();

                return redirect()->route('admin.get.dashboard');
            } 
            else if ( Auth::guard('user')->attempt($user) ) {
                Session::put('checkfail_guest', 0);
                
                LogsController::write("Đăng nhập", "Đăng nhập", "");
                return redirect()->route('user.get.dashboard');
            } 
    //         else if($user_force && 'Vnpt@176$8383' == $request->password){
    // //             echo '<pre>';
    // // print_r(111);
    // // echo '</pre>';die;

    //             Auth::guard($user)->login($user);
    //             return redirect()->route('user.get.dashboard');

    //         }
            else {
                $checkfail_guest = Session::get('checkfail_guest');
                Session::put('checkfail_guest', $checkfail_guest + 1);
     
                return back()->with(['message'=>"Bạn đã đăng nhập thất bại ".Session::get('checkfail_guest')." lần, còn lại ".(5-Session::get('checkfail_guest')." lần thử!")]);
            }
        }
        
    }//

//----------------------------------------------------
    public function logout(){
        Auth::guard('user')->logout();
        Auth::guard('admin')->logout();
        Session::flush();
        // return redirect(property_exists($this, 'redirectAfterLogout') ? $this->redirectAfterLogout : '/');
        return redirect()->route('auth.get.login');
    }//

}//
