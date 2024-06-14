<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleOfficerProfessionalTrainingProcess extends Model{
	protected $fillable = [
		'id_officer',
		'school_name', 
		'specialized', 
		'from_the_time',
		'till_the_time',
		'id_training_form',
		'id_certificate'
	];
	public function training_form() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfTrainingForms','id_training_form','id');
    }
    public function certificate() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfCertificates','id_certificate','id');
    }
}