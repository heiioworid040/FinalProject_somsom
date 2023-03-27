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
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">#</th>
											<th scope="col">First</th>
											<th scope="col">Last</th>
											<th scope="col">Handle</th>
										</tr>
									</thead>
									<tbody id="lineTableBody">
										<c:forEach var="lineDTO" items="${lineList }">
											<tr>
												<td scope="row">${lineDTO.line_cd }</td>
												<td>${lineDTO.line_nm }</td>
												<td>${lineDTO.line_process }</td>
												<td>${lineDTO.line_place }</td>
												<td>${lineDTO.line_num }</td>
												<td>${lineDTO.line_st }</td>
												<td>${lineDTO.line_note }</td>
											</tr>
										</c:forEach>
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