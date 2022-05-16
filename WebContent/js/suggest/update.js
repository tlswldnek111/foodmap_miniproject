	window.onload=function(){
		var headerbtn=document.querySelector('#headerbtn');
		headerbtn.onclick=function(){//헤더 
			if($('.real_header').attr('class')=='collapse navbar-collapse real_header')
				$('.real_header').attr('class','navbar-collapse real_header');
			else
				$('.real_header').attr('class','collapse navbar-collapse real_header');
		}
		//
		$('#modals').css('display','none');
		$('#remodals').css('display','none');
		// 내용 글자수 세기 
		$('#message-text').attr('check','true');
		$('#title').attr('check','true');
		$('#message-text').keyup(function (e) { let content = $(this).val(); 
		if (content.length == 0 || content == '') { $('.textCount').text('0자/500자'); } 
		else { $('.textCount').text(content.length + '자/500자'); } // 글자수 제한 
		if (content.length > 500) { // 500자 부터는 타이핑 되지 않도록
			$(this).val($(this).val().substring(0, 500)); // 500자 넘으면 알림창 뜨도록
			}
		else if(content.length>=10){//10자이상
			$('#message-text').val(ConvertSystem($('#message-text').val()));
			$('#message-text').attr('check','true');
		}
		else{
			$('#message-text').attr('check','false');
		}
		})
		// 제목 글자수 세기 
		if($('#title').val.length>=10) $('#title').attr('check','true');
		$('#title').keyup(function (e) { let content = $(this).val(); 
		if (content.length > 100) { // 100자 부터는 타이핑 되지 않도록
			$(this).val($(this).val().substring(0, 100)); // 500자 넘으면 알림창 뜨도록
			}
		else if(content.length>=10){
			$('#title').val(ConvertSystem($('#title').val()));
			$('#title').attr('check','true');
		}
		else{
			$('#title').attr('check','false');
		}
		})
		// 아이디 
		$('#writer').attr('check','true');
		// 비밀번호
		$('#password').attr('check','true');
		
		
		var mdbtn=document.querySelector('#modalbt');
		mdbtn.onclick=function(){
			if($('#modals').css('display')=='none' 
				&& $('#password').attr('check')=='true'
				&& $('#message-text').attr('check') =='true' 
				&& $('#title').attr('check') =='true'
				&& $('#writer').attr('check') =='true')
			{//성공
				$('#modals').css('display','block');
				//$('#remodals').css('display','none');
			}else if($('#modals').css('display')=='none' )
			{//글자수 입력 잘못했을 경우
				//$('#modals').css('display','none');
				$('#remodals').css('display','block');
			}
			
		};
		
		var btn=document.querySelector('#nobt');
		btn.onclick=function(){
			if($('#modals').css('display')=='block')
			{$('#modals').css('display','none');
			}
		
		};
		var btn2=document.querySelector('#nobt2');
		btn2.onclick=function(){
			if($('#remodals').css('display')=='block')
			{$('#remodals').css('display','none');
			}
		
		};

		function ConvertSystem(str){//"', 다른글자로 바꾸기
		 str = str.replace(/\"/g,"");
		 str = str.replace(/\'/g,"");
		 return str;
		}
		
		$('#go-back').click(function(e){
			window.history.back();
		});
		
		};