<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <jsp:include page="../template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/suggest/add.css">  
<title>AddSug</title>
<script type="text/javascript" src="../js/suggest/add.js"></script>  
</head>
 <body id="ma" class="bg-light">
    <% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %> 
<!-- header -->
<div class="container font">
  
    <div class="py-5 text-center">
      
      <h2>글 작성</h2>
      <p class="lead">찾아주셔서 감사합니다. 부족한 부분이 있거나, 추가적으로 가게를 추천하고 싶으신 경우 아래의 빈 항목들을 채워서 글을 작성해주시면 참고하여 개선하도록 하겠습니다.</p>
    </div>

      <div class="center">
        <h4 class="mb-3">특수문자 "와 '은 입력이 제한됩니다.</h4>
        <form class="needs-validation" novalidate method="post" action="insert.jsp">
          <div class="row g-3">
            <div class="col-sm-6">
              <label id="laname"for="firstName" class="form-label">작성자 명(한글/영어) </label>
              <input type="text" class="form-control" id="writer" name="id" value="" required placeholder="5자 이상 입력해주세요.">
              
            </div>

            <div class="col-sm-6">
              <label id="lapw" for="pw" class="form-label">비밀번호(영어) </label>
              <input type="password" class="form-control" id="password" name="pw" value="" required placeholder="5자 이상 입력해주세요.">
              </div>
			</div>
			<div class="row g-3">
			 <div class="col-sm">
			<label id="latitle" for="firstName" class="form-label">제목</label>
              <input type="text" class="form-control" id="title" name="title" value="" required placeholder="10자 이상 입력해주세요.">
              </div>
			</div>
			
		<div id="btns" class="row g-3">
            <div class="col-sm-6">
		 <label id="content" for="content"  class="form-label">내용</label>
		 </div>
		<div class="textLengthWrap col-sm-6"> 
		<p class="textCount">0자</p>
		 </div>

		</div>

 			<textarea class="form-control content" name="content" id="message-text" maxlength="500" required placeholder="10자 이상 입력해주세요."></textarea>
		<div id="btns" class="d-grid gap-2 d-sm-flex justify-content-sm-center">
          <button id="modalbt" class="btn btn-primary btn-lg px-4 gap-3" type="button">작성하기</button>
          <button id="go-back" type="button" class="btn btn-outline-secondary btn-lg px-4 gap-3">뒤로가기</button>
        </div>
      </div>
    
 
<div id="modals">
<div  class=" modal modal-alert position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalChoice">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-body p-4 text-center">
        <h5 class="mb-0">작성을 완료하시겠습니까?</h5>
        <p class="mb-0"></p>
      </div>
      <div class="modal-footer flex-nowrap p-0">
        <button id="yesbt"  type="submit" class="btn btn-lg btn-link fs-6 text-decoration-none m-0 rounded-0 border-right"><strong>네</strong></button>
        <button id="nobt" type="button" class="btn btn-lg btn-link fs-6 text-decoration-none m-0 rounded-0" data-bs-dismiss="modal">아니요</button>
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
        	작성자 명과 비밀번호는 5자이상 입력 바랍니다.<br>
        	제목과 내용은 10자 이상 입력 바랍니다.
        </p>
      </div>
      <div class="modal-footer flex-nowrap p-0">
       
        <button id="nobt2" type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">돌아가기</button>
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