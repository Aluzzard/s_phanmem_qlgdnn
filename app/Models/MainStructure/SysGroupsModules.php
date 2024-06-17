<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysGroupsModules extends Model{
    public $timestamps = false;
    public function modules()
    {
        return $this->hasMany('App\Models\SysListModules','id_group');
    }
}