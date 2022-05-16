<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/recommand/main.css">
<jsp:include page="../template/head.jsp"></jsp:include>
<title>recommand</title>
 <script type="text/javascript" src="../js/recommand/main.js"></script>  
</head>

<body>
<%  String keyword=request.getParameter("keyword");
     if(keyword==null) keyword="";//검색
   	 keyword= new String(keyword.getBytes("iso-8859-1"));
         String option=request.getParameter("a");
         if(option==null) option="kortitle";
%>
<% String myPath=".."; %>
<%@ include file="../template/header.jspf" %> 
<!-- header -->

<div id="main" class="container marketing">
 <div id="ca"> 
            <ul>
                <li><img src="../imgs/subtitle01.jpg" alt="1"></li>
                <li><img src="../imgs/subtitle02.png" alt="2"></li>
                <li><img src="../imgs/subtitle02.jpg" alt="3"></li>
                
            </ul>
        </div>
 
 
 
 <div id="search" class="container-fluid d-flex">
       <form class="d-flex" >
          <select name="a">
             <option value="kortitle" name="a" selected >가게명</option>
             <option value="content" name="a" >내용</option>
             <option value="address" name="a" >주소</option>
          </select>
             <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
             <button id="searchbt" class="btn btn-outline-success" type="submit" >검색</button>
           
        </form>
      
      
</div>
 
 

	 <div  id="center" class="row mb-2">
	 <%
		String url="jdbc:mysql://localhost:3306/scott";
		String _id="user01";
		String pw="1234";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int count=0;
		int subtitle=0;
		String subnum="",check="";
		int foodcount=0,cafecount=0,etccount=0;
		
		
		
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,_id,pw);
		stmt=conn.createStatement();
		
	rs=stmt.executeQuery("select * from total where "+option+" LIKE '%"+keyword+"%' order by subnum asc, keyword desc");
	int i=0;
	while(rs.next()){
		
		//첫 이미지 자르기
		String imgs=rs.getString("imgname");
		String[] img=imgs.split(",");
		String src="";
		int snum=rs.getInt("subnum");
		if(snum==1){
			src="../imgs/food/";
		}else if(snum==2){
			src="../imgs/cafe/";
		}else if(snum==3){
			src="../imgs/etc/";
		}
		src=src+img[0];
		subnum=(rs.getString("subnum").equals("1")?"음식":(rs.getString("subnum").equals("2")?"카페":"기타"));
		if(subnum.equals("음식")&&foodcount<2) foodcount+=1;
		if(subnum.equals("카페")&&cafecount<2) cafecount+=1;
		if(subnum.equals("기타")&&etccount<2) etccount+=1;
		if(foodcount==1||cafecount==1||etccount==1) check=subnum; 
		else check="";	
		
		if(check!=""){
			i++;
	%>
	 <hr class="featurette-divider" id="scrollcheck<%=i%>">
		<h2 id= "check-bg" name="true"><span  class="text-muted" ><%=check %></span></h2>
<%} %>

	 <hr class="featurette-divider ">
	 <a id = "atag" href="maindetail.jsp?n=<%=rs.getString("num") %>">
  	  <div class="row featurette " data-aos="fade-up">
    
      <div class="col-md-7">
     
        <h2><span class="text-muted"><%=rs.getString("kortitle") %></span></h2>
        <p class="lead"><%=rs.getString("content").length()>30?rs.getString("content").substring(0,30)+"..":rs.getString("content") %></p>
        
      </div>
      <div class="col-md-5">
       
        <img id="list_img" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="<%=src %>" >
        
       
      </div>
     
    </div>
	 </a>
	 
	<%
		 
	}
	if(foodcount==0&&cafecount==0&&etccount==0) 
	{
	%>
		<h2 id= "check-bg" name="false"><span  class="text-muted" >검색결과가 없습니다.</span></h2>
	
	<% 	
	}
		
		
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	%>
  </div>
	
	
	
	
	 <!-- 한개 -->
	    
	  <div id="btn_list"  class="scroll_move btn_list" >
	  <a id="scroll1" href="#scrollcheck1" class="w-btn-outline w-btn-skin-outline">음식</a>
	  <a id="scroll2" href="#scrollcheck2" class="w-btn-outline w-btn-skin-outline">카페</a>
	  <a id="scroll3" href="#scrollcheck3" class="w-btn-outline w-btn-skin-outline">기타</a>
	  </div>

</div>

<!-- FOOTER -->
  <%@ include file="../template/footer.jspf" %>

</body>
</html>