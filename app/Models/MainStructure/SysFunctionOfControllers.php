<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysFunctionOfControllers extends Model{
	protected $fillable = ['function', 'id_module', 'method'];
    
}