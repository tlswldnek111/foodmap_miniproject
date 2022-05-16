<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/suggest/update.css">
<title>updSug</title>
 <jsp:include page="../template/head.jsp"></jsp:include>
 <script type="text/javascript" src="../js/suggest/update.js"></script>
</head>

 <body id="ma" class="bg-light" >
    <% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %> 
<!-- header -->
<div class="container font">
  
    <div class="py-5 text-center">
      
      <h2>글 수정</h2>
    </div>
<%
 	int num = Integer.parseInt(request.getParameter("num"));
	String url="jdbc:mysql://localhost:3306/scott";
	String _id="user01";
	String pw="1234";
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
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	%>

      <div class="center">
        <h4 class="mb-3">특수문자 "와 '은 입력이 제한됩니다.</h4>
        <form class="needs-validation" novalidate method="post" action="realupdate.jsp">
          <div class="row g-3">
            <div class="col-sm-6">
            	<input type="hidden" name="num" value="<%=num%>">
              <label for="firstName" class="form-label">작성자 명(한글/영어) </label>
              <input type="text" class="form-control" id="writer" value="<%=arr[2] %>" required readonly>
              
            </div>

            <div class="col-sm-6">
              <label for="pw" class="form-label">비밀번호 </label>
              <input type="password" class="form-control" id="password"  value="<%=arr[3] %>" required readonly>
              </div>
			</div>
			<br>
			<div class="row g-3">
			 <div class="col-sm">
			<label for="firstName" class="form-label">제목</label>
              <input type="text" class="form-control" id="title" name="title" value="<%=arr[1] %>" required>
              </div>
			</div>
			
		<div id="btns" class="row g-3">
            <div class="col-sm-6">
		 <label id="content" for="content"  class="form-label">내용</label>
		 </div>
		<div class="textLengthWrap col-sm-6"> 
		<p class="textCount"></p>
		 </div>

		</div>

 			<textarea class="form-control content" name="content" id="message-text" maxlength="500" required ><%=arr[4] %></textarea>
		<div id="btns" class="d-grid gap-2 d-sm-flex justify-content-sm-center">
          <button id="modalbt" class="fullbtn btn btn-primary btn-lg px-4 gap-3" type="button">수정하기</button>
        
          <button id="go-back" class="fullbtn btn btn-outline-secondary btn-lg px-4 gap-3" type="button">뒤로가기</button>
        </div>
      </div>
    
 
<div id="modals">
<div  class=" modal modal-alert position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalChoice">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-body p-4 text-center">
        <h5 class="mb-0">수정을 완료하시겠습니까?</h5>
        <p class="mb-0"></p>
      </div>
      <div class="modal-footer flex-nowrap p-0">
        <button id="yesbt"  type="submit" class=" fullbtn btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-right"><strong>네</strong></button>
        <button id="nobt" type="button" class="fullbtn btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>
 </div>
  </form>
  
  <div id="remodals">
<div  class=" modal modal-alert position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalChoice">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-body p-4 text-center">
        <h5 class="mb-0">다시 입력해 주세요.</h5>
        <p class="mb-0">
        	제목과 내용은 10자 이상 입력 바랍니다.
        </p>
      </div>
      <div class="modal-footer flex-nowrap p-0">
       
        <button id="nobt2" type="button" class="fullbtn btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">돌아가기</button>
      </div>
    </div>
  </div>
</div>
 </div>

<!-- FOOTER -->
  <%@ include file="../template/footer.jspf" %>
	</div>


   
  </body>
</html>