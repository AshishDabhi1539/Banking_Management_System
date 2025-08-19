<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Complaints - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Complaints</h3>
  <c:if test="${param.created == '1'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">Complaint created successfully.
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  </c:if>
  <c:if test="${param.updated == '1'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">Complaint updated successfully.
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  </c:if>
  <div class="card p-3 mb-3">
    <h5>Raise Complaint</h5>
    <form class="row g-2" method="post" action="${pageContext.request.contextPath}/complaint/create">
      <div class="col-md-3"><input class="form-control" name="customerId" placeholder="Customer ID" required pattern="^[0-9]+$" title="Numbers only"></div>
      <div class="col-md-4"><input class="form-control" name="subject" placeholder="Subject" required></div>
      <div class="col-md-5"><input class="form-control" name="message" placeholder="Message" required></div>
      <div class="col-md-2 mt-2"><button class="btn btn-primary w-100" type="submit">Submit</button></div>
    </form>
  </div>
  <div class="card p-3 mb-3">
    <h5>Update Complaint Status</h5>
    <form class="row g-2" method="post" action="${pageContext.request.contextPath}/complaint/update-status">
      <div class="col-md-3"><input class="form-control" name="complaintId" placeholder="Complaint ID" required pattern="^[0-9]+$" title="Numbers only"></div>
      <div class="col-md-3">
        <select class="form-select" name="status">
          <option value="OPEN">OPEN</option>
          <option value="IN_PROGRESS">IN_PROGRESS</option>
          <option value="RESOLVED">RESOLVED</option>
        </select>
      </div>
      <div class="col-md-2"><button class="btn btn-success w-100" type="submit">Update</button></div>
    </form>
  </div>  
  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Back</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>