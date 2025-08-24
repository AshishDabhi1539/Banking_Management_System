<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - FinCoreX</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <!-- Inline Dashboard Styles -->
    <style>
        .dashboard-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
            background: linear-gradient(135deg, #4f46e5, #6b21a8);
            color: white;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .loan-progress {
            height: 10px;
            border-radius: 5px;
            background: #e9ecef;
            overflow: hidden;
        }

        .loan-progress-bar {
            height: 100%;
            border-radius: 5px;
            transition: width 0.3s ease;
            background: #de64f4;
        }

        .chart-container {
            max-width: 300px;
            margin: 20px auto;
        }

        .chart-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .updated-time {
            font-size: 0.8rem;
            color: #6c757d;
        }

        @media (max-width: 768px) {
            .chart-row {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div class="d-flex">
    <%@ include file="includes/admin_sidebar.jsp" %>

    <main class="flex-grow-1 p-4">
        <div class="container-fluid">

            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="mb-0 text-primary">
                    <i class="fas fa-tachometer-alt me-2"></i>
                    Admin Dashboard
                    <small class="text-muted">Welcome, ${sessionScope[Constants.SESSION_USER].fullName}!</small>
                </h3>
                <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout" data-bs-toggle="tooltip" title="Sign out">
                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                </a>
            </div>

            <!-- Summary Cards -->
            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="card dashboard-card text-bg-primary">
                        <div class="card-body text-center">
                            <h6 class="card-title"><i class="fas fa-users me-2"></i>Customers</h6>
                            <h3 class="card-text">${summary.customers != null ? summary.customers : 0}</h3>
                            <p class="text-white-50 mb-0">Active Users</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card dashboard-card text-bg-success">
                        <div class="card-body text-center">
                            <h6 class="card-title"><i class="fas fa-wallet me-2"></i>Accounts</h6>
                            <h3 class="card-text">${summary.accounts != null ? summary.accounts : 0}</h3>
                            <p class="text-white-50 mb-0">Total Accounts</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card dashboard-card text-bg-warning">
                        <div class="card-body text-center">
                            <h6 class="card-title"><i class="fas fa-exchange-alt me-2"></i>Transactions</h6>
                            <h3 class="card-text">${summary.transactions != null ? summary.transactions : 0}</h3>
                            <p class="text-white-50 mb-0">Recent Transactions</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card dashboard-card text-bg-danger">
                        <div class="card-body text-center">
                            <h6 class="card-title"><i class="fas fa-hand-holding-usd me-2"></i>Loans</h6>
                            <h3 class="card-text">${summary.loans != null ? summary.loans : 0}</h3>
                            <div class="loan-progress mt-2">
                                <div class="loan-progress-bar"
                                     style="width: ${summary.pendingLoans != null && summary.loans > 0 ? (summary.pendingLoans * 100 / summary.loans) : 0}%;"></div>
                            </div>
                            <p class="text-white-50 mb-0 small">${summary.pendingLoans != null ? summary.pendingLoans : 0} Pending</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="row g-4">
                <div class="col-12">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-chart-pie me-2"></i>Overviews</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-row">

                                <!-- Customer Status -->
                                <div class="card glass-card">
                                    <div class="card-header bg-primary text-white">
                                        <h6 class="mb-0">Customer Status</h6>
                                    </div>
                                    <div class="card-body chart-container">
                                        <canvas id="customerStatusChart"></canvas>
                                    </div>
                                </div>

                                <!-- Account Status -->
                                <div class="card glass-card">
                                    <div class="card-header bg-success text-white">
                                        <h6 class="mb-0">Account Status</h6>
                                    </div>
                                    <div class="card-body chart-container">
                                        <canvas id="accountStatusChart"></canvas>
                                    </div>
                                </div>

                                <!-- Transaction Types -->
                                <div class="card glass-card">
                                    <div class="card-header bg-warning text-white">
                                        <h6 class="mb-0">Transaction Types</h6>
                                    </div>
                                    <div class="card-body chart-container">
                                        <canvas id="transactionTypeChart"></canvas>
                                    </div>
                                </div>

                                <!-- Loan Status -->
                                <div class="card glass-card">
                                    <div class="card-header bg-danger text-white">
                                        <h6 class="mb-0">Loan Status</h6>
                                    </div>
                                    <div class="card-body chart-container">
                                        <canvas id="loanStatusChart"></canvas>
                                    </div>
                                </div>

                                <!-- Complaint Status -->
                                <div class="card glass-card">
                                    <div class="card-header bg-info text-white">
                                        <h6 class="mb-0">Complaint Status</h6>
                                    </div>
                                    <div class="card-body chart-container">
                                        <canvas id="complaintStatusChart"></canvas>
                                    </div>
                                </div>

                                <!-- Daily Activity -->
                                <div class="card glass-card">
                                    <div class="card-header bg-secondary text-white">
                                        <h6 class="mb-0">Daily Activity</h6>
                                    </div>
                                    <div class="card-body chart-container">
                                        <canvas id="activityLogChart"></canvas>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="mt-4 d-flex flex-wrap gap-2">
                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/admin/customers" data-bs-toggle="tooltip" title="Manage customer profiles">
                    <i class="fas fa-users me-2"></i>Manage Customers
                </a>
                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/admin/accounts" data-bs-toggle="tooltip" title="Manage bank accounts">
                    <i class="fas fa-wallet me-2"></i>Manage Accounts
                </a>
                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/admin/transactions" data-bs-toggle="tooltip" title="View transaction history">
                    <i class="fas fa-exchange-alt me-2"></i>View Transactions
                </a>
                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/admin/loans" data-bs-toggle="tooltip" title="Approve or reject loans">
                    <i class="fas fa-hand-holding-usd me-2"></i>Loan Approvals
                </a>
                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/admin/complaints" data-bs-toggle="tooltip" title="Handle customer complaints">
                    <i class="fas fa-exclamation-circle me-2"></i>Complaints
                </a>
                <a class="btn btn-secondary btn-lg" href="${pageContext.request.contextPath}/admin/logs" data-bs-toggle="tooltip" title="View activity logs">
                    <i class="fas fa-file-alt me-2"></i>Activity Logs
                </a>
                <a class="btn btn-outline-primary btn-lg" href="${pageContext.request.contextPath}/admin/reports" data-bs-toggle="tooltip" title="Generate financial reports">
                    <i class="fas fa-chart-bar me-2"></i>Reports
                </a>
            </div>

            <!-- Last Updated Time -->
            <p class="updated-time text-center mt-3">
                Last updated: <fmt:formatDate value="<%= new java.util.Date() %>" pattern="dd-MM-yyyy HH:mm:ss z" />
            </p>

        </div>
    </main>
</div>

<%@ include file="includes/footer.jsp" %>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

<script>
    // Initialize tooltips
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    [...tooltipTriggerList].map(el => new bootstrap.Tooltip(el));

    // Customer Status Chart
    new Chart(document.getElementById('customerStatusChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ['Active', 'Blocked'],
            datasets: [{
                data: [
                    ${summary.customers != null ? summary.customers : 0} - ${summary.blockedCustomers != null ? summary.blockedCustomers : 0},
                    ${summary.blockedCustomers != null ? summary.blockedCustomers : 0}
                ],
                backgroundColor: ['#28a745', '#dc3545'],
                borderWidth: 1,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    // Account Status Chart
    new Chart(document.getElementById('accountStatusChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ['Active', 'Closed', 'Blocked'],
            datasets: [{
                data: [
                    ${summary.accounts != null ? summary.accounts : 0} - ${summary.closedAccounts != null ? summary.closedAccounts : 0} - ${summary.blockedAccounts != null ? summary.blockedAccounts : 0},
                    ${summary.closedAccounts != null ? summary.closedAccounts : 0},
                    ${summary.blockedAccounts != null ? summary.blockedAccounts : 0}
                ],
                backgroundColor: ['#28a745', '#6c757d', '#dc3545'],
                borderWidth: 1,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    // Transaction Type Chart
    new Chart(document.getElementById('transactionTypeChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ['Deposit', 'Withdraw', 'Transfer'],
            datasets: [{
                data: [
                    ${summary.deposits != null ? summary.deposits : 0},
                    ${summary.withdrawals != null ? summary.withdrawals : 0},
                    ${summary.transfers != null ? summary.transfers : 0}
                ],
                backgroundColor: ['#28a745', '#dc3545', '#ffc107'],
                borderWidth: 1,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    // Loan Status Chart
    new Chart(document.getElementById('loanStatusChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ['Pending', 'Approved', 'Rejected', 'Closed'],
            datasets: [{
                data: [
                    ${summary.pendingLoans != null ? summary.pendingLoans : 0},
                    ${summary.approvedLoans != null ? summary.approvedLoans : 0},
                    ${summary.rejectedLoans != null ? summary.rejectedLoans : 0},
                    ${summary.closedLoans != null ? summary.closedLoans : 0}
                ],
                backgroundColor: ['#ffc107', '#28a745', '#dc3545', '#6c757d'],
                borderWidth: 1,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    // Complaint Status Chart
    new Chart(document.getElementById('complaintStatusChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ['Open', 'In Progress', 'Resolved'],
            datasets: [{
                data: [
                    ${summary.openComplaints != null ? summary.openComplaints : 0},
                    ${summary.inProgressComplaints != null ? summary.inProgressComplaints : 0},
                    ${summary.resolvedComplaints != null ? summary.resolvedComplaints : 0}
                ],
                backgroundColor: ['#ffc107', '#17a2b8', '#28a745'],
                borderWidth: 1,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    // Daily Activity Bar Chart
    new Chart(document.getElementById('activityLogChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: ['Today', 'Yesterday', 'Last 7 Days'],
            datasets: [{
                label: 'Activities',
                data: [
                    ${summary.todayActivities != null ? summary.todayActivities : 0},
                    ${summary.yesterdayActivities != null ? summary.yesterdayActivities : 0},
                    ${summary.weekActivities != null ? summary.weekActivities : 0}
                ],
                backgroundColor: '#4f46e5',
                borderColor: '#ffffff',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: { enabled: true }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Number of Activities' }
                }
            }
        }
    });
</script>

</body>
</html>