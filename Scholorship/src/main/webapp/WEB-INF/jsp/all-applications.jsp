<!DOCTYPE html>
<%@page import="com.usharama.model.Application"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <title>All Applications</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 20px;
            color: #343a40;
        }
        .btn-action {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-container">
            <h1 class="text-center">All Scholarship Applications</h1>
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Student Name</th>
                        <th>Scholarship Name</th>
                        <th>Status</th>
                        <th>Applied Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    ArrayList<Application> applications = (ArrayList<Application>) request.getAttribute("applications");
                    for(Application appl : applications){
                    %>
                        <tr>
                            <td><%= appl.getStudent().getName() %></td>
                            <td><%= appl.getScholarship().getName() %></td>
                            <td><%= appl.getStatus() %></td>
                            <td><%= appl.getAppliedDate() %></td>
                            <td>
                                <% if (!appl.getStatus().equals(Application.ACCEPTED) 
                                      && !appl.getStatus().equals(Application.REJECTED)) { %>
                                    <a href="/admin/applications/accept?id=<%= appl.getId() %>" class="btn btn-success btn-sm btn-action">Accept</a>
                                    <a href="/admin/applications/reject?id=<%= appl.getId() %>" class="btn btn-danger btn-sm btn-action">Reject</a>
                                <% } else { %>
                                    <span class="text-muted">No actions available</span>
                                <% } %>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="text-center">
                <a href="/admin/dashboard" class="btn btn-primary mt-3">Back to Admin Dashboard</a>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
