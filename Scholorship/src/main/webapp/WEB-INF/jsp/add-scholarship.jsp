<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Scholarship</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Add New Scholarship</h1>
        <form action="/scholarships/add" method="post" class="border p-4 shadow-sm rounded">
            <div class="mb-3">
                <label for="name" class="form-label">Scholarship Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <textarea id="description" name="description" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label for="eligibility" class="form-label">Eligibility Criteria(CGPA):</label>
                <textarea id="eligibility" name="eligibility" class="form-control" required></textarea>
            </div>
			<div class="mb-3">
			    <label for="eligibility" class="form-label">Eligibility Criteria(Branch):</label>
				<input type="text" id="branch" name="branch" class="form-control" required>
			</div>
            <div class="mb-3">
                <label for="deadline" class="form-label">Deadline:</label>
                <input type="date" id="deadline" name="deadline" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status:</label>
                <select id="status" name="status" class="form-select">
                    <option value="Open">Open</option>
                    <option value="Closed">Closed</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">Add Scholarship</button>
        </form>
    </div>
    <!-- Bootstrap JS (optional for interactivity) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
