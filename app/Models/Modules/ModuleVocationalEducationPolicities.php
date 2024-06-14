<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleVocationalEducationPolicities extends Model{
	protected $fillable = [
		'name', 
		'id_site',
		'type'
	];
}