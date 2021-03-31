<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>

	<button id='uploadBtn'>Upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script>
    $(document).ready(function(e) {
        $("#uploadBtn").on("click", function(e){
            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue = "${_csrf.token}";

            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");           
            var files = inputFile[0].files;
            console.log(files);

            for(var i = 0; i < files.length; i++){
                formData.append("uploadFile", files[i]);           
            }
            
            $.ajax({
                url: '/uploadAjaxAction',
                processData: false, 
                contentType: false,
                data: formData,
                type: 'post',
                dataType: 'json',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                success: function(result) {
                    console.log(result);
                }
            });           
        });
    });  
    </script>
</body>
</html>
