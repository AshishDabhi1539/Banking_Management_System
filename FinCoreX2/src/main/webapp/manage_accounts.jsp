<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Accounts - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Manage Accounts</h3>
  <div class="table-responsive mb-3">
    <table class="table table-striped table-hover align-middle">
      <thead>
        <tr>
          <th>ID</th>
          <th>Customer ID</th>
          <th>Account No</th>
          <th>Type</th>
          <th>Balance</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="a" items="${accounts}">
          <tr>
            <td>${a.accountId}</td>
            <td>${a.customerId}</td>
            <td>${a.accountNumber}</td>
            <td>${a.accountType}</td>
            <td>${a.balance}</td>
            <td>
              <span class="badge text-bg-secondary">${a.status}</span>
            </td>
            <td>
              <form class="d-inline" method="post" action="${pageContext.request.contextPath}/admin/account/status">
                <input type="hidden" name="accountId" value="${a.accountId}">
                <input type="hidden" name="status" value="ACTIVE">
                <button class="btn btn-sm btn-success" type="submit">Activate</button>
              </form>
              <form class="d-inline" method="post" action="${pageContext.request.contextPath}/admin/account/status">
                <input type="hidden" name="accountId" value="${a.accountId}">
                <input type="hidden" name="status" value="BLOCKED">
                <button class="btn btn-sm btn-warning" type="submit">Block</button>
              </form>
              <form class="d-inline" method="post" action="${pageContext.request.contextPath}/admin/account/status">
                <input type="hidden" name="accountId" value="${a.accountId}">
                <input type="hidden" name="status" value="CLOSED">
                <button class="btn btn-sm btn-danger" type="submit">Close</button>
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