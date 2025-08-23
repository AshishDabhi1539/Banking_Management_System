<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Accounts - FinCoreX</title>
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
		<%@ include file="includes/sidebar.jsp"%>
		<main class="flex-grow-1 p-4">
			<div class="container-fluid">
				<!-- Page Title -->
				<h3 class="mb-4 text-primary">
					<i class="fas fa-wallet me-2"></i>My Accounts
				</h3>

				<!-- Success Messages -->
				<c:if test="${param.opened == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Account opened
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${param.success == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Transaction completed
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<!-- Error Message -->
				<c:if test="${not empty error}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<i class="fas fa-exclamation-triangle me-2"></i>${error}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<!-- Accounts List -->
				<div class="card shadow-sm mb-4">
					<div class="card-header bg-success text-white">
						<h5 class="mb-0">
							<i class="fas fa-list me-2"></i>Your Accounts
						</h5>
					</div>
					<div class="card-body">
						<c:if test="${empty accounts}">
							<p class="text-muted">You have no accounts yet. Open one
								below!</p>
							<%
							System.out.println("No accounts found for customerId: " + (session.getAttribute("customer") != null
									? ((com.tss.model.Customer) session.getAttribute("customer")).getCustomerId()
									: "null"));
							%>
						</c:if>
						<c:if test="${not empty accounts}">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>Account Number</th>
											<th>Type</th>
											<th>Balance</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="acc" items="${accounts}">
											<tr>
												<td>${acc.accountId}</td>
												<td><strong>${acc.accountNumber}</strong></td>
												<td>${acc.accountType}</td>
												<td>₹${acc.balance}</td>
												<td><c:choose>
														<c:when test="${acc.status == 'ACTIVE'}">
															<span class="badge text-bg-success">${acc.status}</span>
														</c:when>
														<c:when test="${acc.status == 'CLOSED'}">
															<span class="badge text-bg-secondary">${acc.status}</span>
														</c:when>
														<c:when test="${acc.status == 'BLOCKED'}">
															<span class="badge text-bg-danger">${acc.status}</span>
														</c:when>
														<c:otherwise>
															<span class="badge text-bg-warning">${acc.status}</span>
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
					</div>
				</div>

				<!-- Action Forms Accordion -->
				<div class="accordion" id="accountActions">
					<!-- Open Account -->
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#openAccountForm">
								<i class="fas fa-plus-circle me-2"></i>Open New Account
							</button>
						</h2>
						<div id="openAccountForm" class="accordion-collapse collapse">
							<div class="accordion-body">
								<form class="row g-3" method="post"
									action="${pageContext.request.contextPath}/customer/open-account">
									<div class="col-md-4">
										<label class="form-label">Customer ID</label> <input
											type="text" class="form-control" name="customerId"
											value="${customer.customerId}" readonly>
									</div>
									<div class="col-md-4">
										<label class="form-label">Account Type</label> <select
											class="form-select" name="accountType">
											<option value="SAVINGS">Savings</option>
											<option value="CURRENT">Current</option>
										</select>
									</div>
									<div class="col-md-4 d-flex align-items-end">
										<button class="btn btn-primary w-100" type="submit">
											<i class="fas fa-plus me-2"></i>Open
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- Deposit -->
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#depositForm">
								<i class="fas fa-arrow-up me-2"></i>Deposit
							</button>
						</h2>
						<div id="depositForm" class="accordion-collapse collapse">
							<div class="accordion-body">
								<form class="row g-3" method="post"
									action="${pageContext.request.contextPath}/customer/deposit">
									<div class="col-md-4">
										<label class="form-label">Select Account</label> <select
											class="form-select" name="accountId" required>
											<option value="">-- Select Account --</option>
											<c:forEach var="acc" items="${accounts}">
												<option value="${acc.accountId}">
													${acc.accountNumber} (ID: ${acc.accountId})</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-4">
										<label class="form-label">Amount</label> <input
											class="form-control" type="number" step="0.01" min="0.01"
											name="amount" placeholder="Enter Amount" required>
									</div>
									<div class="col-md-4 d-flex align-items-end">
										<button class="btn btn-success w-100" type="submit">
											<i class="fas fa-arrow-up me-2"></i>Deposit
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- Withdraw -->
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#withdrawForm">
								<i class="fas fa-arrow-down me-2"></i>Withdraw
							</button>
						</h2>
						<div id="withdrawForm" class="accordion-collapse collapse">
							<div class="accordion-body">
								<form class="row g-3" method="post"
									action="${pageContext.request.contextPath}/customer/withdraw">
									<div class="col-md-4">
										<label class="form-label">Select Account</label> <select
											class="form-select" name="accountId" required>
											<option value="">-- Select Account --</option>
											<c:forEach var="acc" items="${accounts}">
												<option value="${acc.accountId}">
													${acc.accountNumber} (ID: ${acc.accountId})</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-4">
										<label class="form-label">Amount</label> <input
											class="form-control" type="number" step="0.01" min="0.01"
											name="amount" placeholder="Enter Amount" required>
									</div>
									<div class="col-md-4 d-flex align-items-end">
										<button class="btn btn-warning w-100" type="submit">
											<i class="fas fa-arrow-down me-2"></i>Withdraw
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- Transfer -->
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#transferForm">
								<i class="fas fa-exchange-alt me-2"></i>Transfer
							</button>
						</h2>
						<div id="transferForm" class="accordion-collapse collapse">
							<div class="accordion-body">
								<form class="row g-3" method="post"
									action="${pageContext.request.contextPath}/customer/transfer">
									<div class="col-md-3">
										<label class="form-label">From Account</label> <select
											class="form-select" name="fromAccountId" required>
											<option value="">-- Select Account --</option>
											<c:forEach var="acc" items="${accounts}">
												<option value="${acc.accountId}">
													${acc.accountNumber} (ID: ${acc.accountId})</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-3">
										<label class="form-label">To Account Number</label> <input
											class="form-control" name="toAccountNumber"
											placeholder="Enter To Account Number" required>
									</div>
									<div class="col-md-3">
										<label class="form-label">Amount</label> <input
											class="form-control" type="number" step="0.01" min="0.01"
											name="amount" placeholder="Enter Amount" required>
									</div>
									<div class="col-md-3 d-flex align-items-end">
										<button class="btn btn-info w-100" type="submit">
											<i class="fas fa-paper-plane me-2"></i>Transfer
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>


					<!-- Back to Dashboard -->
					<a class="btn btn-outline-secondary mt-4"
						href="${pageContext.request.contextPath}/customer/dashboard">
						<i class="fas fa-arrow-left me-2"></i>Back to Dashboard
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