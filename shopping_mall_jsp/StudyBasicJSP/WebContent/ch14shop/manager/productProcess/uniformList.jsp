<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.uniformshop.master.ShopUniformDBBean" %>
<%@ page import = "ch14.uniformshop.master.ShopUniformDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="../../etc/color.jspf"%> 

<%
String managerId ="";
try{
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")){
       response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
%> 

<%!
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    List<ShopUniformDataBean> uniformList = null; 
    int number =0;
    String uniform_kind="";
    
    uniform_kind = request.getParameter("uniform_kind");
 
    ShopUniformDBBean uniformProcess = ShopUniformDBBean.getInstance();
    int count = uniformProcess.getUniformCount();
    
    if (count > 0) {
    	uniformList = uniformProcess.getUniforms(uniform_kind);
    }
%>
<html>
<head>
<title>등록된 책 목록</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
   String uniform_kindName="";
   if(uniform_kind.equals("100")){
	   uniform_kindName="Laliga";
   }else if(uniform_kind.equals("200")){
	   uniform_kindName="Epl";  
   }else if(uniform_kind.equals("300")){
	   uniform_kindName="SerieA";
   }else if(uniform_kind.equals("all")){
	   uniform_kindName="전체";
   }
%>
<a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
<p><%=uniform_kindName%> 분류의 목록: 
<%if(uniform_kind.equals("all")){%> 
    <%=count%>개
<%}else{%>
    <%=uniformList.size() %>개
<%} %>
</p>
<table>
<tr>
    <td align="right" bgcolor="<%=value_c%>">
       <a href="uniformRegisterForm.jsp">유니 등록</a>
    </td>
</table>

<%
  if (count == 0) {
%>
<table>
<tr>
   <td align="center">
           등록된 책이 없습니다.
   </td>
</table>

<%} else {%>
<table> 
    <tr height="30" bgcolor="<%=value_c%>"> 
      <td align="center"  width="30">번호</td> 
      <td align="center"  width="30">책분류</td> 
      <td align="center"  width="100">제목</td>
      <td align="center"  width="50">가격</td> 
      <td align="center"  width="50">수량</td> 
      <td align="center"  width="70">저자</td>
      <td align="center"  width="70">출판사</td>
      <td align="center"  width="50">출판일</td>
      <td align="center"  width="50">책이미지</td>
      <td align="center"  width="30">할인율</td>
      <td align="center"  width="70">등록일</td>
      <td align="center"  width="50">수정</td>
      <td align="center"  width="50">삭제</td>         
    </tr>
<%  
    for (int i = 0 ; i <uniformList.size() ; i++) {
      ShopUniformDataBean uniform = 
    		  (ShopUniformDataBean)uniformList.get(i);
%>
   <tr height="30">
      <td width="30"><%=++number%></td> 
      <td width="30"><%=uniform.getUniform_kind()%></td> 
      <td width="100" align="left">
           <%=uniform.getUniform_title()%></td>
      <td width="50" align="right"><%=uniform.getUniform_price()%></td> 
      <td width="50" align="right">
      <% if(uniform.getUniform_count()==0) {%>
         <font color="red"><%="일시품절"%></font>
      <% }else{ %>
         <%=uniform.getUniform_count()%>
      <%} %>
      </td> 
      <td width="70"><%=uniform.getTeam()%></td>
      <td width="70"><%=uniform.getLaunch_com()%></td>
      <td width="50"><%=uniform.getLaunch_date()%></td>
      <td width="50"><%=uniform.getUniform_image()%></td>
      <td width="50"><%=uniform.getDiscount_rate()%></td>
      <td width="50"><%=sdf.format(uniform.getReg_date())%></td>
      <td width="50">
         <a href="uniformUpdateForm.jsp?uniform_id=<%=uniform.getUniform_id()%>&uniform_kind=<%=uniform.getUniform_kind()%>">수정</a></td>
      <td width="50">
         <a href="uniformDeleteForm.jsp?uniform_id=<%=uniform.getUniform_id()%>&uniform_kind=<%=uniform.getUniform_kind()%>">삭제</a></td>    
   </tr>
<%}%>
</table>
<%}%>
<br>
<a href="../managerMain.jsp"> 관리자 메인으로</a> 
</body>
</html>

<% 
   }
}catch(Exception e){
   e.printStackTrace();
}
%>