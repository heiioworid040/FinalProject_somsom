<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fadel" id="orderModal" tabindex="-1" role="dialog"
	aria-labelledby="myExtraLargeModalLabel" style="display: none;"
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
											<th scope="col">수주번호</th>
											<th scope="col">상품코드</th>
											<th scope="col">담당자</th>
											<th scope="col">거래처</th>
											<th scope="col">수주일자</th>
											<th scope="col">납품예정일</th>
											<th scope="col">수주량</th>
										</tr>
									</thead>
									<tbody id="orderTableBody">

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
	$(document).on("click", "#orderModalBtn", function(){
		event.preventDefault();
			try {
				jQuery('#orderTableBody').html('');
				jQuery.ajax({
					type : 'get',
					url:'${pageContext.request.contextPath}/ajax/orderModal',
					dataType:'json',
					success:function(orderarr){
						jQuery.each(orderarr,function(index,item){
							jQuery('#orderTableBody').append('<tr><td scope="row">'+item.ord_cd+'</td><td id="order">'+item.prod_cd+'</td><td>'+item.emp_cd+'</td><td>'+item.cli_nm +'</td><td>'+item.ord_date+'</td><td>'+item.ord_d_date +'</td><td>'+item.ord_count+'</td></tr>');
						});
					}
				});
			} catch (e) {
				  console.log(e instanceof TypeError); // true
				  console.log(e.message);              // "null has no properties"
				  console.log(e.name);                 // "TypeError"
				  console.log(e.fileName);             // "Scratchpad/1"
				  console.log(e.orderNumber);           // 2
				  console.log(e.columnNumber);         // 2
				  console.log(e.stack);                // "@Scratchpad/2:2:3\n"

			}
			jQuery('#orderModal').modal("show");
		});
	
		// 테이블의 Row 클릭시 값 가져오기
	$(document).on("click", "#orderTableBody tr", function(){
		var str = ""
		var orderArr = new Array();	// 배열 선언
			
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
			
		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
	 	var sorder_cd = td.eq(0).text();
	 	var sorder_nm = td.eq(1).text();
	 	
	 	$('#sorderInputCd').val(sorder_cd);
	 	$('#sorderInputNm').val(sorder_nm);
	 	
	 	jQuery('#orderModal').modal("hide");
		});
</script>