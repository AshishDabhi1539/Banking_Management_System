<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Reports</h3>
  <div class="row g-3">
    <div class="col-12">
      <div class="card p-3">
        <h5>Customers</h5>
        <div class="table-responsive">
          <table class="table table-sm table-striped">
            <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th></tr></thead>
            <tbody>
              <c:forEach var="c" items="${customers}">
                <tr>
                  <td>${c.customerId}</td><td>${c.fullName}</td><td>${c.email}</td><td>${c.phone}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="col-12">
      <div class="card p-3">
        <h5>Accounts</h5>
        <div class="table-responsive">
          <table class="table table-sm table-striped">
            <thead><tr><th>ID</th><th>Customer</th><th>Number</th><th>Type</th><th>Balance</th><th>Status</th></tr></thead>
            <tbody>
              <c:forEach var="a" items="${accounts}">
                <tr>
                  <td>${a.accountId}</td><td>${a.customerId}</td><td>${a.accountNumber}</td><td>${a.accountType}</td><td>${a.balance}</td><td>${a.status}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="col-12">
      <div class="card p-3">
        <h5>Loans</h5>
        <div class="table-responsive">
          <table class="table table-sm table-striped">
            <thead><tr><th>ID</th><th>Customer</th><th>Type</th><th>Amount</th><th>Interest</th><th>Tenure</th><th>Status</th></tr></thead>
            <tbody>
              <c:forEach var="l" items="${loans}">
                <tr>
                  <td>${l.loanId}</td><td>${l.customerId}</td><td>${l.loanType}</td><td>${l.amount}</td><td>${l.interestRate}</td><td>${l.tenureMonths}</td><td>${l.status}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="col-12">
      <div class="card p-3">
        <h5>Complaints</h5>
        <div class="table-responsive">
          <table class="table table-sm table-striped">
            <thead><tr><th>ID</th><th>Customer</th><th>Subject</th><th>Status</th></tr></thead>
            <tbody>
              <c:forEach var="p" items="${complaints}">
                <tr>
                  <td>${p.complaintId}</td><td>${p.customerId}</td><td>${p.subject}</td><td>${p.status}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Back</a>
</div>
</body>
</html>