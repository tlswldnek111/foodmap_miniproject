<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../template/head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/suggest/board.css">  
<script type="text/javascript" src="../js/suggest/board.js"></script>  
<title>suggestions</title>
</head>
<body >
<% String myPath=".."; %>

<%@ include file="../template/header.jspf" %> 
<!-- header -->
<div id="cenimg">
   <img id="mainimg" class="img-fluid mx-auto"src="../imgs/suggest.png">
</div>
   <div id="h11" class="container-fluid ">
   
   <h1 id="notice" class="text-muted font">Q&A</h1>
   
   </div>
     <%  String keyword=request.getParameter("keyword");
     if(keyword==null) keyword="";//검색
   	 keyword= new String(keyword.getBytes("iso-8859-1"));
        
         String option=request.getParameter("a");
         if(option==null) option="title";
         //현 페이지 정보 설정
         String pageNum=request.getParameter("p");
         if(pageNum==null){
            pageNum="1";
         }
    %>
<div id="search" class="container-fluid d-flex font">
       <form class="d-flex" >
          <select name="a">
             <option value="title" name="a" selected >제목</option>
             <option value="writer" name="a" >작성자</option>
          </select>
             <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
             <button id="searchbt" class="btn btn-outline-success" type="submit" >검색</button>
           
        </form>
        <button id="newbt" class="btn btn-outline-success" type="submit" onClick="newbt()">글 작성</button>
      
</div>
 
<div id="center" class="row" >

<table id="tb" class="table table-hover font">

  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
   <%
   
      int pg=1;
   String url="jdbc:mysql://localhost:3306/scott";
   String _id="user01";
   String pw="1234";
   Connection conn=null;
   Statement stmt=null;
   ResultSet rs=null;
   
   int count=0;//전체행 갯수
   int p=1;//현재 페이지 번호
   int pageSize=10;//페이지에 출력될 글 수
   
   try{
   Class.forName("com.mysql.cj.jdbc.Driver");
   conn=DriverManager.getConnection(url,_id,pw);
   stmt=conn.createStatement();
   
   rs=stmt.executeQuery("select * from suggest where "+option+" LIKE '%"+keyword+"%'");
   
   while(rs.next()){
      count+=1;//게시글 갯수
   }
   //페이지 갯수
   pg=(count%pageSize==0)?count/pageSize:count/pageSize+1;
   
   
   rs=stmt.executeQuery("select num, title, writer, date_format(dt,'%m-%d') from suggest where "+option+" LIKE '%"+keyword+"%'order by num desc limit "+pageSize*(Integer.parseInt(pageNum)-1)+","+pageSize);
   
   while(rs.next()){
      
   %>
   <tr scope="row">
   
      <td><a id="atag" href="detail.jsp?n=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
      <td><a id="atag" href="detail.jsp?n=<%=rs.getString(1) %>"><%=rs.getString(2).length()>10?rs.getString(2).substring(0,10)+"..":rs.getString(2)+".." %></a></td>
      <td><a id="atag" href="detail.jsp?n=<%=rs.getString(1) %>"><%=rs.getString(3).length()>3?rs.getString(3).substring(0,3)+"**":rs.getString(3)+"**" %></a></td>
      <td><a id="atag" href="detail.jsp?n=<%=rs.getString(1) %>"><%=rs.getString(4) %></a></td>
   </tr>
   <%
       
   }
   
   }finally{
      if(rs!=null)rs.close();
      if(stmt!=null)stmt.close();
      if(conn!=null)conn.close();
   }
   
   %>
  </tbody>
  
</table>
   
   
   
 	   <div id="pagenum" name=<%=pg %> class="font"></div>
 		<p id="pa" align="center">
   		 <button id="back"  class="btn btn-outline-dark font">이전페이지</button>
   	 	  <button id="front"  class="btn btn-outline-dark font" >다음페이지</button>
         </p>
      
    
     
</div>

<!-- FOOTER -->
  <%@ include file="../template/footer.jspf" %>

</body>
</html>