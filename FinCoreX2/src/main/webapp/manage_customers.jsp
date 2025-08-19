<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Customers - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Manage Customers</h3>
  <div class="card p-3 mb-3">
    <form class="row g-2" method="post" action="${pageContext.request.contextPath}/admin/customer/create">
      <div class="col-md-2"><input class="form-control" name="userId" placeholder="User ID" required></div>
      <div class="col-md-3"><input class="form-control" name="fullName" placeholder="Full Name" required></div>
      <div class="col-md-2"><input class="form-control" type="email" name="email" placeholder="Email" required></div>
      <div class="col-md-2"><input class="form-control" name="phone" placeholder="Phone" required></div>
      <div class="col-md-3"><input class="form-control" name="address" placeholder="Address"></div>
      <div class="col-md-3"><input class="form-control" name="aadhar" placeholder="Aadhar"></div>
      <div class="col-md-3"><input class="form-control" name="pan" placeholder="PAN"></div>
      <div class="col-md-3"><button class="btn btn-primary w-100" type="submit">Add Customer</button></div>
    </form>
  </div>
  <div class="table-responsive">
    <table class="table table-striped table-hover align-middle">
      <thead>
        <tr>
          <th>ID</th>
          <th>Full Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Address</th>
          <th>Aadhar</th>
          <th>PAN</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="c" items="${customers}">
          <tr>
            <td>${c.customerId}</td>
            <td>${c.fullName}</td>
            <td>${c.email}</td>
            <td>${c.phone}</td>
            <td>${c.address}</td>
            <td>${c.aadharNo}</td>
            <td>${c.panNo}</td>
            <td>
              <form class="d-inline" method="post" action="${pageContext.request.contextPath}/admin/customer/delete">
                <input type="hidden" name="customerId" value="${c.customerId}">
                <button class="btn btn-sm btn-danger" type="submit">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Back</a>
</div>
</body>
</html>