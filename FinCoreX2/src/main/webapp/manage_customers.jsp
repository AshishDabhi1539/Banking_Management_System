<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Customers - FinCoreX</title>
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
					<i class="fas fa-users me-2"></i>Manage Customers
				</h3>
				<c:if test="${param.created == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Customer created
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${param.updated == '1'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<i class="fas fa-check-circle me-2"></i>Customer updated
						successfully.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${param.deleted == '1'}">
					<div class="alert alert-warning alert-dismissible fade show"
						role="alert">
						<i class="fas fa-exclamation-triangle me-2"></i>Customer deleted.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<div class="card shadow-sm mb-4">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-plus-circle me-2"></i>Add New Customer
						</h5>
					</div>
					<div class="card-body">
						<form class="row g-3" method="post"
							action="${pageContext.request.contextPath}/admin/customer/create">
							<div class="col-md-2">
								<label class="form-label">User ID</label> <input
									class="form-control" name="userId" placeholder="User ID"
									required>
							</div>
							<div class="col-md-3">
								<label class="form-label">Full Name</label> <input
									class="form-control" name="fullName" placeholder="Full Name"
									required>
							</div>
							<div class="col-md-2">
								<label class="form-label">Email</label> <input
									class="form-control" type="email" name="email"
									placeholder="Email" required>
							</div>
							<div class="col-md-2">
								<label class="form-label">Phone</label> <input
									class="form-control" name="phone" placeholder="Phone" required
									pattern="^[0-9\-+()\s]{8,15}$" title="Enter a valid phone">
							</div>
							<div class="col-md-3">
								<label class="form-label">Address</label> <input
									class="form-control" name="address" placeholder="Address">
							</div>
							<div class="col-md-3">
								<label class="form-label">Aadhar No</label> <input
									class="form-control" name="aadhar" placeholder="Aadhar">
							</div>
							<div class="col-md-3">
								<label class="form-label">PAN No</label> <input
									class="form-control" name="pan" placeholder="PAN">
							</div>
							<div class="col-md-3 d-flex align-items-end">
								<button class="btn btn-primary w-100" type="submit">
									<i class="fas fa-plus me-2"></i>Add Customer
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white">
						<h5 class="mb-0">
							<i class="fas fa-list me-2"></i>Customer List
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email</th>
										<th scope="col">Phone</th>
										<th scope="col">Address</th>
										<th scope="col">Aadhar</th>
										<th scope="col">PAN</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${customers}">
										<tr>
											<td>${c.customerId}</td>
											<td>
												<form class="row g-1" method="post"
													action="${pageContext.request.contextPath}/admin/customer/update">
													<input type="hidden" name="customerId"
														value="${c.customerId}">
													<div class="col-12">
														<input class="form-control form-control-sm"
															name="fullName" value="${c.fullName}">
													</div>
											</td>
											<td><input class="form-control form-control-sm"
												type="email" name="email" value="${c.email}"></td>
											<td><input class="form-control form-control-sm"
												name="phone" value="${c.phone}"
												pattern="^[0-9\-+()\s]{8,15}$" title="Enter a valid phone"></td>
											<td><input class="form-control form-control-sm"
												name="address" value="${c.address}"></td>
											<td><input class="form-control form-control-sm"
												name="aadhar" value="${c.aadharNo}"></td>
											<td><input class="form-control form-control-sm"
												name="pan" value="${c.panNo}"></td>
											<td>
												<button class="btn btn-sm btn-primary" type="submit">Save</button>
												</form>
												<form class="d-inline ms-1" method="post"
													action="${pageContext.request.contextPath}/admin/customer/delete">
													<input type="hidden" name="customerId"
														value="${c.customerId}">
													<button class="btn btn-sm btn-danger" type="submit">Delete</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- Pagination Controls -->
							<nav aria-label="Customer Pagination">
								<ul class="pagination">
									<li class="page-item"><a class="page-link"
										href="?page=${param.page > 1 ? param.page - 1 : 1}">Previous</a></li>
									<li class="page-item"><a class="page-link"
										href="?page=${param.page + 1}">Next</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<a class="btn btn-outline-secondary mt-4"
					href="${pageContext.request.contextPath}/admin/dashboard"><i
					class="fas fa-arrow-left me-2"></i>Back</a>
			</div>
		</main>
	</div>
	<%@ include file="includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>