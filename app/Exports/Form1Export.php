<?php

namespace App\Exports;

use App\Models\Modules\ModuleTypeOfCourses;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
//Styles
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Style;
use PhpOffice\PhpSpreadsheet\Style\Color;
use Maatwebsite\Excel\Concerns\WithDefaultStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class Form1Export implements FromView,WithDefaultStyles {

    //Kết quả thực hiện hỗ trợ đào tạo nghề cho lao động nông thôn
    protected $courses;

    public function __construct(array $data) {
        $this->data = $data[0];
    }
    public function defaultStyles(Style $defaultStyle) {
        return [
            'font' => [
                'size' => 10,
                'name' => 'Times New Roman',
            ],
            'borders' => [
                'outline' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                    'color' => ['argb' => 'FFFF0000'],
                ],
            ]
        ];
    }

    public function view(): View {
        $data['data'] = $this->data;

        return view('modules.AIIntegratedStatistics.form_1.table', $data);
    }
}
