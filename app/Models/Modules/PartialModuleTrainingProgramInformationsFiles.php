<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class PartialModuleTrainingProgramInformationsFiles extends Model{
	protected $fillable = [
		'name', 
		'description', 
		'path', 
		'id_program',
	];
	public function library() {
        return $this->belongsTo('App\Models\Modules\ModuleTrainingProgramInformations','id_program');
    }
}