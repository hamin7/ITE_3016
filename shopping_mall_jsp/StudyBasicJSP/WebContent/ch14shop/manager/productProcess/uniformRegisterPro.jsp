<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.uniformshop.master.ShopUniformDBBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("utf-8");%>

<%
  String realFolder = "";//웹 어플리케이션상의 절대 경로
  String filename ="";
  MultipartRequest imageUp = null; 

  String saveFolder = "/imageFile";//파일이 업로드되는 폴더를 지정한다.
  String encType = "utf-8"; //엔코딩타입
  int maxSize = 2*1024*1024;  //최대 업로될 파일크기 5Mb
  //현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다
  ServletContext context = getServletContext();
  realFolder = context.getRealPath(saveFolder);  

  try{
     //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
     //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
     imageUp = new MultipartRequest(
		 request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
   
     //전송한 파일 정보를 가져와 출력한다
     Enumeration<?> files = imageUp.getFileNames();
   
     //파일 정보가 있다면
     while(files.hasMoreElements()){
       //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
       String name = (String)files.nextElement();
   
       //서버에 저장된 파일 이름
       filename = imageUp.getFilesystemName(name);
     }
  }catch(Exception e){
     e.printStackTrace();
  }
%>

<jsp:useBean id="uniform" scope="page" 
       class="ch14.uniformshop.master.ShopUniformDataBean">
</jsp:useBean>

<%
  String uniform_kind = imageUp.getParameter("uniform_kind");
  String uniform_title = imageUp.getParameter("uniform_title");
  String uniform_price = imageUp.getParameter("uniform_price");
  String uniform_count = imageUp.getParameter("uniform_count");
  String team = imageUp.getParameter("team");
  String launch_com = imageUp.getParameter("launch_com");
  String uniform_content = imageUp.getParameter("unifomr_content");
  String discount_rate = imageUp.getParameter("discount_rate");

  String year = imageUp.getParameter("launch_year");
  String month = 
		  (imageUp.getParameter("launch_month").length()==1)?
		  "0"+ imageUp.getParameter("launch_month"):
		  imageUp.getParameter("launch_month");
  String day =  (imageUp.getParameter("launch_day").length()==1)?
		  "0"+ imageUp.getParameter("launch_day"):
			  imageUp.getParameter("launch_day");

  uniform.setUniform_kind(uniform_kind);
  uniform.setUniform_title(uniform_title);
  uniform.setUniform_price(Integer.parseInt(uniform_price));
  uniform.setUniform_count(Short.parseShort(uniform_count));
  uniform.setTeam(team);
  uniform.setLaunch_com(launch_com);
  uniform.setLaunch_date(year+"-"+month+"-"+day);
  uniform.setUniform_image(filename);
  uniform.setUniform_content(uniform_content);
  uniform.setDiscount_rate(Byte.parseByte(discount_rate));
  uniform.setReg_date(new Timestamp(System.currentTimeMillis()));

  ShopUniformDBBean uniformProcess = ShopUniformDBBean.getInstance();
  uniformProcess.insertUniform(uniform);

  response.sendRedirect("uniformList.jsp?uniform_kind="+uniform_kind);
%>