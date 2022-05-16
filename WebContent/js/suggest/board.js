
    function newbt(){
       location.href="add.jsp";
    }
    window.onload=function(){
    	   const urlParams = new URL(location.href).searchParams;
    	    var lastpage = $('#pagenum').attr('name');
    		 var page = urlParams.get('p');//현재 페이지 번호
    		 if(page==null) page=1;
    		 var key = urlParams.get('keyword');//현재 페이지 번호
    		 var opt = urlParams.get('a');//현재 페이지 번호
    		 
    		
       var headerbtn=document.querySelector('#headerbtn');
      headerbtn.onclick=function(){//헤더 
         if($('.real_header').attr('class')=='collapse navbar-collapse real_header')
            $('.real_header').attr('class','navbar-collapse real_header');
         else
            $('.real_header').attr('class','collapse navbar-collapse real_header');
      }
     
      $('#natag').removeAttr('href');
       if(lastpage==0){
    		  $('#pagenum').text('존재하지 않는 데이터 입니다.');
    	}else
      		$('#pagenum').text(page+'/'+lastpage+'');
     
      $('#front').on('click',function(){
    	  if(page==null)page=1;
    		  if(page==lastpage||lastpage==0){
    			  $('#front').attr('disabled',true);
    		  }
    	 	 else{
	    	  page++;
	    	  if(key ==null) key="";
	    	  if(opt==null) opt="title";
			location.href="board.jsp?p="+page+"&a="+opt+"&keyword="+key;
    	  }
         
      });
      $('#back').on('click',function(){
    	
    	  if(page==null)page=1;
    		  if(page==1){
    			  $('#back').attr('disabled',true);
    		  }
    	 	 else{
	    	  page--;
	    	  if(key ==null) key="";
	    	  if(opt==null) opt="title";
			location.href="board.jsp?p="+page+"&a="+opt+"&keyword="+key;
    	  }
          
       });
   }