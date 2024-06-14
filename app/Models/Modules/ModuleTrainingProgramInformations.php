<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTrainingProgramInformations extends Model{
	protected $fillable = [
		'id_site',
		'id_training_specialty',
		'year',
		'name'
	];
	public function training_specialty() {
        return $this->belongsTo('App\Models\Modules\ModuleTrainingSpecialties','id_training_specialty','id');
    }
}