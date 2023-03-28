<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="lineModal" tabindex="-1" role="dialog"
	aria-labelledby="largeModalLabel" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title inline-block" id="largeModalLabel">Large
					Modal</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="col">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Table Head</strong>
							</div>
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
	$(function(){
		document.getElementById("lineModalBtn").addEventListener('click', getLineModal);
		
		function getLineModal(){
			try {
				jQuery('#lineTableBody').html('');
				jQuery.ajax({
					type : 'get',
					url:'${pageContext.request.contextPath}/ajax/lineModal',
					dataType:'json',
					success:function(linearr){
						jQuery.each(linearr,function(index,item){
							jQuery('#lineTableBody').append('<tr id="lineModaTr"><td scope="row" id="lineTdCd">'+item.line_cd+'</td><td id="lineTdNm">'+item.line_nm+'</td><td>'+item.line_process+'</td><td>'+item.line_place +'</td><td>'+item.line_num +'</td><td>'+item.line_st +'</td><td>'+item.line_note+'</td></tr>');
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
			jQuery('#lineModal').modal("show");
		}// getLineModal()
		
		document.getElementById("lineModaTr").addEventListener('click', selectLine);
		
		function selectLine(){
			const line_cd = document.getElementById("#lineTdCd");
			const line_nm = document.getElementById("#lineTdNm");
			
				
			} catch (e) {
			console.log(e instanceof TypeError); // true
			console.log(e.message);              // "null has no properties"
			console.log(e.name);                 // "TypeError"
			console.log(e.fileName);             // "Scratchpad/1"
			console.log(e.lineNumber);           // 2
			console.log(e.columnNumber);         // 2
			console.log(e.stack);                // "@Scratchpad/2:2:3\n"
			}
		}// getLineModal()
		
		
	}) // Function Top
</script>