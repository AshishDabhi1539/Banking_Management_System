<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reports - FinCoreX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<style>
.chart-container {
	max-width: 500px;
	margin: 20px auto;
}

.loading {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000;
	background: rgba(255, 255, 255, 0.9);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.invalid-feedback {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="includes/header.jsp"%>
	<div class="d-flex">
		<%@ include file="includes/admin_sidebar.jsp"%>
		<main class="flex-grow-1 p-4">
			<div class="container-fluid">
				<h3 class="mb-4 text-primary">
					<i class="fas fa-chart-bar me-2"></i>Reports
				</h3>

				<!-- Report Form -->
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-file-alt me-2"></i>Generate Report
						</h5>
					</div>
					<div class="card-body">
						<form class="row g-3" id="reportForm" method="post"
							action="${pageContext.request.contextPath}/admin/reports"
							novalidate>
							<div class="col-md-4">
								<label class="form-label">Report Type</label> <select
									class="form-select" name="reportType" required>
									<option value="">Select Type</option>
									<option value="MONTHLY">Monthly</option>
									<option value="ANNUAL">Annual</option>
								</select>
								<div class="invalid-feedback">Please select a report type.</div>
							</div>
							<div class="col-md-4">
								<label class="form-label">Date</label>
								<fmt:formatDate value="<%=new java.util.Date()%>"
									pattern="yyyy-MM-dd" var="today" />
								<input class="form-control" type="date" name="date"
									id="reportDate" required max="${today}">
								<div class="invalid-feedback">Please select a valid date.</div>
							</div>
							<div class="col-md-4 d-flex align-items-end">
								<button class="btn btn-primary w-100" type="submit"
									id="generateBtn">
									<i class="fas fa-download me-2"></i>Generate
								</button>
							</div>
						</form>
					</div>
				</div>

				<!-- Generated Report -->
				<c:if test="${not empty report}">
					<div class="card shadow-sm mt-4">
						<div
							class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
							<h5 class="mb-0">
								<i class="fas fa-chart-pie me-2"></i>Generated Report
							</h5>

							<!-- ✅ Download Button -->
							<a class="btn btn-success btn-sm"
								href="${pageContext.request.contextPath}/admin/reports/download?date=${param.date}&reportType=${param.reportType}">
								<i class="fas fa-file-pdf me-2"></i>Download PDF
							</a>
						</div>
						<div class="card-body">
							<p>
								<strong>Total Transactions:</strong> ${report.totalTransactions}
							</p>
							<p>
								<strong>Total Amount:</strong>
								<fmt:formatNumber value="${report.totalAmount}" type="currency"
									currencySymbol="₹" />
							</p>
							<p>
								<strong>Date Range:</strong> ${report.dateRange}
							</p>
							<p>
								<strong>Deposits:</strong> ${report.deposits} (
								<fmt:formatNumber value="${report.depositAmount}"
									type="currency" currencySymbol="₹" />
								)
							</p>
							<p>
								<strong>Withdrawals:</strong> ${report.withdrawals} (
								<fmt:formatNumber value="${report.withdrawalAmount}"
									type="currency" currencySymbol="₹" />
								)
							</p>
							<p>
								<strong>Transfers:</strong> ${report.transfers} (
								<fmt:formatNumber value="${report.transferAmount}"
									type="currency" currencySymbol="₹" />
								)
							</p>
							<div class="chart-container">
								<canvas id="transactionChart"></canvas>
							</div>
						</div>
					</div>
				</c:if>


				<!-- Error -->
				<c:if test="${not empty error}">
					<div class="alert alert-danger mt-4">${error}</div>
				</c:if>

				<a class="btn btn-outline-secondary mt-4"
					href="${pageContext.request.contextPath}/admin/dashboard"> <i
					class="fas fa-arrow-left me-2"></i>Back to Dashboard
				</a>
			</div>
		</main>
	</div>

	<%@ include file="includes/footer.jsp"%>

	<div class="loading text-center" id="loading">
		<i class="fas fa-spinner fa-spin fa-3x"></i><br>Generating
		Report...
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
	<script>
    // Form validation
    (function() {
        'use strict';
        const form = document.getElementById('reportForm');
        form.addEventListener('submit', function(event) {
            const loading = document.getElementById('loading');
            const generateBtn = document.getElementById('generateBtn');
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
                form.querySelectorAll('.invalid-feedback').forEach(feedback => feedback.style.display = 'block');
            } else {
                loading.style.display = 'block';
                generateBtn.disabled = true;
            }
            form.classList.add('was-validated');
        }, false);
    })();

    // Chart initialization
    <c:if test="${not empty report}">
    new Chart(document.getElementById('transactionChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: ['Deposits', 'Withdrawals', 'Transfers'],
            datasets: [{
                label: 'Transaction Amount (₹)',
                data: [
                    ${report.depositAmount},
                    ${report.withdrawalAmount},
                    ${report.transferAmount}
                ],
                backgroundColor: ['#28a745', '#dc3545', '#ffc107'],
                borderWidth: 1,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'top' }, tooltip: { enabled: true } },
            scales: { y: { beginAtZero: true, title: { display: true, text: 'Amount (₹)' } } }
        }
    });
    </c:if>
</script>
</body>
</html>