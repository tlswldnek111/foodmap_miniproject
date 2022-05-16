<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>sugdetail</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="2; url=../index.jsp">
<jsp:include page="../template/head.jsp"></jsp:include>
</head>
<script type="text/javascript" src="../js/suggest/goback.js"></script>  
  <body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<%
	if(request.getMethod().equals("POST")){
		int num = Integer.parseInt(request.getParameter("num"));
		
		String sql="delete from suggest where num="+num;
		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/scott";
		String user="user01";
		String password="1234";

		System.setProperty("mysql.user", user);
		System.setProperty("mysql.password",password);

		Connection conn=null;
		Statement stmt=null;
		int result=0;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,System.getProperty("mysql.user"),System.getProperty("mysql.password"));
			stmt=conn.createStatement();
			result=stmt.executeUpdate(sql);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	
	
		if(result>0){
     		String tit="정상적으로 삭제되었습니다.";
     		String con="잠시후, 메인 화면으로 이동합니다.";
		%>
		
	<div class="px-4 py-5 my-5 text-center md">
	<h1 class="display-5 fw-bold"><%=tit %></h1>
	  <div class="col-lg-6 mx-auto">
      <p class="lead mb-4"><%=con %></p>
    </div>
	</div>
     		<%
     	}}
     	%>







</body>
</html>