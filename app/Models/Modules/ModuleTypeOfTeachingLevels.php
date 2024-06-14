<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTypeOfTeachingLevels extends Model{
	protected $fillable = [
		'name', 
		'id_site'
	];
}