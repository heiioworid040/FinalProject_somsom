<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="lineModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
      		<h5 class="modal-title inline-block" id="lineModalLabel">라인 검색</h5>
    	    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    	    	<span aria-hidden="true">&times;</span>
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
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	    <div class="modal-footer">
    		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        	<button type="button" class="btn btn-primary">Send message</button>
		</div>
		</div>
	</div>
</div>	