<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "ch14.uniformshop.master.ShopUniformDBBean" %>
<%@ page import = "ch14.uniformshop.master.ShopUniformDataBean" %>

<%@ include file="../../etc/color.jspf"%> 
 
<%
String managerId ="";
try{
   managerId = (String)session.getAttribute("managerId");
   if(managerId==null || managerId.equals("")){
      response.sendRedirect("../logon/managerLoginForm.jsp");
}else{
%>
<%
int uniform_id = Integer.parseInt(request.getParameter("uniform_id"));
String uniform_kind = request.getParameter("uniform_kind");
try{
	ShopUniformDBBean uniformProcess = ShopUniformDBBean.getInstance();
    ShopUniformDataBean uniform =  uniformProcess.getUniform(uniform_id); 
%>
<html>
<head>
<title>상품수정</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../etc/script.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<p>유니폼 수정</p>
<br>

<form method="post" name="writeform" 
   action="uniformUpdatePro.jsp"  enctype="multipart/form-data">
<table>
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
	    <a href="uniformList.jsp?uniform_kind=<%=uniform_kind%>">목록으로</a>
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>">분류 선택</td>
    <td  width="400"  align="left">
       <select name="uniform_kind">
           <option value="100" 
             <%if (uniform.getUniform_kind().equals("100")) {%>selected<%} %>
              >Laliga</option>
           <option value="200" 
             <%if (uniform.getUniform_kind().equals("200")) {%>selected<%} %>
             >Epl</option>
           <option value="300" 
             <%if (uniform.getUniform_kind().equals("300")) {%>selected<%} %>
             >SerieA</option>
       </select>
    </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">제 목</td>
    <td  width="400" align="left">
        <input type="text" size="50" maxlength="50" name="uniform_title" 
            value="<%=uniform.getUniform_title() %>">
        <input type="hidden" name="uniform_id" value="<%=uniform_id%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">가 격</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="9" name="uniform_price" 
          value="<%=uniform.getUniform_price() %>">원</td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">수량</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="uniform_count" 
          value="<%=uniform.getUniform_count() %>">장</td>
  </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>">팀</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="team" 
          value="<%=uniform.getTeam()%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">제조</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="publishing_com" 
          value="<%=uniform.getLaunch_com() %>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">발매일</td>
    <td  width="400" align="left">
        <select name="launch_year">
        <%
        Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
        int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
           for(int i=lastYear;i>=2010;i--){
        %>
             <option value="<%=i %>"  
             <%if (Integer.parseInt(uniform.getLaunch_date().substring(0,4))==i) {%>
             selected<%} %>><%=i %></option>
        <%} %>
        </select>년
        
        <select name="launch_month">
        <%
           for(int i=1;i<=12;i++){
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(uniform.getLaunch_date().substring(5,7))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>월
        
        <select name="publishing_day">
        <%
           for(int i=1;i<=31;i++){
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(uniform.getLaunch_date().substring(8))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>일
     </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">이미지</td>
    <td  width="400" align="left">
        <input type="file" name="uniform_image"><%=uniform.getUniform_image() %></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">내 용</td>
    <td  width="400" align="left">
     <textarea name="uniform_content" rows="13" 
         cols="40"><%=uniform.getUniform_content() %></textarea> </td>
  </tr>
 <tr>
    <td  width="100"  bgcolor="<%=value_c%>">할인율</td>
    <td  width="400" align="left">
        <input type="text" size="5" maxlength="2" name="discount_rate" 
          value="<%=uniform.getDiscount_rate() %>">%</td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="button" value="유니폼 수정" onclick="updateCheckForm(this.form)">  
  <input type="reset" value="다시작성">
</td></tr></table>         
</form>   
<%
}catch(Exception e){
	e.printStackTrace();
}%>         
</body>
</html>
<% 
  }
}catch(Exception e){
	e.printStackTrace();
}
%>