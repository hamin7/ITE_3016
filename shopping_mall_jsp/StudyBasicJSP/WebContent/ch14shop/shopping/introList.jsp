<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.uniformshop.master.ShopUniformDBBean" %>
<%@ page import = "ch14.uniformshop.master.ShopUniformDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 

<html>
<head>
<title>Uniform Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<h3>신간소개</h3>
<%
  ShopUniformDataBean uniformLists[] = null;
  int number =0;
  String uniform_kindName="";
  
  ShopUniformDBBean uniformProcess = ShopUniformDBBean.getInstance();
  for(int i=1; i<=3;i++){
	  uniformLists = uniformProcess.getUniforms(i+"00",3);
     
     if(uniformLists[0].getUniform_kind().equals("100")){
    	 uniform_kindName="Laliga";
     }else if(uniformLists[0].getUniform_kind().equals("200")){
    	 uniform_kindName="Epl";  
     }else{
    	 uniform_kindName="SerieA";
     }
%>
  <br><font size="+1"><b><%=uniform_kindName%> 분류의 신간목록: 
  <a href="list.jsp?uniform_kind=<%=uniformLists[0].getUniform_kind()%>">더보기</a>
  </b></font>
<%             
  for(int j=0;j<uniformLists.length;j++){
%>
    <table > 
      <tr height="30" bgcolor="<%=value_c%>"> 
        <td rowspan="4"  width="100">
          <a href="uniformContent.jsp?uniform_id=<%=uniformLists[j].getUniform_id()%>&uniform_kind=<%=uniformLists[0].getUniform_kind()%>">
             <img src="../../imageFile/<%=uniformLists[j].getUniform_image()%>"  
             border="0" width="60" height="90"></a></td> 
       <td width="350"><font size="+1"><b>
          <a href="uniformContent.jsp?uniform_id=<%=uniformLists[j].getUniform_id()%>&uniform_kind=<%=uniformLists[0].getUniform_kind()%>">
              <%=uniformLists[j].getUniform_title() %></a></b></font></td> 
       <td rowspan="4" width="100">
          <%if(uniformLists[j].getUniform_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">제조사 : <%=uniformLists[j].getLaunch_com()%></td> 
     </tr>
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">팀 : <%=uniformLists[j].getTeam()%></td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">정가 :<%=NumberFormat.getInstance().format(uniformLists[j].getUniform_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(uniformLists[j].getUniform_price()*((double)(100-uniformLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td> 
     </tr> 
     </table>
     <br>
<%
  }
}
%>

</body>
</html>