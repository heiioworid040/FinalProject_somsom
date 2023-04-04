<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="prodModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" style="display: none;" aria-hidden="true">
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
				<div class="col">
					<div class="row">
						<div class="col-lg">
							<div class="card">
								<div class="card-body card-block">
									<form class="form-inline" method="post" id="prodSearchForm">
											<div class="input-group col-10">
												<label for="modalProdCd" class="pr-1 form-control-label">상품 코드</label>
												<input type="text" id="modalProdCd" name="modalProdCd" placeholder="Prod Code" class="form-control bg-white mr-4">
												<label for="searchLProdNm" class="pr-1 form-control-label">상품명</label>
												<input type="text" id="modalProdNm" name="modalProdNm" placeholder="Prod Name" class="form-control bg-white mr-4">
												<div class=" form-group">
													<label for="modalProdMat" class="pr-1 form-control-label">자재 유형</label>
													<div class="col">
                                      			  		<select name="select" id="modalProdMat" name="modalProdMat" class="form-control">
                                      			  			<option value="">--</option>
                                  							<option value="원자재">원자재</option>
                                                			<option value="부자재">부자재</option>
                                                			<option value="완제품">완제품</option>
                                                		</select>
                                        			</div>
                                    			</div>
												<div class="input-group-btn">
													<input type="button" class="btn btn-primary ml-2" 
													id="prodSearchBtn" value="검색">
												</div>
											</div>
											<div class="col p-0"></div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
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
			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancleModal">취소</button>
				</div>
		</div>
	</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
		$(document).on("click","#prodModalBtn",function() {
			// 모달열기
			event.preventDefault();
			try {
				jQuery('#prodTableBody').html('');
				jQuery.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/ajax/prodModal',
					dataType : 'json',
					success : function(prodarr) {
						jQuery.each(prodarr,function(index,item) {
							jQuery('#prodTableBody').append('<tr><td scope="row">'+ item.prod_cd+ '</td><td>'+ item.prod_nm+ '</td><td>'+ item.prod_mat+ '</td><td>'+ item.prod_unit+ '</td><td>'+ item.prod_text+ '</td><td>'+ item.prod_size+ '</td><td>'+ item.prod_inprice+ '</td><td>'+ item.prod_outprice+ '</td><td>'+ item.prod_count+ '</td><td>'+ item.prod_note+ '</td></tr>');
							});
						}
						});
				event.preventDefault();
				}catch(e){
					console.log(e instanceof TypeError);
					console.log(e.message);
					console.log(e.name);
					console.log(e.fileName);
					console.log(e.lineNumber);
					console.log(e.columnNumber);
					console.log(e.stack);
				}
				jQuery('#prodModal').modal("show");
				});
		
		
		$(document).on("click","#prodSearchBtn",function() {
			// 모달 내부 검색
			try {
				jQuery('#prodTableBody').html('');
				jQuery.ajax({
					type :'post',
					url : '${pageContext.request.contextPath}/ajax/prodModal',
					data : $('#prodSearchForm').serialize(),
					dataType : 'json',
					success : function(arr) {
						jQuery.each(arr,function(index,item) {
							jQuery('#prodTableBody').append('<tr><td scope="row">'+ item.prod_cd+ '</td><td>'+ item.prod_nm+ '</td><td>'+ item.prod_mat+ '</td><td>'+ item.prod_unit+ '</td><td>'+ item.prod_text+ '</td><td>'+ item.prod_size+ '</td><td>'+ item.prod_inprice+ '</td><td>'+ item.prod_outprice+ '</td><td>'+ item.prod_count+ '</td><td>'+ item.prod_note+ '</td><td class="d-none">'+ item.prod_number+ '</td></tr>');
							});
						}
					});
				} catch (e) {
					console.log(e instanceof TypeError); // true
					console.log(e.message); // "null has no properties"
					console.log(e.name); // "TypeError"
					console.log(e.fileName); // "Scratchpad/1"
					console.log(e.lineNumber); // 2
					console.log(e.columnNumber); // 2
					console.log(e.stack); // "@Scratchpad/2:2:3\n"
				}
			});

		$(document).on("click", "#prodTableBody tr", function() {
		// tr 선택
			event.preventDefault();
			var str = ""
			var prodArr = new Array(); // 배열 선언
		
			var mdalProdCd ="";

			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();
	
			// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
			mdalProdCd = td.eq(0).text();
	
			console.log("클릭한 Row의 모든 데이터 : " + tr.text());
	
			jQuery('#searchProdCd').val(mdalProdCd);
			
			jQuery('#prodModal').modal("hide");
		});
		
		
		$(document).on("click", "#cancleModal", function() {
			// 취소
			event.preventDefault();
			modalProdCd = "";
		
			$('#searchProdCd').val(modalProdCd);
			event.preventDefault();

			jQuery('#prodModal').modal("hide");
		});
})
</script>