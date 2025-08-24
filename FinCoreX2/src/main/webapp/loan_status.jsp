<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Loans - FinCoreX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file="includes/header.jsp"%>
	<div class="d-flex flex-grow-1">
		<%@ include file="includes/sidebar.jsp"%>
		<main class="flex-grow-1 p-4">
			<div class="container-fluid">
				<h3 class="mb-4 text-primary">
					<i class="fas fa-hand-holding-usd me-2"></i>My Loans
				</h3>
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-list me-2"></i>Loan Details
						</h5>
					</div>
					<div class="card-body">
						<c:choose>
							<c:when test="${empty loans}">
								<p class="text-muted">No loans found.</p>
							</c:when>
							<c:otherwise>
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">Loan ID</th>
												<th scope="col">Account Number</th>
												<th scope="col">Loan Type</th>
												<th scope="col">Sanctioned Amount</th>
												<th scope="col">Remaining Amount</th> <!-- ✅ new -->
												<th scope="col">Interest Rate</th>
												<th scope="col">Tenure (Months)</th>
												<th scope="col">Applied Date</th>
												<th scope="col">Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="loan" items="${loans}">
												<tr>
													<td>${loan.loanId}</td>
													<td>
														<c:choose>
															<c:when test="${not empty loan.accountNumber}">
																${loan.accountNumber}
															</c:when>
															<c:otherwise>
																<em class="text-muted">Not assigned</em>
															</c:otherwise>
														</c:choose>
													</td>
													<td>${loan.loanType}</td>
													<td>
														<fmt:formatNumber value="${loan.amount}"
															type="currency" currencySymbol="₹" maxFractionDigits="2" />
													</td>
													<td>
														<fmt:formatNumber value="${loan.outstandingAmount}"
															type="currency" currencySymbol="₹" maxFractionDigits="2" />
													</td>
													<td>
														<fmt:formatNumber value="${loan.interestRate}"
															maxFractionDigits="2" />%
													</td>
													<td>${loan.tenureMonths}</td>
													<td>
														<fmt:formatDate value="${loan.appliedDate}" pattern="dd-MM-yyyy" />
													</td>
													<td>
														<c:choose>
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
															<c:otherwise>
																<span class="badge text-bg-info">${loan.status}</span>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<a class="btn btn-outline-secondary mt-4"
					href="${pageContext.request.contextPath}/customer/dashboard"><i
					class="fas fa-arrow-left me-2"></i>Back to Dashboard</a>
			</div>
		</main>
	</div>
	<%@ include file="includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
