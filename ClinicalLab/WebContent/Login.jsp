<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link href= "css\Style.css" type= "text/css" rel= "stylesheet">
	
<title>Login Page</title>

	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	

</head>
<body>

	<span><a href= "Login.jsp?locale=in">India|</a></span>
	<span><a href= "Login.jsp?locale=fr">France</a></span>
	
	<header>
			<%@ include file= "Header.jsp" %>
	</header>
	
	<hr>
	
	<%@ include file= "SubSection.jsp" %>
	<fmt:setLocale value="${param['locale']}"/>
	
	<fmt:setBundle basename= "MessageResources" var= "msg" scope= "page"/>
	
	<form action= "FirstServlet" method= "post" >
	
		<table>
			<tr>
				<td>
					<label><fmt:message key= "forms.label.role" bundle= "${msg }"/></label>
				</td>
				<td>
					<select name= "role" onblur="getData()">
					
						<option>Admin</option>
						<option>Manager</option>
						<option>Lab Technician</option>
						<option>Operator</option>
				  </select>
				</td>
			</tr>
			<tr>
				<td>
					<label><fmt:message key= "forms.label.labcode" bundle= "${msg }"/></label>
				</td>
				<td><input type= "text" name= "labCode" id= "labCode" list= "lab">
				
					<datalist id= "lab"></datalist>
				</td>
			</tr>
			<tr>
				<td>
					<label><fmt:message key= "forms.label.userName" bundle= "${msg }"/></label>
				</td>
				<td><input type= "text" name= "userName" id= "userName"></td>
			</tr>
			<tr>
				<td>
					<label><fmt:message key= "forms.label.passWord" bundle= "${msg }"/></label>
				</td>
				<td><input type= "password" name= "pswd" id= "pswd"></td>
			</tr>
			<tr>
				<td colspan= "2"><input type= "submit" value= "Login"></td>
			</tr>
		

		</table>
	</form>
	
	<footer>
			<%@ include file= "Footer.jsp" %>
	</footer>
</body>

<script >

	var inputField = document.getElementById("labCode");
	var dataListField = document.getElementById("lab");
	
	var xmlhttpobject = new XMLHttpRequest();
	xmlhttpobject.open("GET","LabCode.json",true);
	
	xmlhttpobject.onreadystatechange=function(response)
	{
	
		if(xmlhttpobject.readyState == 4 && xmlhttpobject.status == 200) {
			
			var jSonOptions = JSON.parse(xmlhttpobject.responseText);
			jSonOptions.forEach(function(item){
				
				var option = document.createElement("option");
				option.value = item.code;
				dataListField.appendChild(option);
			});
		}
	};
	
	xmlhttpobject.send();
	
	
</script>

</html>