<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>maindetail</title>
<link rel="stylesheet" type="text/css" href="../css/recommand/maindetail.css">
<jsp:include page="../template/head.jsp"></jsp:include>
<script type="text/javascript" src="../js/recommand/maindetail.js"></script>  
</head>
<body>
<% String myPath=".."; %>
<%@ include file="../template/header.jspf" %> 
<!-- header -->
<%
 	int num = Integer.parseInt(request.getParameter("n"));
	String url="jdbc:mysql://localhost:3306/scott";
	String _id="user01";
	String pw="1234";
	String str="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null; 
	int subnum=0;
	String [] img=new String[0];
	String kortitle="",engtitle="",imgs="",content="",address="";
	int keyword=0;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(url,_id,pw);
	stmt=conn.createStatement();
	String sql="select * from total where num="+num;
	rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		subnum= Integer.parseInt(rs.getString("subnum"));
		kortitle=rs.getString("kortitle");
		engtitle=rs.getString("engtitle");
		keyword=rs.getInt("keyword");
		imgs=rs.getString("imgname");
		img=imgs.split(",");
		String src="";
		if(subnum==1){
			src="../imgs/food/";
		}else if(subnum==2){
			src="../imgs/cafe/";
		}else if(subnum==3){
			src="../imgs/etc/";
		}
		
		for(int i=0;i<img.length;i++){
			img[i]=src+img[i];
			
		}
		content=rs.getString("content");
		address=(rs.getString("address")==null)?"":rs.getString("address");
	
	}
	
	
	sql="update total set keyword="+(keyword+1) +" where num="+num;
	  
    	try{
    		stmt=conn.createStatement();
    		stmt.executeUpdate(sql);
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		if(stmt!=null)stmt.close();
    		if(conn!=null)conn.close();
    	}

	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	String [] imgcopy=new String[img.length];
	for(int i=0;i<img.length;i++)
		{imgcopy[i]=img[i];}
	
	
	%>
	<div id="box">
		<h1 class="mb-4 text-muted center" ><%=kortitle %>(<span ><%=engtitle %></span>) </h1>
	
		<strong><textarea class="form-control content" id="message-text" readonly><%=content %></textarea></strong>
			
		<%@ include file="bxslider.jspf" %> 
		<br><br><br>
		 <hr class="featurette-divider ">
		<%@ include file="map.jspf" %>
		<p id="mmap" class="center" name="<%=address %>">&nbsp;<%=address %></p>
		<div class="center"><small class="text-muted ">조회수 : <%=keyword %></small></div>
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
		  <button id="go-back" type="button" class="btn btn-outline-secondary btn-lg px-4 gap-3">뒤로가기</button>
		  </div>
	</div>
<!-- FOOTER -->
  <%@ include file="../template/footer.jspf" %>
</body>
</html>