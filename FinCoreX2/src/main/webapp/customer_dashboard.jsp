<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex">
        <%@ include file="includes/sidebar.jsp" %>
        <main class="flex-grow-1 p-4">
            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-primary"><i class="fas fa-home me-2"></i>Customer Dashboard</h3>
                    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </a>
                </div>

                <!-- Summary Cards -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="card text-bg-primary shadow-sm">
                            <div class="card-body text-center">
                                <h6 class="card-title"><i class="fas fa-wallet me-2"></i>Accounts</h6>
                                <h3 class="card-text">${accountCount}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-bg-success shadow-sm">
                            <div class="card-body text-center">
                                <h6 class="card-title"><i class="fas fa-balance-scale me-2"></i>Total Balance</h6>
                                <h3 class="card-text">₹${totalBalance}</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="row g-3">
                    <div class="col-md-4">
                        <a class="btn btn-primary w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/accounts">
                            <i class="fas fa-wallet me-2"></i>My Accounts
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-primary w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customer/statements">
                            <i class="fas fa-file-alt me-2"></i>Statements
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-primary w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customer/loan_status">
                            <i class="fas fa-hand-holding-usd me-2"></i>My Loans
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-outline-primary w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customer/apply_loan">
                            <i class="fas fa-plus-circle me-2"></i>Apply Loan
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-outline-primary w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customer/repay_loan">
                            <i class="fas fa-money-check-alt me-2"></i>Repay Loan
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-primary w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customer/complaints">
                            <i class="fas fa-exclamation-circle me-2"></i>My Complaints
                        </a>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>