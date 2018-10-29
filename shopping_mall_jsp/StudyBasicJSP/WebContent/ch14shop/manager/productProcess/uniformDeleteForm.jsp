<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../etc/color.jspf"%> 

<%
String managerId ="";
try{
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")){
       response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
       int uniform_id = Integer.parseInt(request.getParameter("uniform_id"));
       String uniform_kind = request.getParameter("uniform_kind");
%>

<html>
<head>
<title>유니폼 삭제</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<p>유니폼 삭제</p>
<br>
<form method="POST" name="delForm"  
   action="uniformDeletePro.jsp?uniform_id=<%= uniform_id%>&uniform_kind=<%=uniform_kind%>" 
   onsubmit="return deleteSave()"> 
 <table>
 <tr>
     <td align="right"  bgcolor="<%=value_c%>">
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
	    <a href="uniformList.jsp?uniform_kind=<%=uniform_kind%>">목록으로</a>
     </td>
  </tr>
  
 <tr height="30">
    <td align=center bgcolor="<%=value_c%>">
      <input type="submit" value="삭제" >  
   </td>
 </tr>  
</table> 
</form>
</body>
</html>
<% 
   }
}catch(Exception e){
	e.printStackTrace();
}
%>