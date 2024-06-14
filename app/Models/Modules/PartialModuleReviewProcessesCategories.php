<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class PartialModuleReviewProcessesCategories extends Model{
	protected $fillable = [
		'name', 
		'id_site',
		'type',
		'order',
		'id_training_specialty'
	];
}