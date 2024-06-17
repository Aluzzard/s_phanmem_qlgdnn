<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysListModules extends Model{

	public function by_group() {
    	return $this->belongsTo(SysGroupsModules::class,'id_group');
    }
}