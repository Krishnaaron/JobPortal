<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <title>Email OTP Verification</title>
    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Include Bootstrap JS for modal functionality -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        /* Custom styles for the OTP input fields */
        .otp-input {
            width: 3rem;
            height: 3rem;
            text-align: center;
            font-size: 2rem;
            margin: 0.3rem;
        }
        /* Styles for buttons */
        .btn-animate {
            position: relative;
            transition: all 0.2s ease;
        }
        .btn-animate:hover {
            transform: scale(1.1);
        }
        /* Center the content vertically and horizontally */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .verification-box {
            border: 1px solid #ddd;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        $(document).ready(function() {
            // Focus on the next input field when a digit is entered
            $('.otp-input').keyup(function() {
                if (this.value.length == this.maxLength) {
                    $(this).next('.otp-input').focus();
                }
            });

            // Restrict input to numbers only
            $('.otp-input').on('keypress', function(e) {
                if (!/[0-9]/.test(String.fromCharCode(e.which))) {
                    e.preventDefault();
                }
            });

            // Show modal if there is a message
            <% if (session.getAttribute("message") != null) { %>
                $('#messageModal').modal('show');
            <% } %>
            
            // Reset OTP input fields on form submission
            $('form').on('submit', function() {
                $('.otp-input').val('');
                $('.otp-input').first().focus();
            });
        });
    </script>
</head>
<body>

<div class="container">
    <div class="verification-box text-center">
        <h4>Job Finder Email Verification</h2>
        <form action="verifyOTP" >
            <div class="form-group">
                <input type="text" class="otp-input form-control d-inline" maxlength="1" name="otp1" required>
                <input type="text" class="otp-input form-control d-inline" maxlength="1" name="otp2" required>
                <input type="text" class="otp-input form-control d-inline" maxlength="1" name="otp3" required>
                <input type="text" class="otp-input form-control d-inline" maxlength="1" name="otp4" required>
                <input type="text" class="otp-input form-control d-inline" maxlength="1" name="otp5" required>
                <input type="text" class="otp-input form-control d-inline" maxlength="1" name="otp6" required>
            </div>
            <button type="submit" class="btn btn-primary btn-animate">Submit</button>
        </form>
        <a href="home.jsp" class="btn btn-secondary btn-animate mt-3">Back Home</a>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">
                    <% if ("success".equals(session.getAttribute("messageType"))) { %>
                        Success
                    <% } else { %>
                        Error
                    <% } %>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert <% if ("success".equals(session.getAttribute("messageType"))) { %>
                                    alert-success
                                  <% } else { %>
                                    alert-danger
                                  <% } %>">
                    <i class="fas <% if ("success".equals(session.getAttribute("messageType"))) { %>
                                    fa-check-circle
                                  <% } else { %>
                                    fa-times-circle
                                  <% } %>"></i>
                    <%= session.getAttribute("message") %>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Include Font Awesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
    