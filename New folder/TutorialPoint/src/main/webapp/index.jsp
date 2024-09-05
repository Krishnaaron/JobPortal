<!DOCTYPE html>
<html>
<head>
    <title>Download Options</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body>


<form method="POST" action="uploadFile" enctype="multipart/form-data">
		File to upload: <input type="file" name="file"> 
	
		<input type="submit" value="Upload"> Press here to upload the file!
	</form>	
</body>
    <div class="container">
        <h1 class="my-4">Select Download Option</h1>
        
        <!-- Download Options Form -->
        <form action="/handleDownload" method="get">
            <div class="form-check">
                <input type="radio" name="downloadType" value="template" id="template" class="form-check-input" checked>
                <label class="form-check-label" for="template">Download Template</label>
            </div>
            <div class="form-check">
                <input type="radio" name="downloadType" value="prefilled" id="prefilled" class="form-check-input">
                <label class="form-check-label" for="prefilled">Download Pre-filled Data</label>
            </div>
            <div class="form-group mt-3">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
