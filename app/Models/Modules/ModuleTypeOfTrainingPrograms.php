<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTypeOfTrainingPrograms extends Model{
	protected $fillable = [
		'name', 
		'id_site',
		'is_deleted'
	];
}