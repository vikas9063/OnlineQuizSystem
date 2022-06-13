<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page ! Quiz</title>
<style type="text/css">
.error{
	display: flex;
	justify-content: center;
	align-items:  center;
}

</style>
<%@ include file="../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<div class="container error">
		<div>
			<h1>
			!! Error Page !!
			<%= exception %>
			</h1>
		</div>
	</div>
</body>
</html>