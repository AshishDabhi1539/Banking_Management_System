<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Add Customer</h3>
  <div class="card p-3 mb-3">
    <form class="row g-3" method="post" action="${pageContext.request.contextPath}/admin/customer/create">
      <div class="col-md-3">
        <label class="form-label">User ID</label>
        <input class="form-control" name="userId" placeholder="User ID" required>
      </div>
      <div class="col-md-6">
        <label class="form-label">Full Name</label>
        <input class="form-control" name="fullName" placeholder="Full Name" required>
      </div>
      <div class="col-md-6">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" name="email" placeholder="Email" required>
      </div>
      <div class="col-md-6">
        <label class="form-label">Phone</label>
        <input class="form-control" name="phone" placeholder="Phone" required>
      </div>
      <div class="col-md-12">
        <label class="form-label">Address</label>
        <input class="form-control" name="address" placeholder="Address">
      </div>
      <div class="col-md-6">
        <label class="form-label">Aadhar No</label>
        <input class="form-control" name="aadhar" placeholder="Aadhar No">
      </div>
      <div class="col-md-6">
        <label class="form-label">PAN No</label>
        <input class="form-control" name="pan" placeholder="PAN No">
      </div>
      <div class="col-12 d-flex gap-2 mt-2">
        <button class="btn btn-primary" type="submit">Create Customer</button>
        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/customers">Back</a>
      </div>
    </form>
  </div>
</div>
</body>
</html>