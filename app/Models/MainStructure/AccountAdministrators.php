<?php

namespace App\Models\MainStructure;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticate;

class AccountAdministrators extends Authenticate{
    use Notifiable;
 
    protected $guard = 'admin';
 
    protected $fillable = [
        'name', 'account', 'password',
    ];
 
    protected $hidden = [
        'password', 'remember_token',
    ];
}
