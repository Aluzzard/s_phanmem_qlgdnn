<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleOfficerWorkProcess extends Model{
	protected $fillable = [
		'information', 
		'from_the_time',
		'till_the_time',
		'id_officer'
	];
}