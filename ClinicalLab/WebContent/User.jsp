<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href= "css\Style.css" type= "text/css" rel= "stylesheet">

<script type="text/javascript" src= "jslibs/jquery-1.12.1.js"></script>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>

	<header>
			<%@ include file= "Header.jsp" %>
	</header>
	
	<h5>
		LabCode: <c:out value="${param.labCode }"></c:out>
	</h5>
	
	<table>
		<tr>
			<td>OrderNumber</td>
			<td><input type= "text"></td>
			<td>CollectionDate</td>
			<td><input type= "text"></td>
			<td>CollectionType</td>
			<td>
				Lab<input type= "radio" id= "collectionType" name= "type">
				Home<input type= "radio" id= "collectionType" name= "type">
			</td>
		</tr>
			<tr>
			<td>PatientCode</td>
			<td><input type= "text"></td>
			<td>PatientName</td>
			<td><input type= "text"></td>
			<td>Age</td>
			<td><input type= "text"></td>
		</tr>
			<tr>
			<td>Hand Phone</td>
			<td><input type= "text"></td>
			<td>Email</td>
			<td><input type= "text"></td>
			<td>Gender</td>
			<td>
				Male<input type= "radio" id= "male" name= "gender">
				Female<input type= "radio" id= "female" name= "gender">
			</td>
		</tr>
			<tr>
			<td>DoctorCode</td>
			<td><input type= "text" id= "doctorId"></td>
			<td colspan= "2">DoctorName</td>
			<td colspan= "2"><input type= "text" id= "doctorName"></td>
		</tr>
	</table>
	
	<h2>Test Details</h2>
	
	<table class="testOrders">
    <tr>
        <td>Test Code</td>
        <td>Test Name</td>
        <td>Amount</td>
    </tr>
    <tr>
        <td>
            <input type="text" name="testCode" />
        </td>
        <td>
            <input type="text" name="testName" />
        </td>
        <td>
            <input type="text" name="Amount" />
        </td>
    </tr>
	</table>
	<table>
		<tr>
			<th colspan= "2">Total</th>
			<th>10</th>
		</tr>
	</table>
	<input type= "button" id="addOrder" value= "Add Order">
	
	<footer>
			<%@ include file= "Footer.jsp" %>
	</footer>
	
</body>

<script type="text/javascript">

   $(function(){
	
	   var counter = 1;
	   jQuery('#addOrder').click(function(event){
	       event.preventDefault();
	       counter++;
	       var newRow = jQuery('<tr><td><input type="text" name="testCode' +
	           counter + '"/></td><td><input type="text" name="testName' +
	           counter + '"/></td><td><input type="text" name="Amount' +
	           counter + '"/></td></tr>');
	       $('table.testOrders').append(newRow);
	   });
	   
   });
   
   $(function() {
	   
	   $("#doctorId").on('keyup',function(){
			
		   alert("came here..");
			var userId = $(this).val();
			alert("---"+userId);
			$.ajax({
				type: 'GET', 
	            url: "Doctor.json",
	            dataType: "text",
	            success: function(data) {
	            	parseData = $.parseJSON(data);
	           		var flag = false;
	                for (var i = 0;i < parseData.length;++i) {
	                	if(userId == parseData[i].doctorCode) {
	                		$("#doctorName").val(parseData[i].doctorName);
	                		flag = true;
	                	}
	                } 
	                if(!flag) {
	                	$("#doctorName").val("");
	                }
	            }
			});
		});
	   
	}); 
   
   

</script>
</html>