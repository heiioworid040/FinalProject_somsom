<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="lineModal" tabindex="-1" role="dialog"
	aria-labelledby="largeModalLabel" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title inline-block" id="largeModalLabel">생산 라인</h5>
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
									<form class="form-inline" method="post" id="lineSearchForm">
										<div class="form-group col-6 mb-1">
											<div class="input-group modalP" id="modalP1">
												<label for="modalLineCd" class="pr-1 form-control-label">라인 코드</label>
												<input type="text" id="modalLineCd" name="modalLineCd"
													placeholder="Line Code" class="form-control bg-white mr-4">
												<label for="modalLineNm" class="pr-1 form-control-label">라인명</label>
												<input type="text" id="modalLineNm" name="modalLineNm"
													placeholder="Line Name" class="form-control bg-white">
												<div class="input-group-btn">
													<input type="button" class="btn btn-primary ml-2"
														id="lineSearchBtn" value="검색">
												</div>
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
										<th scope="col">라인코드</th>
										<th scope="col">라인명</th>
										<th scope="col">공정</th>
										<th scope="col">작업장</th>
										<th scope="col">정렬순서</th>
										<th scope="col">설비상태</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="lineTableBody">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" id="cancleModal">취소</button>
			</div>
		</div>
	</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var clickBtnP = "";
		$(document).on("click","#lineModalBtn",function() {
			// 모달열기
			clickBtnP = $(this).closest('.modalP');
			try {
				jQuery('#lineTableBody').html('');
				jQuery.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/ajax/lineModal',
					dataType : 'json',
					success : function(linearr) {
						jQuery.each(linearr,function(index,item) {
							jQuery('#lineTableBody').append(
									'<tr><td scope="row">'+ item.line_cd+'</td><td id="line">'+ item.line_nm+'</td><td>'+ item.line_process+ '</td><td>'+ item.line_place+ '</td><td>'+ item.line_num+ '</td><td>'+ item.line_st+'</td><td>'+ item.line_note+ '</td></tr>');
							});
						}
					});
				jQuery('#lineModal').modal("show");
				event.preventDefault();
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

		
	$(document).on("click","#lineSearchBtn",function() {
		// 모달 내부 검색
		try {
			jQuery('#lineTableBody').html('');
			jQuery.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/ajax/lineModal',
				data : $('#lineSearchForm').serialize(),
				dataType : 'json',
				success : function(linearr) {
					jQuery.each(linearr,function(index, item) {
						jQuery('#lineTableBody').append('<tr><td scope="row">'+ item.line_cd+ '</td><td>'+ item.line_nm+ '</td><td>'+ item.line_process+ '</td><td>'+ item.line_place+ '</td><td>'+ item.line_num+ '</td><td>'+ item.line_st+ '</td><td>'+item.line_note+ '</td></tr>');
						});
					}
				});
			event.preventDefault();
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

		$(document).on("click", "#lineTableBody tr", function() {
			// tr 선택
			event.preventDefault();
			var str = ""
			var lineArr = new Array();
			var mdalLineCd1 = "";
			var mdalLineCd2 = "";

			if (clickBtnP.attr('id') === 'modalP1') {
				var tr1 = $(this);
				var td1 = tr1.children();

				mdalLineCd1 = td1.eq(0).text();
				mdalLineCd2 = "";

				console.log("클릭한 Row의 모든 데이터1 : " + tr1.text());

				$('#searchLineCd').val(mdalLineCd1);
			}
			if (clickBtnP.attr('id') === 'modalP2') {
				var tr2 = $(this);
				var td2 = tr2.children();

				mdalLineCd1 = "";
				mdalLineCd2 = td2.eq(0).text();
				mdalLineNm = td2.eq(1).text();
				console.log("클릭한 Row의 모든 데이터2 : " + tr2.text());
				$('#insertLineCd').val(mdalLineCd2);
				$('#insertLineNm').val(mdalLineNm);
			}

			jQuery('#lineModal').modal("hide");
		});

		$(document).on("click", "#cancleModal", function() {
			// 취소
			event.preventDefault();
			if (clickBtnP.attr('id') == 'modalP1') {
				modalLineCd1 = "";

				$('#searchLineCd').val(modalLineCd1);
			}

			if (clickBtnP.attr('id') == 'modalP2') {
				modalLineCd2 = "";
				modalLineNm = "";

				$('#insertLineCd').val(modalLineCd2);
				$('#insertLineNm').val(modalLineNm);
			}
			
			jQuery('#lineModal').modal("hide");
		});
	})
</script>