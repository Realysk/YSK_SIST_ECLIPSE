function inputCheck(){
	if(document.regForm.id.value==""){
		alert("���̵� �Է��� �ּ���");
		document.regForm.id.focus();
		return;
	}
	if(document.regForm.pwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���");
		document.regForm.pwd.focus();
		return;
	}
	if(document.regForm.repwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.name.value==""){
		alert("�̸��� �Է��� �ּ���");
		document.regForm.name.focus();
		return;
	}
	if(document.regForm.birthday.value==""){
		alert("��������� �Է��� �ּ���");
		document.regForm.birthday.focus();
		return;
	}
	if(document.regForm.email.value==""){
		alert("�̸����� �Է��� �ּ���");
		document.regForm.email.focus();
		return;
	}

	if(document.regForm.pwd.value != document.regForm.repwd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		document.regForm.repwd.focus();
		return;
	}
	document.regForm.submit();
}