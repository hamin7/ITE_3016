<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "ch14.uniformshop.master.ShopUniformDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  int uniform_id = Integer.parseInt(request.getParameter("uniform_id"));
  String uniform_kind = request.getParameter("uniform_kind");
 
  ShopUniformDBBean uniformProcess = ShopUniformDBBean.getInstance();
  uniformProcess.deleteUniform(uniform_id); 

  response.sendRedirect("uniformList.jsp?uniform_kind="+uniform_kind);
%>