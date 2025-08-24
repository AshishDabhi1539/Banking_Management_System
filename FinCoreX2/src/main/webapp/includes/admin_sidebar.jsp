<%-- src/main/webapp/WEB-INF/jsp/includes/admin_sidebar.jsp --%>
<nav class="sidebar bg-light p-3" style="width: 250px; min-height: 100vh;">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/dashboard">
                <i class="fas fa-home me-2"></i>Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/customers">
                <i class="fas fa-users me-2"></i>Manage Customers
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fas fa-wallet me-2"></i>Manage Accounts
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/transactions">
                <i class="fas fa-exchange-alt me-2"></i>View Transactions
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/loans">
                <i class="fas fa-hand-holding-usd me-2"></i>Loan Approvals
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/complaints">
                <i class="fas fa-exclamation-circle me-2"></i>Complaints
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/logs">
                <i class="fas fa-file-alt me-2"></i>Activity Logs
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/reports">
                <i class="fas fa-chart-bar me-2"></i>Reports
            </a>
        </li>
    </ul>
</nav>