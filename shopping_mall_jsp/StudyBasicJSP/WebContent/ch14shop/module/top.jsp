<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%> 
<html>
<head>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
 try{
   if(session.getAttribute("id")==null){%>
   <a href="../shopping/list.jsp?book_kind=all">See all lists</a>&nbsp;
   <br>
      
   <form name="inform" method="post" action="loginPro.jsp">
         ID:  <input type="text" name="id" size="15" maxlength="50">
         Password:  <input type="password" name="passwd" size="15" maxlength="16">
    <input type="submit" name="Submit" value="Login">
    <input type="button" value="Register"
    onclick="location.href='insertmemberForm.jsp'">
   </form>
   <font color="red">* You need to login.*</font>    
 <%}else{%>
    <a href="../shopping/list.jsp?book_kind=all">See all list</a>&nbsp;
    <a href="../shopping/cartList.jsp?book_kind=all">See the cart</a>&nbsp;
    <a href="../shopping/buyList.jsp">See the Buy list</a>&nbsp;
      
    <br><br> 
    <b><%=session.getAttribute("id")%></b> , Have a good time.
       
    <input type="button"  value="Logout" 
        onclick="javascript:window.location='../shopping/logout.jsp'">
     
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
</body>
</html>
