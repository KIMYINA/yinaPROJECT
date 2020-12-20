/**
 * 회원가입시 이메일, 아이디 유효성검사 /중복확
 */

$(function(){
		//이메일 셀렉트 or직접입력
		$('#email2').change(function(){
			if($(this).val()=='etc'){
				$('#email3').val('');
				$('#email3').css('visibility','visible');
				$('#email3').focus();				
			}else{
				$('#email3').css('visibility','hidden');				
			}	
		});
		
		//아이디체크창
		$('#btnChkId').click(function(){
			open("checkId.jsp?memid="+$('#memid').val(), "chk",
	"width=400,height=300,left=0,top=0,location=yes,resizable=yes");
		});
		

});

	function validate_userid(id){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);
		/*
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
		끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미
		*/
	}
	//register에서 잘라옴
	
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
		/*
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
		*/
	}
	//register에서 잘라옴