<table class="table-bordered text-center">
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
    		<td><i>1</i></td>
    		<td><i>2</i></td>
    		<td><i>3</i></td>
    		<td><i>4</i></td>
    		<td><i>5</i></td>
    		<td><i>6</i></td>
    		<td><i>7</i></td>
    		<td><i>8</i></td>
    		<td><i>9</i></td>
    		<td><i>10</i></td>
    		<td><i>11</i></td>
    		<td><i>12</i></td>
    		<td><i>13</i></td>
    		<td><i>14</i></td>
    		<td><i>15</i></td>
    		<td><i>16</i></td>
    		<td><i>17</i></td>
    		<td><i>18</i></td>
    		<td><i>19</i></td>
    		<td><i>20</i></td>
    		<td><i>21</i></td>
    		<td><i>22</i></td>
    		<td><i>23</i></td>
    	</tr>
<!-- Tuyển sinh -->
    	<tr>
    		<td><strong>A</strong></td>
    		<td><strong>TUYỂN SINH</strong></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
    		<td></td>
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
            <td><strong><i>I</i></strong></td>
            <td><strong><i>Phi nông nghiệp</i></strong></td>
            @isset( $data['tuyensinh']['phinn']['sum'] )
            @foreach($data['tuyensinh']['phinn']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
    	<tr>
    		<td><strong><i>1</i></strong></td>
    		<td><strong><i>Sơ cấp</i></strong></td>
            @isset( $data['tuyensinh']['phinn']['socap']['sum'] )
    		@foreach($data['tuyensinh']['phinn']['socap']['sum'] as $item)
    		<td>{{$item != '0' ? $item : ''}}</td>
    		@endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
    	</tr>
    	<tr>
    		<td></td>
            <td>Dưới 25 tuổi</td>
            @isset( $data['tuyensinh']['phinn']['socap']['under25'] )
    		@foreach($data['tuyensinh']['phinn']['socap']['under25'] as $item1)
    		<td>{{$item1 != '0' ? $item1 : ''}}</td>
    		@endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
    	</tr>
        <tr>
            <td></td>
            <td>Từ 26 đến 45 tuổi</td>
            @isset( $data['tuyensinh']['phinn']['socap']['26to45'] )
            @foreach($data['tuyensinh']['phinn']['socap']['26to45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Trên 45 tuổi</td>
            @isset( $data['tuyensinh']['phinn']['socap']['above45'] )
            @foreach($data['tuyensinh']['phinn']['socap']['above45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
<!-- Dưới 3 tháng -->
        <tr>
            <td><strong><i>2</i></strong></td>
            <td><strong><i>Dưới 3 tháng</i></strong></td>
            @isset( $data['tuyensinh']['phinn']['duoi3thang']['sum'] )
            @foreach($data['tuyensinh']['phinn']['duoi3thang']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <!-- Dưới 25t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Dưới 25 tuổi</i></strong></td>
            @isset( $data['tuyensinh']['phinn']['duoi3thang']['under25']['sum'] )
            @foreach($data['tuyensinh']['phinn']['duoi3thang']['under25']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['tuyensinh']['phinn']['duoi3thang']['under25']['detail'] )
        @foreach($data['tuyensinh']['phinn']['duoi3thang']['under25']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- 26 đến 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Từ 26 đến 45 tuổi</i></strong></td>
            @isset( $data['tuyensinh']['phinn']['duoi3thang']['26to45']['sum'] )
            @foreach($data['tuyensinh']['phinn']['duoi3thang']['26to45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['tuyensinh']['phinn']['duoi3thang']['26to45']['detail'] )
        @foreach($data['tuyensinh']['phinn']['duoi3thang']['26to45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
		<!-- Trên 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Trên 45 tuổi</i></strong></td>
            @isset( $data['tuyensinh']['phinn']['duoi3thang']['above45']['sum'] )
            @foreach($data['tuyensinh']['phinn']['duoi3thang']['above45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['tuyensinh']['phinn']['duoi3thang']['above45']['sum'] )
        @foreach($data['tuyensinh']['phinn']['duoi3thang']['above45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
	   	
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
<!-- Nông nghiệp -->
        <tr>
            <td><strong><i>II</i></strong></td>
            <td><strong><i>Nông nghiệp</i></strong></td>
            @isset( $data['tuyensinh']['nn']['sum'] )
            @foreach($data['tuyensinh']['nn']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td><strong><i>1</i></strong></td>
            <td><strong><i>Sơ cấp</i></strong></td>
            @isset( $data['tuyensinh']['nn']['socap']['sum'] )
            @foreach($data['tuyensinh']['nn']['socap']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Dưới 25 tuổi</td>
            @isset( $data['tuyensinh']['nn']['socap']['under25'] )
            @foreach($data['tuyensinh']['nn']['socap']['under25'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Từ 26 đến 45 tuổi</td>
            @isset( $data['tuyensinh']['nn']['socap']['26to45'] )
            @foreach($data['tuyensinh']['nn']['socap']['26to45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Trên 45 tuổi</td>
            @isset( $data['tuyensinh']['nn']['socap']['above45'] )
            @foreach($data['tuyensinh']['nn']['socap']['above45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
<!-- Dưới 3 tháng -->
        <tr>
            <td><strong><i>2</i></strong></td>
            <td><strong><i>Dưới 3 tháng</i></strong></td>
            @isset( $data['tuyensinh']['nn']['duoi3thang']['sum'] )
            @foreach($data['tuyensinh']['nn']['duoi3thang']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <!-- Dưới 25t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Dưới 25 tuổi</i></strong></td>
            @isset( $data['tuyensinh']['nn']['duoi3thang']['under25']['sum'] )
            @foreach($data['tuyensinh']['nn']['duoi3thang']['under25']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['tuyensinh']['nn']['duoi3thang']['under25']['detail'] )
        @foreach($data['tuyensinh']['nn']['duoi3thang']['under25']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- 26 đến 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Từ 26 đến 45 tuổi</i></strong></td>
            @isset( $data['tuyensinh']['nn']['duoi3thang']['26to45']['sum'] )
            @foreach($data['tuyensinh']['nn']['duoi3thang']['26to45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['tuyensinh']['nn']['duoi3thang']['26to45']['detail'] )
        @foreach($data['tuyensinh']['nn']['duoi3thang']['26to45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- Trên 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Trên 45 tuổi</i></strong></td>
            @isset( $data['tuyensinh']['nn']['duoi3thang']['above45']['sum'] )
            @foreach($data['tuyensinh']['nn']['duoi3thang']['above45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['tuyensinh']['nn']['duoi3thang']['above45']['sum'] )
        @foreach($data['tuyensinh']['nn']['duoi3thang']['above45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif

<!----------------------------------------------------- Tốt nghiệp --------------------------------------------------------->
        <tr>
            <td><strong>B</strong></td>
            <td><strong>TỐT NGHIỆP</strong></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
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
            <td><strong><i>I</i></strong></td>
            <td><strong><i>Phi nông nghiệp</i></strong></td>
            @isset( $data['totnghiep']['phinn']['sum'] )
            @foreach($data['totnghiep']['phinn']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td><strong><i>1</i></strong></td>
            <td><strong><i>Sơ cấp</i></strong></td>
            @isset( $data['totnghiep']['phinn']['socap']['sum'] )
            @foreach($data['totnghiep']['phinn']['socap']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Dưới 25 tuổi</td>
            @isset( $data['totnghiep']['phinn']['socap']['under25'] )
            @foreach($data['totnghiep']['phinn']['socap']['under25'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Từ 26 đến 45 tuổi</td>
            @isset( $data['totnghiep']['phinn']['socap']['26to45'] )
            @foreach($data['totnghiep']['phinn']['socap']['26to45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Trên 45 tuổi</td>
            @isset( $data['totnghiep']['phinn']['socap']['above45'] )
            @foreach($data['totnghiep']['phinn']['socap']['above45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
<!-- Dưới 3 tháng -->
        <tr>
            <td><strong><i>2</i></strong></td>
            <td><strong><i>Dưới 3 tháng</i></strong></td>
            @isset( $data['totnghiep']['phinn']['duoi3thang']['sum'] )
            @foreach($data['totnghiep']['phinn']['duoi3thang']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <!-- Dưới 25t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Dưới 25 tuổi</i></strong></td>
            @isset( $data['totnghiep']['phinn']['duoi3thang']['under25']['sum'] )
            @foreach($data['totnghiep']['phinn']['duoi3thang']['under25']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['totnghiep']['phinn']['duoi3thang']['under25']['detail'] )
        @foreach($data['totnghiep']['phinn']['duoi3thang']['under25']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- 26 đến 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Từ 26 đến 45 tuổi</i></strong></td>
            @isset( $data['totnghiep']['phinn']['duoi3thang']['26to45']['sum'] )
            @foreach($data['totnghiep']['phinn']['duoi3thang']['26to45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['totnghiep']['phinn']['duoi3thang']['26to45']['detail'] )
        @foreach($data['totnghiep']['phinn']['duoi3thang']['26to45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- Trên 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Trên 45 tuổi</i></strong></td>
            @isset( $data['totnghiep']['phinn']['duoi3thang']['above45']['sum'] )
            @foreach($data['totnghiep']['phinn']['duoi3thang']['above45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['totnghiep']['phinn']['duoi3thang']['above45']['sum'] )
        @foreach($data['totnghiep']['phinn']['duoi3thang']['above45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
<!-- Nông nghiệp -->
        <tr>
            <td><strong><i>II</i></strong></td>
            <td><strong><i>Nông nghiệp</i></strong></td>
            @isset( $data['totnghiep']['nn']['sum'] )
            @foreach($data['totnghiep']['nn']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td><strong><i>1</i></strong></td>
            <td><strong><i>Sơ cấp</i></strong></td>
            @isset( $data['totnghiep']['nn']['socap']['sum'] )
            @foreach($data['totnghiep']['nn']['socap']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Dưới 25 tuổi</td>
            @isset( $data['totnghiep']['nn']['socap']['under25'] )
            @foreach($data['totnghiep']['nn']['socap']['under25'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Từ 26 đến 45 tuổi</td>
            @isset( $data['totnghiep']['nn']['socap']['26to45'] )
            @foreach($data['totnghiep']['nn']['socap']['26to45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <tr>
            <td></td>
            <td>Trên 45 tuổi</td>
            @isset( $data['totnghiep']['nn']['socap']['above45'] )
            @foreach($data['totnghiep']['nn']['socap']['above45'] as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
<!-- Dưới 3 tháng -->
        <tr>
            <td><strong><i>2</i></strong></td>
            <td><strong><i>Dưới 3 tháng</i></strong></td>
            @isset( $data['totnghiep']['nn']['duoi3thang']['sum'] )
            @foreach($data['totnghiep']['nn']['duoi3thang']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        <!-- Dưới 25t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Dưới 25 tuổi</i></strong></td>
            @isset( $data['totnghiep']['nn']['duoi3thang']['under25']['sum'] )
            @foreach($data['totnghiep']['nn']['duoi3thang']['under25']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['totnghiep']['nn']['duoi3thang']['under25']['detail'] )
        @foreach($data['totnghiep']['nn']['duoi3thang']['under25']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- 26 đến 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Từ 26 đến 45 tuổi</i></strong></td>
            @isset( $data['totnghiep']['nn']['duoi3thang']['26to45']['sum'] )
            @foreach($data['totnghiep']['nn']['duoi3thang']['26to45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['totnghiep']['nn']['duoi3thang']['26to45']['detail'] )
        @foreach($data['totnghiep']['nn']['duoi3thang']['26to45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
        <!-- Trên 45t -->
        <tr>
            <td></td>
            <td class="text-danger"><strong><i>Trên 45 tuổi</i></strong></td>
            @isset( $data['totnghiep']['nn']['duoi3thang']['above45']['sum'] )
            @foreach($data['totnghiep']['nn']['duoi3thang']['above45']['sum'] as $item)
            <td>{{$item != '0' ? $item : ''}}</td>
            @endforeach
            @else
            <?php for ($i=0; $i < 21; $i++) { 
                echo '<td></td>';
            } ?>
            @endif
        </tr>
        @isset( $data['totnghiep']['nn']['duoi3thang']['above45']['sum'] )
        @foreach($data['totnghiep']['nn']['duoi3thang']['above45']['detail'] as $key=>$item)
        <tr>
            <td>{{$key+1}}</td>
            @foreach($item as $item1)
            <td>{{$item1 != '0' ? $item1 : ''}}</td>
            @endforeach
        </tr>
        @endforeach
        @else
        <?php for ($i=0; $i < 21; $i++) { 
            echo '<td></td>';
        } ?>
        @endif
    </tbody>
</table>