// Untuk teks input
const input = document.querySelectorAll('input[type=text]');

input[0].addEventListener('keydown',function(){
	input[0].style.transition = '.3s';
	input[0].style.borderBottom = '1px solid black';
});

input[1].addEventListener('keydown',function(){
	input[1].style.transition = '.3s';
	input[1].style.borderBottom = '1px solid black';
});

input[2].addEventListener('keydown',function(){
	input[2].style.transition = '.3s';
	input[2].style.borderBottom = '1px solid black';
});

// Validasi nama
const nama = document.querySelectorAll('input[type=text')[0];
nama.addEventListener('input',function(){
	if(/^[a-z]/gi.test(nama.value)){
		nama.removeAttribute('class');
	}else{
		nama.setAttribute('class','wrongInput');
	}
});

// Validasi no telepon
const noTelp = document.querySelectorAll('input[type=text')[2];
noTelp.addEventListener('input',function(){
	if(/\D/g.test(noTelp.value)){
		noTelp.setAttribute('class','wrongInput');
	}else{
		noTelp.removeAttribute('class');
	}
});