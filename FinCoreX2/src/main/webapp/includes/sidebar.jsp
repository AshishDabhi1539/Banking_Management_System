<%-- src/main/webapp/WEB-INF/jsp/includes/sidebar.jsp --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="sidebar bg-white shadow-sm p-3" style="width: 250px; min-height: 100vh; border-right: 1px solid #e5e7eb;">
    <ul class="nav flex-column">
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center ${fn:endsWith(pageContext.request.requestURI, '/dashboard') ? 'active' : ''}"
               href="${pageContext.request.contextPath}/customer/dashboard">
                <i class="fas fa-chart-pie me-3 opacity-75"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center ${fn:contains(pageContext.request.requestURI, '/accounts') ? 'active' : ''}"
               href="${pageContext.request.contextPath}/accounts">
                <i class="fas fa-building-columns me-3 opacity-75"></i>
                <span>My Accounts</span>
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center"
               href="${pageContext.request.contextPath}/customer/statements">
                <i class="fas fa-file-invoice-dollar me-3 opacity-75"></i>
                <span>Statements</span>
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center"
               href="${pageContext.request.contextPath}/customer/loan_status">
                <i class="fas fa-landmark me-3 opacity-75"></i>
                <span>My Loans</span>
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center"
               href="${pageContext.request.contextPath}/customer/apply_loan">
                <i class="fas fa-file-signature me-3 opacity-75"></i>
                <span>Apply Loan</span>
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center"
               href="${pageContext.request.contextPath}/customer/repay_loan">
                <i class="fas fa-money-bill-wave me-3 opacity-75"></i>
                <span>Repay Loan</span>
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-dark rounded-3 d-flex align-items-center"
               href="${pageContext.request.contextPath}/customer/complaints">
                <i class="fas fa-headset me-3 opacity-75"></i>
                <span>My Complaints</span>
            </a>
        </li>
    </ul>
</nav>

<style>
    .sidebar .nav-link {
        color: #374151;
        font-size: 1rem;
        font-weight: 500;
        padding: 0.75rem 1rem;
        transition: all 0.3s ease;
        border-left: 3px solid transparent;
    }

    .sidebar .nav-link:hover,
    .sidebar .nav-link.active {
        background: #f3f4f6;
        color: #4f46e5;
        border-left: 3px solid #4f46e5;
        transform: translateX(2px);
    }

    .sidebar .nav-link.active {
        font-weight: 600;
    }

    .sidebar .nav-link i {
        width: 24px;
        text-align: center;
    }

    @media (max-width: 768px) {
        .sidebar {
            width: 100%;
            min-height: auto;
            border-right: none;
            border-bottom: 1px solid #e5e7eb;
        }
        .sidebar .nav-link {
            justify-content: center;
            padding: 0.6rem;
            font-size: 0.95rem;
        }
        .sidebar .nav-link span {
            display: none;
        }
        .sidebar .nav-link:hover span {
            display: inline;
        }
    }
</style>