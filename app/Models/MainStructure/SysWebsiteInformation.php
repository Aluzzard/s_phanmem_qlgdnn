<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysWebsiteInformation extends Model{

    public $timestamps = false;
	protected $fillable = [
        'name', 
        'address', 
        'logo',
        'numberphone',
        'fax',
        'email',
        'hotline',
        'bussiness_code',
        'theme',

        'color_gradient',
        'color_background',
        'color_font',
        'color_font_hover',
        'color_font_focus',     

        'meta_title',
        'meta_description',
        'keywords',
        'author',
        'country',
        'meta_dc_title',
        'meta_geo_region',
        'meta_geo_placename',
        'meta_geo_position',
        'meta_icbm'
    ];
}