/*************************************   withdraw.jsp *************************************/
const table1 = document.getElementsByTagName('table')[0];
let table2 = document.getElementsByTagName('table')[1];
const KirimKe = document.querySelector('select');

KirimKe.addEventListener('input',function(){
	pilihanKirimKe = KirimKe.value;
	if(pilihanKirimKe == "Bank"){

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
		const inputBankJumlahDanaInput = document.createElement('input');
		inputBankJumlahDanaInput.setAttribute('type','text');
		inputBankJumlahDanaInput.setAttribute('name','jumlahdana');
		tdBankJumlahDanaInput.appendChild(inputBankJumlahDanaInput)
		trBankJumlahDana.appendChild(tdBankJumlahDanaInput);




		table2.appendChild(trBank);
		table2.appendChild(trBankNoRek);
		table2.appendChild(trBankJumlahDana);
	}else if(pilihanKirimKe == "OVO" || pilihanKirimKe == "Gopay"){
		// console.log("anda memilih ovo");

		// Recreate table2
		table2.parentNode.removeChild(table2);
		table2 = document.createElement('table');
		table1.after(table2);

		const trNoDestination = document.createElement('tr');
		/***************************************************************/
		const tdNoDestinationLabel = document.createElement('td');
		const textNoDestinationLabel = document.createTextNode('Kirim ke no');
		tdNoDestinationLabel.appendChild(textNoDestinationLabel);
		trNoDestination.appendChild(tdNoDestinationLabel);
		/***************************************************************/
		const tdNoDestinationDot = document.createElement('td');
		const textNoDestinationDot = document.createTextNode(':');
		tdNoDestinationDot.appendChild(textNoDestinationDot);
		trNoDestination.appendChild(tdNoDestinationDot);
		/***************************************************************/
		const tdNoDestination = document.createElement('td');
		const inputNoDestination = document.createElement('input');
		inputNoDestination.setAttribute('type','text');
		inputNoDestination.setAttribute('name','nohp');
		tdNoDestination.appendChild(inputNoDestination);
		trNoDestination.appendChild(tdNoDestination);
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
		const inputJumlahDanaOvoDanGopay = document.createElement('input');
		inputJumlahDanaOvoDanGopay.setAttribute('type','text');
		inputJumlahDanaOvoDanGopay.setAttribute('name','jumlahdana');
		tdJumlahDanaOvoDanGopayInput.appendChild(inputJumlahDanaOvoDanGopay);
		trJumlahDanaOvoDanGopay.appendChild(tdJumlahDanaOvoDanGopayInput);

		table2.appendChild(trNoDestination);
		table2.appendChild(trJumlahDanaOvoDanGopay);
	}
});
