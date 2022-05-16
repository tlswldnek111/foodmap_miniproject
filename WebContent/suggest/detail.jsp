<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE >
<html>
<head>
<title>sugdetail</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/suggest/detail.css">
<script type="text/javascript" src="../js/suggest/detail.js"></script>
</head>

<body>
<% String myPath=".."; %>
<%@ include file="../template/header.jspf" %> 
<!-- header -->
<div id="cenimg">
	<img id="mainimg" class="img-fluid mx-auto"src="../imgs/suggest.png">
</div>

 <%
 	int num = Integer.parseInt(request.getParameter("n"));
	String url="jdbc:mysql://localhost:3306/scott";
	String _id="user01";
	String pw="1234";
	String str="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String [] arr=new String[6]; 
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(url,_id,pw);
	stmt=conn.createStatement();
	
	rs=stmt.executeQuery("select * from suggest where num="+num);
	
	if(rs.next()){
		for(int i=0;i<6;i++){
			arr[i]=rs.getString(i+1);
		}

	}
	System.out.println(arr[2]+" "+arr[3]);
	
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	%>
  <div class="px-4 py-5 my-5  justify-content-sm-center font">
  <div class=" col-lg-6 mx-auto">
   <div class="justify-content-sm-center">
	   <h5 class="pb-2 border-bottom ">제목 : <%=arr[1] %></h5>
	    
	   <p >작성자 : <%=arr[2].length()>3?arr[2].substring(0,3)+"**":arr[2]+"**" %></p>
	   <p >작성일자 : <%=arr[5] %></p>
	   
   		 <textarea class="form-control content" id="message-text"  readonly><%=arr[4] %></textarea>
    </div>
    
    
      <div id="btns" class="d-grid gap-2 d-sm-flex justify-content-sm-center">
        <button id="editbt" type="button" class="btn btn-primary btn-lg px-4 gap-3">수정/삭제</button>
        <button id="go-back" type="button" onClick="goBack()" class="btn btn-outline-secondary btn-lg px-4">뒤로가기</button>
      </div>
    </div>
  </div>
  
  <div id="upde" class="form-signin text-center font">
 
    
    <p id="msg" class="h3 mb-3 fw-normal">작성자 명과 pw를 입력하세요.</p>

    <div class="form-floating">
      <input id="username" type="username" class="form-control" id="floatingInput" placeholder="UserName" name="<%=arr[2] %>">
      <label for="floatingInput" >User name</label>
    </div>
    <div class="form-floating">
      <input id="password" type="password" class="form-control" id="floatingPassword" placeholder="Password"  name="<%=arr[3] %>">
      <label for="floatingPassword">Password</label>
    </div>

   
    <button id="btck"class="w-100 btn btn-outline-secondary btn-lg px-4 " type="submit" >Check</button>
 
	
	<form action="update.jsp" method="post">
	 <div id="btns" class="d-grid gap-2 d-sm-flex justify-content-sm-center">
	 <input type="hidden" name="num" value="<%=arr[0]%>">
        <button id="go-update" type="submit" class="btn btn-primary btn-lg px-4 gap-3">수정</button>
        </form>
        <form action="delete.jsp" method="post">
        <input type="hidden" name="num" value="<%=arr[0]%>">
        <button  id="go-delete" type="button" class="btn btn-primary btn-lg px-4 gap-3  ">삭제</button>
				      <div id="modals">
				<div  class=" modal modal-alert position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalChoice">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content rounded-4 shadow">
				      <div class="modal-body p-4 text-center">
				        <h5 class="mb-0">삭제하시겠습니까?</h5>
				        <p class="mb-0"></p>
				      </div>
				      <div class="modal-footer flex-nowrap p-0">
				        <button id="yesbt"  type="submit" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-right"><strong>네</strong></button>
				        <button id="nobt" type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니요</button>
				      </div>
				    </div>
				  </div>
				</div>
				 </div>
      
      
      
      </div>
	 </form>
	</div>





<!-- FOOTER -->
  <%@ include file="../template/footer.jspf" %>
</body>
</html>