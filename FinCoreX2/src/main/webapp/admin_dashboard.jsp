<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex">
        <%@ include file="includes/admin_sidebar.jsp" %>
        <main class="flex-grow-1 p-4">
            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-primary"><i class="fas fa-home me-2"></i>Admin Dashboard</h3>
                    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                </div>
                <div class="row g-3">
                    <div class="col-md-3">
                        <div class="card text-bg-primary shadow-sm">
                            <div class="card-body">
                                <h6 class="card-title"><i class="fas fa-users me-2"></i>Customers</h6>
                                <h3 class="card-text">${summary.customers}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-bg-success shadow-sm">
                            <div class="card-body">
                                <h6 class="card-title"><i class="fas fa-wallet me-2"></i>Accounts</h6>
                                <h3 class="card-text">${summary.accounts}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-bg-warning shadow-sm">
                            <div class="card-body">
                                <h6 class="card-title"><i class="fas fa-exchange-alt me-2"></i>Transactions</h6>
                                <h3 class="card-text">${summary.transactions}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-bg-danger shadow-sm">
                            <div class="card-body">
                                <h6 class="card-title"><i class="fas fa-hand-holding-usd me-2"></i>Loans</h6>
                                <h3 class="card-text">${summary.loans}</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-4 d-flex flex-wrap gap-2">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/customers"><i class="fas fa-users me-2"></i>Manage Customers</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/accounts"><i class="fas fa-wallet me-2"></i>Manage Accounts</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/transactions"><i class="fas fa-exchange-alt me-2"></i>View Transactions</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/loans"><i class="fas fa-hand-holding-usd me-2"></i>Loan Approvals</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/complaints"><i class="fas fa-exclamation-circle me-2"></i>Complaints</a>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/logs"><i class="fas fa-file-alt me-2"></i>Activity Logs</a>
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/reports"><i class="fas fa-chart-bar me-2"></i>Reports</a>
                </div>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>