window.onload=function(){
		AOS.init();
	 var headerbtn=document.querySelector('#headerbtn');
		headerbtn.onclick=function(){//헤더 
			if($('.real_header').attr('class')=='collapse navbar-collapse real_header')
				$('.real_header').attr('class','navbar-collapse real_header');
			else
				$('.real_header').attr('class','collapse navbar-collapse real_header');
		}
	};