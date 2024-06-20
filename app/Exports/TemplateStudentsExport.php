<?php

namespace App\Exports;

use App\Models\Modules\ModuleTypeOfEthnics;
use App\Models\Modules\ModuleTypeOfReligions;
use App\Models\Modules\ModuleVocationalEducationPolicities;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Cell\DataValidation;
use Maatwebsite\Excel\Events\AfterSheet;

class TemplateStudentsExport implements FromCollection, WithHeadings, WithStyles, ShouldAutoSize, WithEvents
{
    public function collection()
    {
        // Trả về một collection rỗng vì chỉ cần mẫu không có dữ liệu.
        return collect([]);
    }

    public function headings(): array
    {
        return [
            'Tên học viên *', 
            'Ngày sinh *', 
            'Số điện thoại', 
            'Email', 
            'CCCD/CMND *', 
            'Ngày cấp', 
            'Nơi cấp', 
            'Địa chỉ thường trú', 
            'Nơi ở hiện tại', 
            'Dân tộc', 
            'Tôn giáo', 
            'Giới tính', 
            'Trình độ học vấn', 
            'Chính sách',
            'Ghi chú'
        ];
    }

    public function styles(Worksheet $sheet)
    {
        // Định dạng cho hàng tiêu đề
        $sheet->getStyle('A1:O1')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['rgb' => '000000'] // Màu chữ tiêu đề là màu đen
            ],
            'fill' => [
                'fillType' => Fill::FILL_SOLID,
                'startColor' => ['rgb' => 'FFB800']
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                    'color' => ['rgb' => '000000']
                ]
            ]
        ]);

        // Định dạng viền cho các ô dữ liệu (A2:N100 là ví dụ, điều chỉnh theo số hàng bạn muốn)
        $sheet->getStyle('A2:O100')->applyFromArray([
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                    'color' => ['rgb' => '000000']
                ]
            ]
        ]);

        return [
            1 => ['font' => ['bold' => true]], // Áp dụng định dạng font cho hàng tiêu đề
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $sheet = $event->sheet->getDelegate();

                // Lấy danh sách Tôn giáo từ cơ sở dữ liệu
                $religions = ModuleTypeOfReligions::whereIdSite(Auth::guard('user')->user()->id_site)
                    ->pluck('name')->toArray();

                // Lấy danh sách Dân tộc từ cơ sở dữ liệu
                $ethnics = ModuleTypeOfEthnics::whereIdSite(Auth::guard('user')->user()->id_site)
                    ->pluck('name')->toArray();

                // Lấy danh sách Chính sách từ cơ sở dữ liệu
                $policies = ModuleVocationalEducationPolicities::whereIdSite(Auth::guard('user')->user()->id_site)
                    ->pluck('name')->toArray();

                $gender = ['Nam', 'Nữ'];

                // Chèn các danh sách vào sheet
                $this->insertList($sheet, $gender, 'W', 'Giới tính');
                $this->insertList($sheet, $religions, 'X', 'Tôn giáo');
                $this->insertList($sheet, $ethnics, 'Y', 'Dân tộc');
                $this->insertList($sheet, $policies, 'Z', 'Chính sách');

                // Thêm Data Validation cho các cột tương ứng
                $this->addDataValidation($sheet, 'L', 'W', count($gender));
                $this->addDataValidation($sheet, 'K', 'X', count($religions));
                $this->addDataValidation($sheet, 'J', 'Y', count($ethnics));
                $this->addDataValidation($sheet, 'N', 'Z', count($policies));

                // Thêm Data Validation cho cột Trình độ học vấn để lựa chọn từ 1 đến 12
                $this->addGradeValidation($sheet, 'M');

                // Định dạng cột ngày sinh và ngày cấp thành văn bản
                $this->addTextValidation($sheet, 'B');
                $this->addTextValidation($sheet, 'F');

                // Ẩn các cột W, X, Y, Z
                $sheet->getColumnDimension('W')->setVisible(false);
                $sheet->getColumnDimension('X')->setVisible(false);
                $sheet->getColumnDimension('Y')->setVisible(false);
                $sheet->getColumnDimension('Z')->setVisible(false);
            },
        ];
    }

    private function insertList($sheet, $list, $column, $header)
    {
        // Chèn tiêu đề của danh sách
        $sheet->setCellValue("{$column}1", $header);
        // Chèn các giá trị của danh sách
        foreach ($list as $index => $value) {
            $sheet->setCellValue("{$column}" . ($index + 2), $value);
        }
    }

    private function addDataValidation($sheet, $column, $listColumn, $count)
    {
        $rows = range(2, 100); // Các hàng từ 2 đến 100

        foreach ($rows as $row) {
            $validation = $sheet->getCell("{$column}{$row}")->getDataValidation();
            $validation->setType(DataValidation::TYPE_LIST);
            $validation->setErrorStyle(DataValidation::STYLE_INFORMATION);
            $validation->setAllowBlank(true);
            $validation->setShowInputMessage(true);
            $validation->setShowErrorMessage(true);
            $validation->setShowDropDown(true);
            $validation->setFormula1("={$listColumn}$2:{$listColumn}$" . ($count + 1));
        }
    }

    private function addTextValidation($sheet, $column)
    {
        $rows = range(2, 100); // Các hàng từ 2 đến 100

        foreach ($rows as $row) {
            $sheet->getStyle("{$column}{$row}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_TEXT);
        }
    }

    private function addGradeValidation($sheet, $column)
    {
        $rows = range(2, 100); // Các hàng từ 2 đến 100

        foreach ($rows as $row) {
            $validation = $sheet->getCell("{$column}{$row}")->getDataValidation();
            $validation->setType(DataValidation::TYPE_LIST);
            $validation->setErrorStyle(DataValidation::STYLE_INFORMATION);
            $validation->setAllowBlank(true);
            $validation->setShowInputMessage(true);
            $validation->setShowErrorMessage(true);
            $validation->setShowDropDown(true);
            $validation->setFormula1('"1,2,3,4,5,6,7,8,9,10,11,12"');
        }
    }
}
