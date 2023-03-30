<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
	aria-labelledby="largeModalLabel" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title inline-block" id="largeModalLabel">수주 번호</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="col">
						<div class="card">
							<div class="card-body">
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr>
											<th scope="col">상품 코드</th>
											<th scope="col">상품 이름</th>
											<th scope="col">자재 유형</th>
											<th scope="col">단위</th>
											<th scope="col">재질</th>
											<th scope="col">규격</th>
											<th scope="col">매입단가</th>
											<th scope="col">매출단가</th>
											<th scope="col">현재고</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody id="prodTableBody">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary">Confirm</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on("click", "#prodModalBtn", function(){
		event.preventDefault();
			try {
				jQuery('#prodTableBody').html('');
				jQuery.ajax({
					type : 'get',
					url:'${pageContext.request.contextPath}/ajax/prodModal',
					dataType:'json',
					success:function(prodarr){
						jQuery.each(prodarr,function(index,item){
							jQuery('#prodTableBody').append('<tr><td scope="row">'+item.prod_cd+'</td><td>'+item.prod_nm+'</td><td>'+item.prod_mat +'</td><td>'+item.prod_unit +'</td><td>'+item.prod_text+'</td><td>'+item.prod_size +'</td><td>'+item.prod_inprice+'</td><td>'+item.prod_outprice+'</td><td>'+item.prod_count+'</td><td>'+item.prod_note+'</td></tr>');
						});
					}
				});
			} catch (e) {
				  console.log(e instanceof TypeError); // true
				  console.log(e.message);              // "null has no properties"
				  console.log(e.name);                 // "TypeError"
				  console.log(e.fileName);             // "Scratchpad/1"
				  console.log(e.lineNumber);           // 2
				  console.log(e.columnNumber);         // 2
				  console.log(e.stack);                // "@Scratchpad/2:2:3\n"

			}
			jQuery('#prodModal').modal("show");
		});
	
		// 테이블의 Row 클릭시 값 가져오기
	$(document).on("click", "#prodTableBody tr", function(){
		var str = ""
		var prodArr = new Array();	// 배열 선언
			
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
			
		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
	 	var sprod_cd = td.eq(0).text();
	 	var sprod_nm = td.eq(1).text();
	 	var sprod_unit = td.eq(3).text();

	 	
	 	$('#sProdInputCd').val(sprod_cd);
	 	$('#sProdInputNm').val(sprod_nm);
	 	$('#sProdInputUnit').val(sprod_unit);


	 	jQuery('#prodModal').modal("hide");
		});
</script>