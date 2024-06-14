<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTrainingSpecialties extends Model {
    protected $fillable = [
        'name', 
        'id_site',
        'type_1',
        'type_2',
        'duration_by_month',
        'duration_by_day'
    ];

    public function courses() {
        return $this->hasMany('App\Models\Modules\ModuleTypeOfCourses', 'id_training_specialty', 'id');
    }
}