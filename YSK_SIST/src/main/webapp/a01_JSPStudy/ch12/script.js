function loginCheck(){
	if(document.login.mem_id.value==""){
		alert("���̵𸦸� �Է��� �ּ���.");
		document.login.mem_id.focus();
		return;
	}
	if(document.login.mem_passwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.login.mem_passwd.focus();
		return;
	}
	document.login.submit();
}

function memberReg(){
	document.location="Register.jsp";
}

function inputCheck(){
	if(document.regForm.mem_id.value==""){
		alert("���̵� �Է��� �ּ���.");
		document.regForm.mem_id.focus();
		return;
	}
	if(document.regForm.mem_passwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.regForm.mem_passwd.focus();
		return;
	}
	if(document.regForm.mem_repasswd.value==""){
		alert("��й�ȣ�� Ȯ���� �ּ���");
		document.regForm.mem_repasswd.focus();
		return;
	}
	if(document.regForm.mem_name.value==""){
		alert("�̸��� �Է��� �ּ���.");
		document.regForm.mem_name.focus();
		return;
	}
	if(document.regForm.mem_num1.value==""){
		alert("�ֹι�ȣ�� �Է��� �ּ���.");
		document.regForm.mem_num1.focus();
		return;
	}
	if(document.regForm.mem_num2.value==""){
		alert("�ֹι�ȣ�� �Է��� �ּ���.");
		document.regForm.mem_num2.focus();
		return;
	}
	if(document.regForm.mem_email.value==""){
		alert("�̸����� �Է��� �ּ���.");
		document.regForm.mem_email.focus();
		return;
	}
	if(document.regForm.mem_phone.value==""){
		alert("����ó�� �Է��� �ּ���.");
		document.regForm.mem_phone.focus();
		return;
	}
	if(document.regForm.mem_job.value=="0"){
		alert("������ ������ �ּ���.");
		document.regForm.mem_job.focus();
		return;
	}
	
	if(document.regForm.mem_passwd.value != document.regForm.mem_repasswd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.regForm.mem_repasswd.focus();
		return;
	}
	document.regForm.submit();
}

//ID�ߺ�üũ�� �˻�
function idCheck(id){
	if(id == ""){
		alert("���̵� �Է��� �ּ���.");
	}else{
		url="IdCheck.jsp?mem_id=" + id;
		window.open(url,"post","width=300,height=150");
	}
}

function zipCheck(){
		url="ZipCheck.jsp?check=y";
		window.open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
}

function win_close(){
	self.close();
}
