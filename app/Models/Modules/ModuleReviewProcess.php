<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleReviewProcess extends Model{
	protected $fillable = [
		'name',
		'id_site',
		'id_item',
		'id_training_specialty',
		'id_course',
		'start_time',
		'end_time'
	];
	
}