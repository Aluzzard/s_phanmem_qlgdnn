<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTypeOfOfficerTitles extends Model{
	protected $fillable = [
		'name', 
		'id_site'
	];
}