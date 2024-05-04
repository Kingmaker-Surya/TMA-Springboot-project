<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Add New Task</title>

    <link rel="stylesheet"
    	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script
    	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
    	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Task Management System </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
</nav>

<br>
<br>

    <div class="container">
    
    <div class = "row">
			<div class ="col-lg-6 col-md-6 col-sm-6 container justify-content-center card">
			<br>
				<h1 class = "text-center"> Add New Task </h1>
				<div class = "card-body">

        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">

            	<div class="form-group">
            		<label>Task</label>
            		    <form:input type="text" path="title" id="Title"
            		        class="form-control input-sm" required="required" />
            </div>

            <div class="form-group">
            		<label class>Date</label>
            			<form:input type="date" path="date" id="Date"
            				class="form-control input-sm" required="required" />
            </div>
            
            <div class="form-group">
            		<label>Status</label>
            			<form:input type="text" path="status" id="Status"
            				class="form-control input-sm" value="Incomplete"/>
            </div>

            <div class="box-footer">
            	<div class="col-md-2">
            		<button type="submit" value="Register" class="btn btn-success">Save</button>
            	</div>
        </form:form>
        
                       </div>
                </div>
         </div>
    </div>

    <script th:inline="javascript">
            window.onload = function() {

                var msg = "${message}";
                console.log(msg);
                if (msg == "Save Failure") {
    				Command: toastr["error"]("Something went wrong with the save.")
    			}

    			toastr.options = {
                      "closeButton": true,
                      "debug": false,
                      "newestOnTop": false,
                      "progressBar": true,
                      "positionClass": "toast-top-right",
                      "preventDuplicates": false,
                      "showDuration": "300",
                      "hideDuration": "1000",
                      "timeOut": "5000",
                      "extendedTimeOut": "1000",
                      "showEasing": "swing",
                      "hideEasing": "linear",
                      "showMethod": "fadeIn",
                      "hideMethod": "fadeOut"
                    }
    	    }
        </script>
        
        <footer class = "footer">
	<div class="footer-copyright text-center py-3">
	<p>&copy; 2024 SR Systems Inc. All rights reserved.</p>
	</div>
	</footer>
        

</body>

</html>