<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2016-06-08
  Time: 오후 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload with Ajax</title>
    <style>
        .fileDrop {
            width: 100%;
            height: 200px;
            border: 1px dotted deepskyblue;
        }

        small {
            margin-left: 3px;
            font-weight: bold;
            color: grey;
        }
    </style>
</head>
<body>
<h3>Ajax File Upload</h3>
<div class="fileDrop"></div>
<div class="uploadList"></div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
    $(".fileDrop").on("dragenter dragover", function (event) {
        event.preventDefault();
    });
    $(".fileDrop").on("drop", function (event) {
        event.preventDefault();

        var formData = new FormData();

        console.log("------------------------------------");
        //let files = event.target.files;
        let files = event.originalEvent.dataTransfer.files;
        for (let i = 0; i < files.length; i++) {
            console.log("size = " + files[i].mozFullPath);
            formData.append("file", files[i]);
            break;
        }
        console.log("------------------------------------");


        // ajax를 이용하여 FormData 객체에 있는 파일데이타를 전송하기 위하여는
        // processData, contentType을 반드시 false로 만들어 주어야 한다.
        // processData : 데이터를 일반적으로 query string으로 변환할 것인지를 결정한다. 기본값 ;true
        //               application/x-www-form-urlencoded 타입으로 전송한다.
        // contenType : 기본값 application/x-www-form-urlencoded
        //              파일의 경우 multipart/form-data 방식으로 전송하기 위해서 false 로 지정한다.
        $.ajax({
            url : "/uploadAjax",
            data : formData,
            dataType : 'text',
            processData : false,
            contentType : false,
            type : 'POST',
            success : function (data) {
                var str = "";
                if(checkImageType(data)) {
                    str = "<div><a href=displayFile?fileName=" +getImageLink(data) +">"+ "<img src='displayFile?fileName=" + data + "'/>" +"</a><small data-src="+ data + ">X</small></div>";
                } else {
                    str = "<div><a href='displayFile?fileName=" + data +"'>"+getOriginalName(data) + "</a>"
                        +"<small data-src='" +data+ "'>X</small></div></div>";
                }

                $(".uploadList").append(str);
            }
        });
    });

    function  checkImageType(fileName) {
        var pattern = /jpg|gif|png|jpeg/i;
        return fileName.match(pattern);
    }

    function getOriginalName(fileName) {
        if(checkImageType(fileName)) {
            return;
        }
        var idx = fileName.indexOf("_") + 1;
        return fileName.substr(idx);
    }

    function getImageLink(fileName) {
        if(!checkImageType(fileName)) {
            return;
        }
        var front = fileName.substr(0, 12);
        var end = fileName.substr(14);

        return front + end;
    }

    $(".uploadList").on("click", "small", function (event) {
        var that = $(this);
        $.ajax({
            url : "deleteFile",
            type : "post",
            data : {fileName : $(this).attr("data-src")},
            dataType : "text",
            success : function (result) {
                if(result === 'deleted') {
                    that.parent("div").remove();
                } else {
                    alert("삭제 실패");
                }
            }
        })
    });

</script>
</body>
</html>
