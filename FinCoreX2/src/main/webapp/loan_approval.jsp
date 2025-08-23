<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loan Approvals - FinCoreX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="includes/header.jsp"%>
	<div class="d-flex">
		<%@ include file="includes/admin_sidebar.jsp"%>
		<main class="flex-grow-1 p-4">
			<div class="container-fluid">
				<h3 class="mb-4 text-primary">
					<i class="fas fa-hand-holding-usd me-2"></i>Loan Approvals
				</h3>

				<!-- Success Message -->
				<c:if test="${param.updated == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Loan status updated
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<!-- Error Message -->
				<c:if test="${not empty errors}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<i class="fas fa-exclamation-circle me-2"></i>${errors}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<!-- Loan List -->
				<div class="card shadow-sm mb-4">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-list me-2"></i>Loan List
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover align-middle">
								<thead class="table-light">
									<tr>
										<th scope="col">Loan ID</th>
										<th scope="col">Customer ID</th>
										<th scope="col">Account Number</th>
										<!-- ← NEW COLUMN -->
										<th scope="col">Loan Type</th>
										<th scope="col">Amount</th>
										<th scope="col">Interest Rate</th>
										<th scope="col">Tenure</th>
										<th scope="col">Status</th>
										<th scope="col">Applied Date</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="loan" items="${loans}">
										<tr>
											<td><strong>#${loan.loanId}</strong></td>
											<td>${loan.customerId}</td>
											<td><c:choose>
													<c:when test="${not empty loan.accountNumber}">
                                                        ${loan.accountNumber}
                                                    </c:when>
													<c:otherwise>
														<em class="text-muted">Not assigned</em>
													</c:otherwise>
												</c:choose></td>
											<td>${loan.loanType}</td>
											<td>₹${loan.amount}</td>
											<td>${loan.interestRate}%</td>
											<td>${loan.tenureMonths} months</td>
											<td><c:choose>
													<c:when test="${loan.status == 'PENDING'}">
														<span class="badge text-bg-warning">Pending</span>
													</c:when>
													<c:when test="${loan.status == 'APPROVED'}">
														<span class="badge text-bg-success">Approved</span>
													</c:when>
													<c:when test="${loan.status == 'REJECTED'}">
														<span class="badge text-bg-danger">Rejected</span>
													</c:when>
													<c:when test="${loan.status == 'CLOSED'}">
														<span class="badge text-bg-secondary">Closed</span>
													</c:when>
												</c:choose></td>
											<td>${loan.appliedDate}</td>
											<td><c:choose>
													<c:when test="${loan.status == 'PENDING'}">
														<form method="post"
															action="${pageContext.request.contextPath}/admin/loan/update-status"
															class="d-inline">
															<input type="hidden" name="loanId" value="${loan.loanId}">
															<select class="form-select form-select-sm" name="status"
																required>
																<option value="" disabled selected>Select
																	Status</option>
																<option value="APPROVED">Approve</option>
																<option value="REJECTED">Reject</option>
															</select>
															<button type="submit"
																class="btn btn-sm btn-primary mt-1 w-100">Update</button>
														</form>
													</c:when>
													<c:otherwise>
														<span class="text-muted"><i
															class="fas fa-lock me-1"></i>No further actions</span>
													</c:otherwise>
												</c:choose></td>

										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="10" class="text-center text-muted">Total
											Loans: ${loans != null ? loans.size() : 0}</td>
									</tr>
								</tfoot>
							</table>

							<c:if test="${empty loans}">
								<div class="alert alert-info text-center">
									<i class="fas fa-info-circle me-2"></i>No loans to approve at
									this time.
								</div>
							</c:if>
						</div>
					</div>
				</div>

				<!-- Back to Dashboard -->
				<a class="btn btn-outline-secondary mt-4"
					href="${pageContext.request.contextPath}/admin/dashboard"> <i
					class="fas fa-arrow-left me-2"></i>Back to Dashboard
				</a>
			</div>
		</main>
	</div>

	<%@ include file="includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>