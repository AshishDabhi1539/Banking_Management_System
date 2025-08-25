<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        .quick-action-btn {
            min-height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 500;
            border-radius: 14px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .quick-action-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .summary-card {
            min-height: 150px;
            border-radius: 14px;
            overflow: hidden;
            transition: transform 0.3s;
        }
        .summary-card:hover {
            transform: translateY(-5px);
        }
        .bg-gradient-primary {
            background: linear-gradient(135deg, #4f46e5, #6b7280);
        }
        .bg-gradient-success {
            background: linear-gradient(135deg, #10b981, #34d399);
        }
        .bg-gradient-warning {
            background: linear-gradient(135deg, #f59e0b, #d97706);
        }
        .bg-gradient-danger {
            background: linear-gradient(135deg, #dc3545, #b02a37);
        }
        h3, h4 {
            font-weight: 600;
            color: #1f2937;
        }
        .overview-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 14px;
            padding: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .overview-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .overview-icon {
            font-size: 1.5rem;
            color: #4f46e5;
        }
        .chart-container {
            max-width: 350px; /* Increased size for better visibility */
            margin: 20px auto;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            border-radius: 12px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.95);
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
            .quick-action-btn, .summary-card, .overview-card {
                min-height: 100px;
            }
            .chart-container {
                max-width: 100%; /* Full width on mobile */
            }
            .chart-row {
                flex-direction: column;
                align-items: center;
            }
            .row > div {
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex flex-grow-1">
        <%@ include file="includes/admin_sidebar.jsp" %>
        <main class="flex-grow-1 p-4 bg-light">
            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-dark"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Admin Dashboard</h3>
                    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout" aria-label="Logout">
                        <i class="fas fa-power-off me-2"></i>Logout
                    </a>
                </div>

                <!-- Summary Cards -->
                <h4 class="mb-3 text-muted">Admin Summary</h4>
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="card bg-gradient-primary text-white summary-card">
                            <div class="card-body text-center">
                                <h6 class="card-title"><i class="fas fa-users me-2"></i>Customers</h6>
                                <h3 class="card-text"><c:out value="${summary.customers != null ? summary.customers : 0}" /></h3>
                                <p class="text-white-50 mb-0">Active Users</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-gradient-success text-white summary-card">
                            <div class="card-body text-center">
                                <h6 class="card-title"><i class="fas fa-wallet me-2"></i>Accounts</h6>
                                <h3 class="card-text"><c:out value="${summary.accounts != null ? summary.accounts : 0}" /></h3>
                                <p class="text-white-50 mb-0">Total Accounts</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-gradient-warning text-white summary-card">
                            <div class="card-body text-center">
                                <h6 class="card-title"><i class="fas fa-exchange-alt me-2"></i>Transactions</h6>
                                <h3 class="card-text"><c:out value="${summary.transactions != null ? summary.transactions : 0}" /></h3>
                                <p class="text-white-50 mb-0">Recent Transactions</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-gradient-danger text-white summary-card">
                            <div class="card-body text-center">
                                <h6 class="card-title"><i class="fas fa-hand-holding-usd me-2"></i>Loans</h6>
                                <h3 class="card-text"><c:out value="${summary.loans != null ? summary.loans : 0}" /></h3>
                                <p class="text-white-50 mb-0"><c:out value="${summary.pendingLoans != null ? summary.pendingLoans : 0}" /> Pending</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts Section -->
                <h4 class="mt-5 mb-3 text-muted">Analytics Overview</h4>
                <div class="row g-4">
                    <div class="col-12">
                        <div class="card shadow-sm">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0"><i class="fas fa-chart-pie me-2"></i>Visual Insights</h5>
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
                <h4 class="mt-5 mb-3 text-muted">Quick Actions</h4>
                <div class="row g-3">
                    <div class="col-md-4">
                        <a class="btn btn-primary quick-action-btn w-100" href="${pageContext.request.contextPath}/admin/customers" aria-label="Manage customers">
                            <i class="fas fa-users me-2"></i>Manage Customers
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-success quick-action-btn w-100" href="${pageContext.request.contextPath}/admin/accounts" aria-label="Manage accounts">
                            <i class="fas fa-wallet me-2"></i>Manage Accounts
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-warning quick-action-btn w-100" href="${pageContext.request.contextPath}/admin/transactions" aria-label="View transactions">
                            <i class="fas fa-exchange-alt me-2"></i>View Transactions
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-danger quick-action-btn w-100" href="${pageContext.request.contextPath}/admin/loans" aria-label="Manage loans">
                            <i class="fas fa-hand-holding-usd me-2"></i>Loan Approvals
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-info quick-action-btn w-100" href="${pageContext.request.contextPath}/admin/complaints" aria-label="Manage complaints">
                            <i class="fas fa-exclamation-circle me-2"></i>Manage Complaints
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-secondary quick-action-btn w-100" href="${pageContext.request.contextPath}/admin/logs" aria-label="View activity logs">
                            <i class="fas fa-file-alt me-2"></i>View Activity Logs
                        </a>
                    </div>
                </div>

                <!-- Last Updated Time -->
                <p class="updated-time text-center mt-3">
                    Last updated: <fmt:formatDate value="<%= new java.util.Date() %>" pattern="dd-MM-yyyy HH:mm:ss z" />
                </p>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script>
        // Initialize tooltips
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        [...tooltipTriggerList].map(el => new bootstrap.Tooltip(el));

        // Customer Status Chart with enhanced styling
        new Chart(document.getElementById('customerStatusChart').getContext('2d'), {
            type: 'doughnut',
            data: {
                labels: ['Active', 'Blocked'],
                datasets: [{
                    data: [
                        ${summary.customers != null ? summary.customers : 0} - ${summary.blockedCustomers != null ? summary.blockedCustomers : 0},
                        ${summary.blockedCustomers != null ? summary.blockedCustomers : 0}
                    ],
                    backgroundColor: ['rgba(40, 167, 69, 0.8)', 'rgba(220, 53, 69, 0.8)'],
                    borderWidth: 2,
                    borderColor: '#fff',
                    hoverBackgroundColor: ['rgba(40, 167, 69, 1)', 'rgba(220, 53, 69, 1)'],
                    hoverBorderColor: '#ddd'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#1f2937',
                            font: { size: 14, weight: 'bold' }
                        }
                    },
                    tooltip: {
                        enabled: true,
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#4f46e5',
                        borderWidth: 1
                    }
                }
            }
        });

        // Account Status Chart with enhanced styling
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
                    backgroundColor: ['rgba(40, 167, 69, 0.8)', 'rgba(108, 117, 125, 0.8)', 'rgba(220, 53, 69, 0.8)'],
                    borderWidth: 2,
                    borderColor: '#fff',
                    hoverBackgroundColor: ['rgba(40, 167, 69, 1)', 'rgba(108, 117, 125, 1)', 'rgba(220, 53, 69, 1)'],
                    hoverBorderColor: '#ddd'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#1f2937',
                            font: { size: 14, weight: 'bold' }
                        }
                    },
                    tooltip: {
                        enabled: true,
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#10b981',
                        borderWidth: 1
                    }
                }
            }
        });

        // Transaction Type Chart with enhanced styling
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
                    backgroundColor: ['rgba(40, 167, 69, 0.8)', 'rgba(220, 53, 69, 0.8)', 'rgba(255, 193, 7, 0.8)'],
                    borderWidth: 2,
                    borderColor: '#fff',
                    hoverBackgroundColor: ['rgba(40, 167, 69, 1)', 'rgba(220, 53, 69, 1)', 'rgba(255, 193, 7, 1)'],
                    hoverBorderColor: '#ddd'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#1f2937',
                            font: { size: 14, weight: 'bold' }
                        }
                    },
                    tooltip: {
                        enabled: true,
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#f59e0b',
                        borderWidth: 1
                    }
                }
            }
        });

        // Loan Status Chart with enhanced styling
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
                    backgroundColor: ['rgba(255, 193, 7, 0.8)', 'rgba(40, 167, 69, 0.8)', 'rgba(220, 53, 69, 0.8)', 'rgba(108, 117, 125, 0.8)'],
                    borderWidth: 2,
                    borderColor: '#fff',
                    hoverBackgroundColor: ['rgba(255, 193, 7, 1)', 'rgba(40, 167, 69, 1)', 'rgba(220, 53, 69, 1)', 'rgba(108, 117, 125, 1)'],
                    hoverBorderColor: '#ddd'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#1f2937',
                            font: { size: 14, weight: 'bold' }
                        }
                    },
                    tooltip: {
                        enabled: true,
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#dc3545',
                        borderWidth: 1
                    }
                }
            }
        });

        // Complaint Status Chart with enhanced styling
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
                    backgroundColor: ['rgba(255, 193, 7, 0.8)', 'rgba(23, 162, 184, 0.8)', 'rgba(40, 167, 69, 0.8)'],
                    borderWidth: 2,
                    borderColor: '#fff',
                    hoverBackgroundColor: ['rgba(255, 193, 7, 1)', 'rgba(23, 162, 184, 1)', 'rgba(40, 167, 69, 1)'],
                    hoverBorderColor: '#ddd'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#1f2937',
                            font: { size: 14, weight: 'bold' }
                        }
                    },
                    tooltip: {
                        enabled: true,
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#17a2b8',
                        borderWidth: 1
                    }
                }
            }
        });

        // Daily Activity Bar Chart with enhanced styling
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
                    backgroundColor: 'rgba(79, 70, 229, 0.8)',
                    borderColor: '#fff',
                    borderWidth: 2,
                    borderRadius: 5,
                    barThickness: 20,
                    hoverBackgroundColor: 'rgba(79, 70, 229, 1)'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                animation: {
                    duration: 2000,
                    easing: 'easeInOutQuad'
                },
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        enabled: true,
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#4f46e5',
                        borderWidth: 1
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: { display: true, text: 'Number of Activities', color: '#1f2937', font: { size: 14 } },
                        grid: { color: 'rgba(0, 0, 0, 0.1)' }
                    },
                    x: {
                        title: { display: true, text: 'Time Period', color: '#1f2937', font: { size: 14 } },
                        grid: { color: 'rgba(0, 0, 0, 0.1)' }
                    }
                }
            }
        });
    </script>
</body>
</html>