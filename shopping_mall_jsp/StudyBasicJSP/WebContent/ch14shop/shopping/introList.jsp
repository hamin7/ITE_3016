<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "ch14.bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%>

<html>
<head>
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<h3 style="font-size:30px">New Arrival</h3>
<%
  ShopBookDataBean bookLists[] = null;
  int number =0;
  String book_kindName="";

  ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
  for(int i=1; i<=3;i++){
	  bookLists = bookProcess.getBooks(i+"00",3);

     if(bookLists[0].getBook_kind().equals("100")){
	      book_kindName="EPL";
     }else if(bookLists[0].getBook_kind().equals("200")){
	      book_kindName="La Liga";
     }else if(bookLists[0].getBook_kind().equals("300")){
	      book_kindName="Serie A";
     }
%>
<div style="display:block;">
  <br><font size="+1"><b><%=book_kindName%> 's new product:
  <a href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">more</a>
  </b></font></div>
<%
  for(int j=0;j<bookLists.length;j++){
%>
<div style="float:left;width:33%;">
    <table style="border: hidden;">
      <tr height="200" bgcolor="<%=value_c%>">
        <td rowspan="1"  width="200">
          <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
             <img src="../../imageFile/<%=bookLists[j].getBook_image()%>"
             border="0" width="190" height="190"></a></td>
     </tr>
    <tr height="30" bgcolor="<%=value_c%>">
       <td width="200"><font size="+1"><b>
       <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
       <%=bookLists[j].getBook_title() %>
       </a>
       </b>
       </font>
       </td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>">
       <td width="200">Manufacturer : <%=bookLists[j].getPublishing_com()%></td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>">
       <td width="200">Team : <%=bookLists[j].getAuthor()%></td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>">
       <td width="200">Original Price :<%=NumberFormat.getInstance().format(bookLists[j].getBook_price())%>won<br>
                Sales Price : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(bookLists[j].getBook_price()*((double)(100-bookLists[j].getDiscount_rate())/100)))%>
            </font></b>won</td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>">
       <td width="200">
       <%if(bookLists[j].getBook_count()==0){ %>
       <b>Temporally sold out</b>
       <%}else{ %>
       &nbsp;
       <%} %>
       </td>
     </tr>
     </table></div>
     
<%
  }
%>
<br>
<br>
<%
}
%>

</body>
</html>
