<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%>

<%
   String managerId ="";
   try{
	   managerId = (String)session.getAttribute("managerId");
	   
	   if(managerId==null || managerId.equals("")){
          response.sendRedirect("logon/managerLoginForm.jsp");
	   }else{
%>
<html>
<head>
<title>Uniform Manage</title>
</head>
<body>
  <form method="post" action="logon/managerLogout.jsp">
	 <b>During management.. </b><input type="submit" value="logout">	
  </form>
    
   <table>
     <tr><td align="center" bgcolor="<%=bar%>">상품관련 작업</td></tr>
     <tr><td>
     <a href='productProcess/bookRegisterForm.jsp'>상품등록</a></td></tr>
     <tr><td>
     <a href='productProcess/bookList.jsp?book_kind=all'>상품수정/삭제</a>
     </td></tr>
   </table><br><br>
   
   <table>
     <tr><td align="center" bgcolor="<%=bar%>">구매된 상품관련 작업</td></tr>
     <tr><td>
     <a href='orderedProduct/orderedList.jsp'>전체구매목록 확인</a></td></tr>
   </table>
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>