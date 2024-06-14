<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTeachingAssignment extends Model{
	protected $fillable = [
		'name',
		'id_site',
		'id_officer',
		'id_training_specialty',
		'id_course',
		'start_time',
		'end_time'
	];
}