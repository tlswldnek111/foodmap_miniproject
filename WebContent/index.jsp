<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/index.css">  
 <script type="text/javascript" src="js/index.js"></script>  
    
<title>맛집여지도</title>
</head>
<body >
<% String myPath="."; %>
<%@ include file="template/header.jspf" %> 

<main >

 <div class="main-container marketing" >
	<div class="main-img">
  		<img src="imgs/main.jpg"/>
  	</div>
  </div>  

  <div id="index" class="container marketing">
	
    <!-- 메인화면 -->
    
    <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center ">
    <div class="col-md-5  mx-auto my-5 ">
      <h1 class=" fw-normal">나만의 맛집 List</h1>
      <p class="lead ">사심이 들어간 유명하고 맛있는 음식점 리스트입니다. 추가적인 의견제시는 Q&A에 글을 작성해 주세요.</p>
      <a class="btn btn-outline-secondary" href="suggest/board.jsp">Q&A</a>
    </div>
    
  </div>
    
    <hr class="featurette-divider ">
     <!-- 서브메뉴 -->
    
<div id="center" class="row" >
      <div class="col-lg-4 " data-aos="fade-up">
       
	<img id="title_img" class="rounded-circle move_img"  src="imgs/food/rice.jpeg">
        <h2><i class="fa-solid fa-bell-concierge"></i>Food</h2>
        <p>음식을 추천해드려요! </p>
        <p><a class="btn btn-secondary" href="recommand/main.jsp#scrollcheck1">더보기 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-4 " data-aos="fade-up">
        	<img id="title_img" class="rounded-circle move_img"  src="imgs/cafe/macaron.jpg">

        <h2>Cafe</h2>
        <p>카페를 추천해드려요!</p>
        <p><a class="btn btn-secondary" href="recommand/main.jsp#scrollcheck2">더보기 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 " data-aos="fade-up">
      <img id="title_img" class="rounded-circle move_img"  src="imgs/etc/icecream.png">

        <h2>Etc</h2>
        <p>기타음식을 추천해드려요!</p>
        <p><a class="btn btn-secondary" href="recommand/main.jsp#scrollcheck3">더보기 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
</div><!-- /.row -->
    
    <hr class="featurette-divider ">
    
    <!-- START THE VIEW TOP1 -->
    <div class="container-xxl py-5" >
            <div class="text-center mx-auto mb-5 wow fadeInUp" >
                <h6 class="text-primary">Top Views</h6>
                <h1 class="mb-4">카테고리별 조회수 1등</h1>
   			 </div>
   			 <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" >
<%

String url="jdbc:mysql://localhost:3306/scott";
String _id="user01";
String pw="1234";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
String category="";
try{
Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection(url,_id,pw);
stmt=conn.createStatement();
for(int i=1;i<=3;i++){
rs=stmt.executeQuery("select * from total WHERE subnum="+i+" order by keyword desc limit 0,1");

	if(rs.next()){
		//첫 이미지 자르기
		String imgs=rs.getString("imgname");
		String[] img=imgs.split(",");
		String src="";
		int snum=rs.getInt("subnum");
		if(snum==1){
			src="imgs/food/";
			category="food";
		}else if(snum==2){
			src="imgs/cafe/";
			category="cafe";
		}else if(snum==3){
			src="imgs/etc/";
			category="etc";
		}
		src=src+img[0];
	%>
	<a id="sub-topa"href="recommand/maindetail.jsp?n=<%=rs.getInt("num") %>">
		<div class="card shadow-sm"  data-aos="fade-up">
            <img  id="sub-top" class="move_img bd-placeholder-img card-img-top" src="<%=src%>"/>

            <div class="card-body">
            <p><%=category %> - <span><%=rs.getString("kortitle") %></span></p>
              <p><%=rs.getString("content").length()>30?rs.getString("content").substring(0,30)+"..":rs.getString("content") %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button class="btn btn-sm btn-outline-secondary" type="button" >Detail</button>
                </div>
                <small class="text-muted">조회수 : <%=rs.getInt("keyword") %></small>
              </div>
            </div>
          </div>
	</a>

		
		<%
	}
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
   		
   			 
      </div>
    <!-- /END THE VIEW TOP1 --> 

  </div><!-- /.container -->
</div>

  <!-- FOOTER -->
  <%@ include file="template/footer.jspf" %>
</main>



</body>
</html>