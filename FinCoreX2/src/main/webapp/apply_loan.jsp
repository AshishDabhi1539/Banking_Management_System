<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Apply for a Loan - FinCoreX</title>
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
				<h3 class="mb-4 text-primary">
					<i class="fas fa-hand-holding-usd me-2"></i>Apply for a Loan
				</h3>

				<!-- Success Message -->
				<c:if test="${param.applied == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Loan application submitted
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<!-- Error messages -->
				<c:if test="${not empty errors}">
					<div class="alert alert-danger">
						<ul>
							<c:forEach var="err" items="${errors}">
								<li>${err}</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>

				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-plus-circle me-2"></i>Loan Application
						</h5>
					</div>
					<div class="card-body">
						<form class="row g-3" method="post"
							action="${pageContext.request.contextPath}/customer/apply_loan">
							<!-- Customer ID (readonly) -->
							<div class="col-md-2">
								<label class="form-label">Customer ID</label> <input
									class="form-control" name="customerId" value="${customerId}"
									readonly>
							</div>

							<!-- Select Account -->
							<div class="col-md-4">
								<label class="form-label">Select Account</label> <select
									class="form-select" name="accountId" id="accountId" required>
									<option value="" disabled
										<c:if test="${empty selId}">selected</c:if>>-- Select
										Account --</option>
									<c:choose>
										<c:when test="${not empty accounts}">
											<c:forEach var="acc" items="${accounts}">
												<option value="${acc.accountId}">
													${acc.accountNumber} - ${acc.accountType}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option value="">No accounts found</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>

							<!-- Loan Type -->
							<div class="col-md-2">
								<label class="form-label">Loan Type</label> <select
									class="form-select" name="loanType" id="loanType" required>
									<option value="" disabled
										<c:if test="${empty selId}">selected</c:if>>-- Select
										Type --</option>
									<option value="PERSONAL">Personal</option>
									<option value="HOME">Home</option>
									<option value="CAR">Car</option>
									<option value="EDUCATION">Education</option>
								</select>
							</div>

							<!-- Amount -->
							<div class="col-md-2">
								<label class="form-label">Amount</label> <input
									class="form-control" type="number" step="0.01" min="1000"
									name="amount" placeholder="Enter Amount" required>
							</div>

							<!-- Interest Rate (auto-filled readonly) -->
							<div class="col-md-2">
								<label class="form-label">Interest Rate (%)</label> <input
									id="interestRate" class="form-control" type="number"
									step="0.01" name="interestRate" readonly required>
							</div>

							<!-- Tenure -->
							<div class="col-md-2">
								<label class="form-label">Tenure (Months)</label> <input
									class="form-control" type="number" min="1" step="1"
									name="tenureMonths" placeholder="Enter Months" required>
							</div>

							<!-- Submit -->
							<div class="col-12">
								<div class="d-flex gap-2">
									<button class="btn btn-primary" type="submit">
										<i class="fas fa-paper-plane me-2"></i>Apply
									</button>
									<a class="btn btn-outline-secondary"
										href="${pageContext.request.contextPath}/customer/dashboard">Back
										to Dashboard</a>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</main>
	</div>

	<%@ include file="includes/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

	<script>
		// interest rates can be tuned here; we use conservative example rates.
		const LOAN_RATES = {
			PERSONAL : 14.0,
			HOME : 9.0,
			CAR : 11.0,
			EDUCATION : 8.0
		};

		function setInterestRate() {
			const loanTypeEl = document.getElementById("loanType");
			const rateEl = document.getElementById("interestRate");
			const rate = LOAN_RATES[loanTypeEl.value] || 0;
			rateEl.value = rate;
		}

		document.getElementById("loanType").addEventListener("change",
				setInterestRate);

		// Initialize on load
		window.addEventListener("load", setInterestRate);
	</script>
</body>
</html>
