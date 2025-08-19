<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="min-height: 100vh;">
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="alert alert-danger p-4">
        <h4 class="alert-heading">Something went wrong</h4>
        <p>${errors}</p>
        <hr>
        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/login.jsp">Go Home</a>
      </div>
    </div>
  </div>
  </div>
</body>
</html>