<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - FinCoreX</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #f8f9fc, #e9ecef);
            font-family: 'Segoe UI', sans-serif;
        }

        h3, h4 {
            font-weight: 600;
            color: #2d3748;
        }

        .section-title {
            font-size: 1.25rem;
            color: #4a5568;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .summary-card {
            border-radius: 16px;
            overflow: hidden;
            transition: transform 0.3s ease;
            min-height: 150px;
        }

        .summary-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .summary-icon {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .bg-gradient-primary {
            background: linear-gradient(135deg, #4f46e5, #6d28d9);
            color: white;
        }

        .bg-gradient-success {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
        }

        .quick-action-btn {
            border-radius: 14px;
            font-weight: 500;
            font-size: 1rem;
            padding: 1rem;
            transition: all 0.3s ease;
            min-height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quick-action-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .overview-card {
            border-radius: 14px;
            background: white;
            border: 1px solid #e2e8f0;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .overview-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .overview-icon {
            font-size: 1.8rem;
            color: #4f46e5;
        }

        @media (max-width: 768px) {
            .summary-card, .quick-action-btn, .overview-card {
                min-height: 110px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div class="d-flex">
    <%@ include file="includes/sidebar.jsp" %>

    <main class="flex-grow-1 p-4 bg-light">
        <div class="container-fluid">

            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="text-dark">
                    <i class="fas fa-chart-pie me-2 text-primary"></i>
                    Customer Dashboard
                </h3>
                <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">
                    <i class="fas fa-power-off me-2"></i>Logout
                </a>
            </div>

            <!-- Summary Cards -->
            <h4 class="section-title">Account Summary</h4>
            <div class="row g-4 mb-5">
                <div class="col-md-6">
                    <div class="card bg-gradient-primary summary-card text-white">
                        <div class="card-body text-center">
                            <i class="fas fa-wallet summary-icon"></i>
                            <h5 class="card-title">Number of Accounts</h5>
                            <h2 class="mb-0"><c:out value="${accountCount}" default="0"/></h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-gradient-success summary-card text-white">
                        <div class="card-body text-center">
                            <i class="fas fa-sack-dollar summary-icon"></i>
                            <h5 class="card-title">Total Balance</h5>
                            <h2 class="mb-0">
                                <fmt:formatNumber value="${totalBalance}" type="currency" currencySymbol="₹" maxFractionDigits="2" />
                            </h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <h4 class="section-title">Quick Actions</h4>
            <div class="row g-3 mb-5">
                <div class="col-md-4">
                    <a class="btn btn-success quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/deposit">
                        <i class="fas fa-circle-arrow-up me-2"></i>Make a Deposit
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-warning quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/withdraw">
                        <i class="fas fa-circle-arrow-down me-2"></i>Withdraw Funds
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-info quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/transfer">
                        <i class="fas fa-right-left me-2"></i>Initiate Transfer
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-outline-primary quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/open_account">
                        <i class="fas fa-folder-plus me-2"></i>Open New Account
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-primary quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/loan_status">
                        <i class="fas fa-landmark me-2"></i>View Loan Status
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-danger quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/complaints">
                        <i class="fas fa-headset me-2"></i>Submit Complaint
                    </a>
                </div>
            </div>

            <!-- Overview -->
            <h4 class="section-title">Account Overview</h4>
            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <div class="overview-card">
                        <i class="fas fa-wallet overview-icon"></i>
                        <h5 class="mt-3">View Accounts</h5>
                        <a href="${pageContext.request.contextPath}/account-overview" class="btn btn-outline-primary w-100 mt-2">Explore</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="overview-card">
                        <i class="fas fa-file-invoice-dollar overview-icon"></i>
                        <h5 class="mt-3">View Statements</h5>
                        <a href="${pageContext.request.contextPath}/customer/statements" class="btn btn-outline-primary w-100 mt-2">Explore</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="overview-card">
                        <i class="fas fa-chart-line overview-icon"></i>
                        <h5 class="mt-3">Financial Insights</h5>
                        <a href="#" class="btn btn-outline-primary w-100 mt-2 disabled">Coming Soon</a>
                    </div>
                </div>
            </div>

            <!-- Settings -->
            <h4 class="section-title">Account & Settings</h4>
            <div class="row g-3">
                <div class="col-md-4">
                    <a class="btn btn-outline-dark quick-action-btn w-100" href="${pageContext.request.contextPath}/customer/profile">
                        <i class="fas fa-key me-2"></i>Manage Password
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