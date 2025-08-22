<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Statements - FinCoreX</title>
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
					<i class="fas fa-file-alt me-2"></i>Statements
				</h3>
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-list me-2"></i>Transaction History
						</h5>
					</div>
					<div class="card-body">
						<form class="row g-3 mb-4" method="get"
							action="${pageContext.request.contextPath}/customer/statements">
							<div class="col-md-4">
								<label class="form-label">Account ID</label> <input
									class="form-control" name="accountId"
									placeholder="Enter Account ID" required pattern="^[0-9]+$"
									title="Numbers only">
							</div>
							<div class="col-md-4 d-flex align-items-end">
								<button class="btn btn-primary w-100" type="submit">
									<i class="fas fa-search me-2"></i>View Statements
								</button>
							</div>
						</form>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Transaction ID</th>
									<th scope="col">Date</th>
									<th scope="col">Type</th>
									<th scope="col">Amount</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="transaction" items="${transactions}">
									<tr>
										<td>${transaction.transactionId}</td>
										<td>${transaction.transactionDate}</td>
										<td>${transaction.type}</td>
										<td>${transaction.amount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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