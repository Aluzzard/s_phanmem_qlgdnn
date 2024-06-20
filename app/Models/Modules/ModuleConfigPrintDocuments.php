<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleConfigPrintDocuments extends Model{
	protected $fillable = [
		'id_user',
		'type',
		'config'
	];
	
}