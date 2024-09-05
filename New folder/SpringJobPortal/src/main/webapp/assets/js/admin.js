document.addEventListener("DOMContentLoaded", function(event) {
    const showNavbar = (toggleId, navId, bodyId, headerId) => {
        const toggle = document.getElementById(toggleId),
            nav = document.getElementById(navId),
            bodypd = document.getElementById(bodyId),
            headerpd = document.getElementById(headerId);
        
        // Validate that all variables exist
        if (toggle && nav && bodypd && headerpd) {
            toggle.addEventListener('click', () => {
                // Show navbar
                nav.classList.toggle('show');
                // Change icon
                toggle.classList.toggle('bx-x');
                // Add padding to body
                bodypd.classList.toggle('body-pd');
                // Add padding to header
                headerpd.classList.toggle('body-pd');
            });
        }
    };
    
    showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header');
    
    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link');
    
    function colorLink() {
        if (linkColor) {
            linkColor.forEach(l => l.classList.remove('active'));
            this.classList.add('active');
        }
    }
    linkColor.forEach(l => l.addEventListener('click', colorLink));
});

// new 
// JavaScript to dynamically update counts and render the charts


// profile and register
$(document).ready(function() {
    // Show Edit Profile Modal
    $('#editProfileBtn').on('click', function() {
        $('#editProfileModal').modal('show');
    });

    // Show Register Admin Modal
    $('#registerAdminBtn').on('click', function() {
        $('#registerAdminModal').modal('show');
    });

    // Edit Profile Form Submission
    $('#editProfileForm').on('submit', function(e) {
        e.preventDefault();
        // Perform AJAX request or other actions to save profile changes
        alert('Profile updated successfully!');
        $('#editProfileModal').modal('hide');
    });

    // Register Admin Form Submission
    $('#registerAdminForm').on('submit', function(e) {
        e.preventDefault();
        const password = $('#newAdminPassword').val();
        const confirmPassword = $('#newAdminConfirmPassword').val();

        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        // Perform AJAX request or other actions to register new admin
        alert('New admin registered successfully!');
        $('#registerAdminModal').modal('hide');
    });
});


