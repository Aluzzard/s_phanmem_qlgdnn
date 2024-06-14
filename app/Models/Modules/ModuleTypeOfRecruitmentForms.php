<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTypeOfRecruitmentForms extends Model{
	protected $fillable = [
		'name', 
		'id_site'
	];
}