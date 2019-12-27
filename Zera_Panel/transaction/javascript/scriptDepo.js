/*************************************   deposit.jsp *************************************/
const table1 = document.getElementsByTagName('table')[0];
let table2 = document.getElementsByTagName('table')[1];
const sumberDana = document.querySelector('select');

sumberDana.addEventListener('input',function(){
	pilihanSumberDana = sumberDana.value;
	if(pilihanSumberDana == "Bank"){

		// Recreate table2
		table2.parentNode.removeChild(table2);
		table2 = document.createElement('table');
		table1.after(table2);

		// console.log("anda memilih bank");

		const trBank = document.createElement('tr');
		/***************************************************************/
		const tdBankLabel = document.createElement('td');
		const textTdBank = document.createTextNode('Bank');
		tdBankLabel.appendChild(textTdBank);
		trBank.appendChild(tdBankLabel);
		/***************************************************************/
		const tdBankDot = document.createElement('td');
		const textTdBankDot = document.createTextNode(':');
		tdBankDot.appendChild(textTdBankDot);
		trBank.appendChild(tdBankDot);
		/***************************************************************/
		const tdBankInput = document.createElement('td');
		const tdBankSelect = document.createElement('select');
		/***************************************************************/
		const tdBankOption1 = document.createElement('option');
		const textTdBankOption1 = document.createTextNode('BRI');
		tdBankInput.appendChild(tdBankSelect);
		tdBankSelect.appendChild(tdBankOption1);
		tdBankOption1.appendChild(textTdBankOption1);
		tdBankOption1.setAttribute('value','BRI');
		/***************************************************************/
		const tdBankOption2 = document.createElement('option');
		const textTdBankOption2 = document.createTextNode('BNI');
		tdBankInput.appendChild(tdBankSelect);
		tdBankSelect.appendChild(tdBankOption2);
		tdBankOption2.appendChild(textTdBankOption2);
		tdBankOption2.setAttribute('value','BNI');
		/***************************************************************/
		const tdBankOption3 = document.createElement('option');
		const textTdBankOption3 = document.createTextNode('BCA');
		tdBankInput.appendChild(tdBankSelect);
		tdBankSelect.appendChild(tdBankOption3);
		tdBankOption3.appendChild(textTdBankOption3);
		tdBankOption3.setAttribute('value','BCA');
		/***************************************************************/
		const tdBankOption4 = document.createElement('option');
		const textTdBankOption4 = document.createTextNode('Mandiri');
		tdBankInput.appendChild(tdBankSelect);
		tdBankSelect.appendChild(tdBankOption4);
		tdBankOption4.appendChild(textTdBankOption4);
		tdBankOption4.setAttribute('value','Mandiri');
		trBank.appendChild(tdBankInput);

		/***************************************************************/
		/***************************************************************/
		/***************************************************************/
		/***************************************************************/
		const trBankNoRek = document.createElement('tr');
		trBankNoRek.setAttribute('id','norek');
		/***************************************************************/
		const tdBankNoRek = document.createElement('td');
		const textTedBankNoRek = document.createTextNode('No Rek');
		tdBankNoRek.appendChild(textTedBankNoRek);
		trBankNoRek.appendChild(tdBankNoRek);
		/***************************************************************/
		const tdBankNoRekDot = document.createElement('td');
		const textTdBankNoRekDot = document.createTextNode(':');
		tdBankNoRekDot.appendChild(textTdBankNoRekDot);
		trBankNoRek.appendChild(tdBankNoRekDot);
		/***************************************************************/
		const tdBankNoRekInput = document.createElement('td');
		const inputBankNoRekInput = document.createElement('input');
		inputBankNoRekInput.setAttribute('type','text');
		inputBankNoRekInput.setAttribute('name','norek');
		tdBankNoRekInput.appendChild(inputBankNoRekInput)
		trBankNoRek.appendChild(tdBankNoRekInput);



		/***************************************************************/
		/***************************************************************/
		/***************************************************************/
		/***************************************************************/
		const trBankJumlahDana = document.createElement('tr');
		/***************************************************************/
		const tdBankJumlahDana = document.createElement('td');
		const textTdBankJumlahDana = document.createTextNode('Jumlah Dana');
		tdBankJumlahDana.appendChild(textTdBankJumlahDana);
		trBankJumlahDana.appendChild(tdBankJumlahDana);
		/***************************************************************/
		const tdBankJumlahDanaDot = document.createElement('td');
		const textTdBankJumlahDanaDot = document.createTextNode(':');
		tdBankJumlahDanaDot.appendChild(textTdBankJumlahDanaDot);
		trBankJumlahDana.appendChild(tdBankJumlahDanaDot);
		/***************************************************************/
		const tdBankJumlahDanaInput = document.createElement('td');
		const textBankJumlahDanaInput = document.createTextNode('Rp.');
		const inputBankJumlahDanaInput = document.createElement('input');
		inputBankJumlahDanaInput.setAttribute('type','text');
		inputBankJumlahDanaInput.setAttribute('name','jumlahdana');
		tdBankJumlahDanaInput.appendChild(textBankJumlahDanaInput);
		tdBankJumlahDanaInput.appendChild(inputBankJumlahDanaInput)
		trBankJumlahDana.appendChild(tdBankJumlahDanaInput);




		table2.appendChild(trBank);
		table2.appendChild(trBankNoRek);
		table2.appendChild(trBankJumlahDana);
	}else if(pilihanSumberDana == "OVO" || pilihanSumberDana == "Gopay"){
		// console.log("anda memilih ovo");

		// Recreate table2
		table2.parentNode.removeChild(table2);
		table2 = document.createElement('table');
		table1.after(table2);

		const trNoReceiver = document.createElement('tr');
		/***************************************************************/
		const tdNoReceiverLabel = document.createElement('td');
		const textNoReceiverLabel = document.createTextNode('Kirim ke no');
		tdNoReceiverLabel.appendChild(textNoReceiverLabel);
		trNoReceiver.appendChild(tdNoReceiverLabel);
		/***************************************************************/
		const tdNoReceiverDot = document.createElement('td');
		const textNoReceiverDot = document.createTextNode(':');
		tdNoReceiverDot.appendChild(textNoReceiverDot);
		trNoReceiver.appendChild(tdNoReceiverDot);
		/***************************************************************/
		const tdNoReceiver = document.createElement('td');
		const pNoReceiver = document.createElement('p');
		const textPNoReceiver = document.createTextNode('089696133160');
		pNoReceiver.appendChild(textPNoReceiver);
		tdNoReceiver.appendChild(pNoReceiver);
		trNoReceiver.appendChild(tdNoReceiver);
		/***************************************************************/
		const trJumlahDanaOvoDanGopay = document.createElement('tr');
		/***************************************************************/
		const tdJumlahDanaOvoDanGopay = document.createElement('td');
		const textJumlahDanaOvoDanGopay = document.createTextNode('Jumlah Dana');
		tdJumlahDanaOvoDanGopay.appendChild(textJumlahDanaOvoDanGopay);
		trJumlahDanaOvoDanGopay.appendChild(tdJumlahDanaOvoDanGopay);
		/***************************************************************/
		const tdJumlahDanaOvoDanGopayDot = document.createElement('td');
		const textJumlahDanaOvoDanGopayDot = document.createTextNode(':');
		tdJumlahDanaOvoDanGopayDot.appendChild(textJumlahDanaOvoDanGopayDot);
		trJumlahDanaOvoDanGopay.appendChild(tdJumlahDanaOvoDanGopayDot);
		/***************************************************************/
		const tdJumlahDanaOvoDanGopayInput = document.createElement('td');
		const textJumlahDanaOvoDanGopayInput = document.createTextNode('Rp.');
		const inputJumlahDanaOvoDanGopay = document.createElement('input');
		inputJumlahDanaOvoDanGopay.setAttribute('type','text');
		inputJumlahDanaOvoDanGopay.setAttribute('name','jumlahdana');
		tdJumlahDanaOvoDanGopayInput.appendChild(textJumlahDanaOvoDanGopayInput);
		tdJumlahDanaOvoDanGopayInput.appendChild(inputJumlahDanaOvoDanGopay);
		trJumlahDanaOvoDanGopay.appendChild(tdJumlahDanaOvoDanGopayInput);

		table2.appendChild(trNoReceiver);
		table2.appendChild(trJumlahDanaOvoDanGopay);
	}
});

/*************************************   withdraw.jsp *************************************/