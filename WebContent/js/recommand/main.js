  window.onload=function(){
    	AOS.init();
    	 var headerbtn=document.querySelector('#headerbtn');
 		headerbtn.onclick=function(){//헤더 
 			if($('.real_header').attr('class')=='collapse navbar-collapse real_header')
 				$('.real_header').attr('class','navbar-collapse real_header');
 			else
 				$('.real_header').attr('class','collapse navbar-collapse real_header');
 		}
		//헤더 
		
 		  var callback3 = function(){
              $('#ca>ul>li').first().appendTo('#ca>ul');
             setTimeout(callback3,2000);
              
           };
           callback3();
          if($('#check-bg').attr('name')=='false'){
          	$('#btn_list').css('display','none');
          }else
         	 $('#btn_list').css('display','block');
          
	}
    
    $(window).resize(function (){
		//메소드 호출
		scroll();
		
	});
    
    function scroll(){
    	var windowWidth = $(window).width(); //요소의 너비를 반환
    		if(windowWidth<700)
    			{
    			$('html').css("overflow-x","hidden");
    			
    			}
    		else
    			$('html').css("overflow","none");
    	
    }