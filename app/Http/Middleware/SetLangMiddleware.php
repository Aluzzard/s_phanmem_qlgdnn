<?php

namespace App\Http\Middleware;

use Closure;

class SetLangMiddleware
{
    public function handle($request, Closure $next)
	{
	    $language = \Session::get('website_language', config('app.locale'));
	    // Lấy dữ liệu lưu trong Session, không có thì trả về default lấy trong config

	    config(['app.locale' => $language]);
	    // Chuyển ứng dụng sang ngôn ngữ được chọn

	    return $next($request);
	}
}
