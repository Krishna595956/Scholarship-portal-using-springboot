<!DOCTYPE html>
<%@ page import="com.usharama.model.Application" %>
<%@ page import="java.util.List" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Applied Scholarships</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            color: #333;
            padding-top: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
            display: block;
            text-align: center;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Applied Scholarships</h1>
        <table>
            <thead>
                <tr>
                    <th>Scholarship Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Applied Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Application> applications = (List<Application>) request.getAttribute("applications");
                if (applications != null && !applications.isEmpty()) {
                    for (Application appl : applications) { 
                %>
                    <tr>
                        <td><%= appl.getScholarship().getName() %></td>
                        <td><%= appl.getScholarship().getDescription() %></td>
                        <td><%= appl.getStatus() %></td>
                        <td><%= appl.getAppliedDate() %></td>
                    </tr>
                <% 
                    }
                } else { 
                %>
                    <tr>
                        <td colspan="4">No applications found.</td>
                    </tr>
                <% 
                } 
                %>
            </tbody>
        </table>
        <a href="/dashboard" class="btn-custom">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
