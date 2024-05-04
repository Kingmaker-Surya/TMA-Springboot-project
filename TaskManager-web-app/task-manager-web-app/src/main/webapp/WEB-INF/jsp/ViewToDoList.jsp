<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View Task List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" 
               integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
                crossorigin="anonymous">
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
            
            <style>
        table,
        th {
           padding: 5px;
           text-align: center;
        }
        td {
            padding: 5px;
            text-align: center;
        }
    </style>

    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>

</head>
<body>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Task Management System </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
</nav>

<br>
    <div class="container">
    <div class="row">
        <h3> My Task List</h3>
         </div>
         <br>
         
             <form:form>

            <table class="table table-striped table-bordered ">
            	<thead class="table-dark">
            	<tr>
            		<th>Id</th>
            		<th>Task</th>
            		<th>Date</th>
            		<th>Status</th>
            		<th>Mark Completed</th>
            		<th>Edit</th>
            		<th>Delete</th>
            	</tr>
            	</thead>

            	<c:forEach var="todo" items="${list}">
                    <tr>
                		<td>${todo.id}</td>
                		<td>${todo.title}</td>
                		<td>${todo.date}</td>
                		<td>${todo.status}</td>
                		<td><button type="button" class="btn btn-success">
                		    <a href="/updateToDoStatus/${todo.id}">Mark as Complete</a>
                		</button></td>
                		<td><button type="button" class="btn btn-primary">
                		    <a href="/editToDoItem/${todo.id}">Edit</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteToDoItem/${todo.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>

            </table>            

        </form:form>

        <button type="button" class="btn btn-primary btn-block">
        	<a href="/addToDoItem">Add New Task</a>
        </button>

    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Task added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Task deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete task")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Task updated successfully!!")
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