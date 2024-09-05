/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
           const fileInput = document.getElementById('fileUpload');
           const uploadButton = document.getElementById('uploadButton');

           fileInput.addEventListener('change', function() {
               if (fileInput.files.length > 0) {
                   uploadButton.disabled = false;
               } else {
                   uploadButton.disabled = true;
               }
           });

           const form = document.getElementById('downloadForm');
           form.addEventListener('submit', function(event) {
               event.preventDefault();

               const fileType = document.querySelector('input[name="fileType"]:checked').value;
               let actionUrl = '';

               if (fileType === 'preFilled') {
                   actionUrl = 'ModDataDownload';
               } else if (fileType === 'template') {
                   actionUrl = 'sampl';
               }

               const downloadForm = document.createElement('form');
               downloadForm.method = 'POST';
               downloadForm.action = actionUrl;

               document.body.appendChild(downloadForm);
               downloadForm.submit();
           });
       });
	   
	   $('#logout-link').click(function () {
	           $('#logoutModal').modal('show');
	       });

	       $('#confirmLogout').click(function () {
	           window.location.href = "employersLogout";
	       });
	   