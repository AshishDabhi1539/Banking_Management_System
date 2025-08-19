<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statements - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Account Statement</h3>
  <form class="row g-2 mb-3" method="get" action="${pageContext.request.contextPath}/customer/statements">
    <div class="col-md-3"><input class="form-control" name="accountId" placeholder="Account ID" required></div>
    <div class="col-md-2"><button class="btn btn-primary w-100" type="submit">Load</button></div>
  </form>
  <div class="card p-3">
    <div class="table-responsive">
      <table class="table table-striped table-sm">
        <thead>
          <tr>
            <th>ID</th>
            <th>Account</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${empty transactions}">
            <tr><td colspan="5" class="text-center text-muted">No data loaded. Enter an Account ID above.</td></tr>
          </c:if>
          <c:forEach var="t" items="${transactions}">
            <tr>
              <td>${t.transactionId}</td>
              <td>${t.accountId}</td>
              <td>${t.type}</td>
              <td>${t.amount}</td>
              <td>${t.status}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/customer/dashboard">Back</a>
</div>
</body>
</html>