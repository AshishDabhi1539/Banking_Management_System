<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Accounts - FinCoreX</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="includes/header.jsp"%>
	<div class="d-flex">
		<%@ include file="includes/admin_sidebar.jsp"%>

		<main class="flex-grow-1 p-4">
			<div class="container-fluid">

				<!-- Page Title -->
				<h3 class="mb-4 text-primary">
					<i class="fas fa-wallet me-2"></i>Manage Accounts
				</h3>

				<!-- Success Alert -->
				<c:if test="${param.updated == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Account status updated
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
					</div>
				</c:if>

				<!-- Update Form -->
				<div class="card shadow-sm mb-4">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-edit me-2"></i>Update Account Status
						</h5>
					</div>
					<div class="card-body">
						<form class="row g-3" method="post"
							action="${pageContext.request.contextPath}/admin/account/update-status">
							<div class="col-md-4">
								<label class="form-label">Account ID</label> <select
									class="form-select" name="accountId" id="accountSelect"
									required>
									<option value="" disabled selected>Select Account</option>
									<c:forEach var="account" items="${accounts}">
										<c:if test="${account.status != 'CLOSED'}">
											<option value="${account.accountId}"
												data-status="${account.status}">
												#${account.accountId} - ${account.accountType}
												(${account.status})</option>
										</c:if>
									</c:forEach>
								</select>
							</div>

							<div class="col-md-4">
								<label class="form-label">New Status</label> <select
									class="form-select" name="status" id="statusSelect" disabled
									required>
									<option value="" selected>Select Status</option>
								</select>
							</div>

							<div class="col-md-4 d-flex align-items-end">
								<button class="btn btn-success w-100" type="submit"
									id="submitBtn" disabled>
									<i class="fas fa-check me-2"></i>Update
								</button>
							</div>
						</form>
					</div>
				</div>

				<!-- Account List -->
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-list me-2"></i>Account List
						</h5>
					</div>
					<div class="card-body">
						<table class="table table-hover align-middle">
							<thead class="table-light">
								<tr>
									<th>Account ID</th>
									<th>Customer ID</th>
									<th>Account Type</th>
									<th>Balance</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="account" items="${accounts}">
									<tr>
										<td><strong>#${account.accountId}</strong></td>
										<td>${account.customerId}</td>
										<td>${account.accountType}</td>
										<td>₹${account.balance}</td>
										<td><c:choose>
												<c:when test="${account.status == 'ACTIVE'}">
													<span class="badge text-bg-success">Active</span>
												</c:when>
												<c:when test="${account.status == 'BLOCKED'}">
													<span class="badge text-bg-danger">Blocked</span>
												</c:when>
												<c:when test="${account.status == 'CLOSED'}">
													<span class="badge text-bg-secondary">Closed</span>
												</c:when>
											</c:choose></td>
										<td>
											<button type="button" class="btn btn-sm btn-outline-primary"
												data-bs-toggle="modal" data-bs-target="#accountModal"
												data-id="${account.accountId}"
												data-customer="${account.customerId}"
												data-name="${account.customerName}"
												data-number="${account.accountNumber}"
												data-type="${account.accountType}"
												data-balance="${account.balance}"
												data-status="${account.status}"
												data-date="${account.createdAt}">
												<i class="fas fa-eye"></i> View
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- Empty state -->
						<c:if test="${empty accounts}">
							<div class="alert alert-info text-center">
								<i class="fas fa-info-circle me-2"></i>No accounts found.
							</div>
						</c:if>
					</div>
				</div>

				<!-- Back -->
				<a class="btn btn-outline-secondary mt-4"
					href="${pageContext.request.contextPath}/admin/dashboard"> <i
					class="fas fa-arrow-left me-2"></i>Back to Dashboard
				</a>
			</div>
		</main>
	</div>

	<%@ include file="includes/footer.jsp"%>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Dynamic Status Logic -->
	<script>
		const accountSelect = document.getElementById("accountSelect");
		const statusSelect = document.getElementById("statusSelect");
		const submitBtn = document.getElementById("submitBtn");

		function resetStatusDropdown() {
			statusSelect.innerHTML = "<option value='' disabled selected>Select Status</option>";
			statusSelect.disabled = true;
			submitBtn.disabled = true;
		}

		resetStatusDropdown();

		accountSelect.addEventListener("change", function() {
			resetStatusDropdown();
			const selected = this.options[this.selectedIndex];
			if (!selected)
				return;

			const currentStatus = selected.getAttribute("data-status");
			if (currentStatus === "ACTIVE") {
				addOption("BLOCKED", "Blocked");
				addOption("CLOSED", "Closed");
			} else if (currentStatus === "BLOCKED") {
				addOption("ACTIVE", "Active");
				addOption("CLOSED", "Closed");
			}

			if (statusSelect.options.length > 1) {
				statusSelect.disabled = false;
			}
		});

		statusSelect.addEventListener("change", function() {
			submitBtn.disabled = !this.value;
		});

		function addOption(value, text) {
			const option = document.createElement("option");
			option.value = value;
			option.textContent = text;
			statusSelect.appendChild(option);
		}
	</script>

	<!-- Account Detail Modal -->
	<div class="modal fade" id="accountModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title">Account Details</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<p>
						<strong>Account ID:</strong> <span id="modal-id"></span>
					</p>
					<p>
						<strong>Customer ID:</strong> <span id="modal-customer"></span>
					</p>
					<p>
						<strong>Customer Name:</strong> <span id="modal-name"></span>
					</p>
					<p>
						<strong>Account Number:</strong> <span id="modal-number"></span>
					</p>
					<p>
						<strong>Account Type:</strong> <span id="modal-type"></span>
					</p>
					<p>
						<strong>Status:</strong> <span id="modal-status"></span>
					</p>
					<p>
						<strong>Balance:</strong> ₹<span id="modal-balance"></span>
					</p>
					<p>
						<strong>Opening Date:</strong> <span id="modal-date"></span>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		const accountModal = document.getElementById('accountModal');
		accountModal.addEventListener('show.bs.modal', function(event) {
			const button = event.relatedTarget;
			document.getElementById('modal-id').textContent = button
					.getAttribute('data-id');
			document.getElementById('modal-customer').textContent = button
					.getAttribute('data-customer');
			document.getElementById('modal-name').textContent = button
					.getAttribute('data-name');
			document.getElementById('modal-number').textContent = button
					.getAttribute('data-number');
			document.getElementById('modal-type').textContent = button
					.getAttribute('data-type');
			document.getElementById('modal-status').textContent = button
					.getAttribute('data-status');
			document.getElementById('modal-balance').textContent = button
					.getAttribute('data-balance');
			document.getElementById('modal-date').textContent = button
					.getAttribute('data-date');
		});
	</script>
</body>
</html>
