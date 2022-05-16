	function goBack(){
		window.history.back();
	}
	function check(){
		console.log($('#username').val());
		console.log($('#password').val());
	}
	window.onload=function(){
		var headerbtn=document.querySelector('#headerbtn');
		headerbtn.onclick=function(){//헤더 
			if($('.real_header').attr('class')=='collapse navbar-collapse real_header')
				$('.real_header').attr('class','navbar-collapse real_header');
			else
				$('.real_header').attr('class','collapse navbar-collapse real_header');
		}
		//
		
		$('#modals').css('display','none')
		$('#go-delete').attr("disabled","disabled");
		$('#go-update').attr("disabled","disabled");
		var btn=document.querySelector('#editbt');
		btn.onclick=function(){
			if($('#upde').css('display')=='none')
				$('#upde').css('display','block');
				else
					$('#upde').css('display','none');
			
		};
		
		var btn2=document.querySelector('#btck');
		btn2.onclick=function(){
			if($('#username').val()==$('#username').attr('name')&& 
					$('#password').attr('name')==$('#password').val())
				{
					$('#msg').text("확인되었습니다.");
					$('#btck').attr("disabled","disabled");
					$('#btck').innerText="Checked";
					$('#username').css('display','none').next().css('display','none');
					$('#password').css('display','none').next().css('display','none');
					$('#go-delete').removeAttr("disabled");
					$('#go-update').removeAttr("disabled");
				}
			else{
				$('#msg').text("다시 입력해주세요.");
				
			}
			
		}
		var btn3=document.querySelector('#go-delete');
		btn3.onclick=function(){
			if($('#modals').css('display')=='none')
				$('#modals').css('display','block');
				else
					$('#modals').css('display','none');
		}
		var btn4=document.querySelector('#nobt');
		btn4.onclick=function(){
			if($('#modals').css('display')=='block')
				$('#modals').css('display','none');
				else
					$('#modals').css('display','block');
		}
	}