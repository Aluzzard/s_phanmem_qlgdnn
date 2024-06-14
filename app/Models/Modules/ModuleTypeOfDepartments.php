<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTypeOfDepartments extends Model{
	protected $fillable = [
		'name', 
		'id_site',
		'code',
		'short_name',
		'address',
		'founding_date',
		'numberphone',
		'email',
		'note'
	];
}