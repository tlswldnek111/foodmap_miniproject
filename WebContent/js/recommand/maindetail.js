window.onload=function(){
		
	 var headerbtn=document.querySelector('#headerbtn');
	headerbtn.onclick=function(){//헤더 
		if($('.real_header').attr('class')=='collapse navbar-collapse real_header')
			$('.real_header').attr('class','navbar-collapse real_header');
		else
			$('.real_header').attr('class','collapse navbar-collapse real_header');
	}
	//헤더 
	
			scroll();
			mapscroll();
			
	 $(window).resize(function (){
			//메소드 호출
			scroll();
			mapscroll();
		});
	    
	    function scroll(){
	    	var windowWidth = $(window).width(); //요소의 너비를 반환
	    		if(windowWidth<600)
	    			{
	    			$('html').css("overflow-x","hidden");
	    			$('#message-text').css("width","400px").css("margin","50px 20px");
	    			$('#mmap').css('text-align','left');
	    			$('#box').css("width","500px");
	    			}
	    		else
	    			{$('html').css("overflow","none");
	    			$('#message-text').css("width","600px").css("margin","50px auto");
	    			$('#mmap').css('text-align','center');
	    			$('#box').css("width","800px");
	    			}
	    }
	
	$('#go-back').click(function(e){
			window.history.back();
		});
};