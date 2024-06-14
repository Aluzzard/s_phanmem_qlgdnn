@extends('mainstructure.layouts.admins.layout')
@section('title','Báo cáo số liệu tuyển sinh, tốt nghiệp lao động nông thôn học nghề')

@section('css')
<style type="text/css">
    .fixed-table-body {
    	overflow: auto;
    }
</style>
<!-- chosen CSS
    ============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/chosen/bootstrap-chosen.css') }}">
@endsection

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Báo cáo số liệu tuyển sinh, tốt nghiệp lao động nông thôn học nghề</h4>
                            <div class="sparkline8-graph">
	                        	<div class="row">
	                                <div class="col-md-2">
	                                    <div class="chosen-select-single mg-b-20">
	                                        <select onchange="location = this.value;" class="chosen-select" tabindex="-1">
	                                            <option value="/admin/module/thong-ke-tong-hop?form=1">Biểu mẫu 1</option>
	                                            <option value="/admin/module/thong-ke-tong-hop?form=2" selected>Biểu mẫu 2</option>

	                                        </select>
	                                    </div>
	                                </div>
	                            </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="datatable-dashv1-list custom-datatable-overright">
                                            <table id="table" data-toggle="table" data-pagination="false" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                                <thead>
                                                    <tr>
                                                        <th data-sortable="false" rowspan="4">Số thứ tự</th>
                                                        <th data-sortable="false" rowspan="4">Tên ngành, nghề đào tạo </th>
                                                        <th data-sortable="false" rowspan="4">Tổng số lớp </th>
                                                        <th data-sortable="false" rowspan="4">Tổng số người </th>
                                                        <th data-sortable="false" colspan="19">Chia theo đối tượng </th>
                                                    </tr>
                                                    <tr>
                                                        <th data-sortable="false" rowspan="3">Tổng số nữ</th>
                                                        <th data-sortable="false" rowspan="3">Người CCCM</th>
                                                        <th data-sortable="false" rowspan="3">Người khuyết tật</th>
                                                        <th data-sortable="false" rowspan="3">Người bị thu hồi đất </th>
                                                        <th data-sortable="false" rowspan="3">Ngư dân</th>
                                                        <th data-sortable="false" rowspan="3">Hộ nghèo</th>
                                                        <th data-sortable="false" rowspan="3">Hộ cận nghèo</th>
                                                        <th data-sortable="false" colspan="5">Dân tộc thiểu số</th>
                                                        <th data-sortable="false" colspan="7">Lao động là thanh niên</th>
                                                    </tr>
                                                    <tr>
                                                        <th data-sortable="false" rowspan="2">Tổng số</th>
                                                        <th data-sortable="false" rowspan="2">Nữ dân tộc thiểu số</th>
                                                        <th data-sortable="false" rowspan="2">Khmer</th>
                                                        <th data-sortable="false" rowspan="2">Hoa</th>
                                                        <th data-sortable="false" rowspan="2">Dân tộc thiểu số khác</th>
                                                        <th data-sortable="false" rowspan="2">Tổng số thanh niên</th>
                                                        <th data-sortable="false" rowspan="2">Thanh niên hoàn thành nghĩa vụ</th>
                                                        <th data-sortable="false" colspan="5">Thanh niên dân tộc thiểu số</th>
                                                    </tr>
                                                    <tr>
                                                        <th data-sortable="false">Tổng số thanh niên dân tộc</th>
                                                        <th data-sortable="false">Tổng số nữ dân tộc</th>
                                                        <th data-sortable="false">Khmer</th>
                                                        <th data-sortable="false">Hoa</th>
                                                        <th data-sortable="false">Thanh niên dân tộc thiểu số khác</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<tr>
                                                		<td>1</td>
                                                		<td>2</td>
                                                		<td>3</td>
                                                		<td>4</td>
                                                		<td>5</td>
                                                		<td>6</td>
                                                		<td>7</td>
                                                		<td>8</td>
                                                		<td>9</td>
                                                		<td>10</td>
                                                		<td>11</td>
                                                		<td>12</td>
                                                		<td>13</td>
                                                		<td>14</td>
                                                		<td>15</td>
                                                		<td>16</td>
                                                		<td>17</td>
                                                		<td>18</td>
                                                		<td>19</td>
                                                		<td>20</td>
                                                		<td>21</td>
                                                		<td>22</td>
                                                		<td>23</td>
                                                	</tr>
													<tr>
                                                		<td><strong>A</strong></td>
                                                		<td colspan="22"><strong>TUYỂN SINH</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td><strong>I</strong></td>
                                                		<td colspan="22"><strong>PHI NÔNG NGHIỆP</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="4">1</td>
                                                		<td colspan="22"><strong>Sơ cấp</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Dưới 25 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Từ 26 đến 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trên 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="10">2</td>
                                                		<td colspan="22"><strong>Thường xuyên dưới 3 tháng</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Dưới 25 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>May công nghiệp</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trồng lúa năng suất cao</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Từ 26 đến 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>May công nghiệp</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trồng lúa năng suất cao</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trên 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>May công nghiệp</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trồng lúa năng suất cao</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td><strong>II</strong></td>
                                                		<td colspan="22"><strong>NÔNG NGHIỆP</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="3">1</td>
                                                		<td>Dưới 25 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Từ 26 đến 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trên 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="3">2</td>
                                                		<td>Dưới 25 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Từ 26 đến 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trên 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td></td>
                                                		<td>Tổng cộng Tuyển sinh (I+II)</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<!-- Nông nghiệp -->
                                                	<tr>
                                                		<td><strong>B</strong></td>
                                                		<td colspan="22"><strong>TỐT NGHIỆP</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td><strong>I</strong></td>
                                                		<td colspan="22"><strong>PHI NÔNG NGHIỆP</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="4">1</td>
                                                		<td colspan="22"><strong>Sơ cấp</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Dưới 25 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Từ 26 đến 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trên 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="10">2</td>
                                                		<td colspan="22"><strong>Thường xuyên dưới 3 tháng</strong></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Dưới 25 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>May công nghiệp</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trồng lúa năng suất cao</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Từ 26 đến 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>May công nghiệp</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trồng lúa năng suất cao</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trên 45 tuổi</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>May công nghiệp</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Trồng lúa năng suất cao</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td></td>
                                                		<td>Tổng cộng Tốt nghiệp (I+II)</td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
                                                	</tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Data table area End-->
    </div>
</div>
@endsection
@section('javascript')
<!-- chosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen.jquery.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen-active.js') }}"></script>
@endsection