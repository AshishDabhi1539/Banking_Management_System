<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaints - FinCoreX</title>
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
                <h3 class="mb-4 text-primary"><i class="fas fa-exclamation-circle me-2"></i>Complaints</h3>
                <c:if test="${param.created == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Complaint created successfully.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.updated == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Complaint updated successfully.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Raise Complaint</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/complaint/create">
                            <div class="col-md-3">
                                <label class="form-label">Customer ID</label>
                                <input class="form-control" name="customerId" placeholder="Enter Customer ID" required pattern="^[0-9]+$" title="Numbers only">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Subject</label>
                                <input class="form-control" name="subject" placeholder="Enter Subject" required>
                            </div>
                            <div class="col-md-5">
                                <label class="form-label">Message</label>
                                <input class="form-control" name="message" placeholder="Enter Message" required>
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <button class="btn btn-primary w-100" type="submit"><i class="fas fa-paper-plane me-2"></i>Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-edit me-2"></i>Update Complaint Status</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/complaint/update-status">
                            <div class="col-md-3">
                                <label class="form-label">Complaint ID</label>
                                <input class="form-control" name="complaintId" placeholder="Enter Complaint ID" required pattern="^[0-9]+$" title="Numbers only">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Status</label>
                                <select class="form-select" name="status">
                                    <option value="OPEN">Open</option>
                                    <option value="IN_PROGRESS">In Progress</option>
                                    <option value="RESOLVED">Resolved</option>
                                </select>
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <button class="btn btn-success w-100" type="submit"><i class="fas fa-check me-2"></i>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
                <a class="btn btn-outline-secondary mt-4" href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-arrow-left me-2"></i>Back to Dashboard</a>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>