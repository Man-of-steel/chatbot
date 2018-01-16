<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mos.ProductChatbot.DAO" %>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function loginValidate(){
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
		if(name ==""){
			alert("PLEASE ENTER USERS EMAIL");
			return false;
		}
		if(pswd ==""){
			alert("PLEASE ENTER USERS PASSWORD");
			return false;
		}
	 return true;
}
</script>
<%
if(request.getParameter("login") != null){
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	DAO dao = new DAO();
	ResultSet rs = dao.getData("select email, password from login where email = '+email+' and password = '+password+'");
	//String db_email ="" , db_password ="";
	boolean validuser = false;
	
		while(rs.next()){
				String db_email = rs.getString("email");
				String db_password = rs.getString("password");
			
				//	if(email.equals(db_email) && password.equals(db_password)){
						
					if("admin".equals("db_email") && "admin".equals("db_password")){
						validuser=true;
		     		  	String redirectURL = "admin_home.html";
		      	 	 	response.sendRedirect(redirectURL);
		      	 		break;
					}
					else{
						String redirectURL = "ProductIncharge_home.html";
	      	 	 		response.sendRedirect(redirectURL);
	      	 			break;	
					}
		}
		
}
%>
</body>
</html>