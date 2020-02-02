var txtFirstName = document.getElementById("txtFirstName");
var txtMiddleName = document.getElementById("txtMiddleName");
var txtLastName = document.getElementById("txtLastName");
var txtFatherName = document.getElementById("txtFatherName");
var txtEmail = document.getElementById("txtEmail");
var txtContactNo = document.getElementById("txtContactNo");
var txtSalary = document.getElementById("txtSalary");
var txtAadhaarNo = document.getElementById("txtAadhaarNo");
var btnSubmit = document.getElementById("btnSubmit");
var btnCancel =document.getElementById("btnCancel");
var message;
var status = true;

function split(value, delimiter) {
	var left, right, len = value.length;
	left = right = "";
    for (i = 0; i < len; ++i) {
		if(value[i] == delimiter){
			break;
        }
        left += value[i];
    }
    for(i = i + 1; i < len; ++i) {
		right += value[i];
	}
	var part = [left, right];
	console.log(part);
    return part;
}
function resetFirstNameErrMessage() {
	message = document.getElementById("errFirstName");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errFirstNameNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetMiddleNameErrMessage() {
	message = document.getElementById("errMiddleNameNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetLastNameErrMessage() {
	message = document.getElementById("errLastName");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errLastNameNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetFatherNameErrMessage() {
	message = document.getElementById("errFatherName");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errFatherNameNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetEmailErrMessage() {
	message = document.getElementById("errEmail");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errEmailNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetContactNoErrMessage() {
	message = document.getElementById("errContactNo");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errContactNoNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetSalaryErrMessage() {
	message = document.getElementById("errSalary");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errSalaryNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errSalaryTooBig");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetDOBErrMessage() {
	message = document.getElementById("errDOBNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetAadhaarNoErrMessage() {
	message = document.getElementById("errAadhaarNoNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}

function checkFirstName() {
	var notProperSingleName = /([^A-Za-z])/;
	if (txtFirstName.value == "") {
		status = false;
		document.getElementById("errFirstName").classList.remove("hidden");
		document.getElementById("errFirstName").classList.add("visible");
	} else if (notProperSingleName.test(txtFirstName.value)) {
		status = false;
		document.getElementById("errFirstNameNotProper").classList.remove("hidden");
		document.getElementById("errFirstNameNotProper").classList.add("visible");
	}
	return status;
}
function checkMiddleName() {
	var notProperSingleName = /([^A-Za-z])/;
	if (txtMiddleName.value != "" && notProperSingleName.test(txtMiddleName.value)) {
		status = false;
		document.getElementById("errMiddleNameNotProper").classList.remove("hidden");
		document.getElementById("errMiddleNameNotProper").classList.add("visible");
	}
	return status;
}
function checkLastName() {
	var notProperSingleName = /([^A-Za-z])/;
	if (txtLastName.value == "") {
		status = false;
		document.getElementById("errLastName").classList.remove("hidden");
		document.getElementById("errLastName").classList.add("visible");
	} else if (txtLastName.value != "" && notProperSingleName.test(txtLastName.value)) {
		status = false;
		document.getElementById("errLastNameNotProper").classList.remove("hidden");
		document.getElementById("errLastNameNotProper").classList.add("visible");
	}
	return status;
}
function checkFatherName() {
	var notProperFullName = /[^A-Za-z|\s*]/;
	if (txtFatherName.value == "") {
		status = false;
		document.getElementById("errFatherName").classList.remove("hidden");
		document.getElementById("errFatherName").classList.add("visible");
	} else if (notProperFullName.test(txtFatherName.value)) {
		status = false;
		document.getElementById("errFatherNameNotProper").classList.remove("hidden");
		document.getElementById("errFatherNameNotProper").classList.add("visible");
	}
	return status;
}
function checkEmail() {
	if (txtEmail.value == "") {
		status = false;
		document.getElementById("errEmail").classList.remove("hidden");
		document.getElementById("errEmail").classList.add("visible");
	} else {
		var parts = split(txtEmail.value, '@');
		if (parts[0] == "") {
			parts[0] = "@";
		} else if (parts[1] == "") {
			parts[1] = "@";
		}
		var notProperEmailID = /([^A-Za-z0-9|\.|_|-])+/;
		var notProperDomain = /([^A-Za-z0-9|.])+/;
		if (notProperEmailID.test(parts[0]) || notProperDomain.test(parts[1])) {
			status = false;
			document.getElementById("errEmailNotProper").classList.remove("hidden");
			document.getElementById("errEmailNotProper").classList.add("visible");
		}
	}
	return status;
}
function checkContactNo() {
	var properContactNo = /(\d{10})/;
	if (txtContactNo.value == "") {
		status = false;
		document.getElementById("errContactNo").classList.remove("hidden");
		document.getElementById("errContactNo").classList.add("visible");
	} else if (!properContactNo.test(txtContactNo.value)) {
		status = false;
		document.getElementById("errContactNoNotProper").classList.remove("hidden");
		document.getElementById("errContactNoNotProper").classList.add("visible");
	}
	return status;
}
function checkSalary() {
	if (txtContactNo.value == "") {
		status = false;
		document.getElementById("errSalary").classList.remove("hidden");
		document.getElementById("errSalary").classList.add("visible");
	} else {
		var parts = split(txtSalary.value, '.');
		var rupee = parts[0];
		var paise = parts[1];
		console.log(rupee + paise);
		
		console.log(parts);
		var NotproperSalary = /([^\d])/;
		if (NotproperSalary.test(rupee) || NotproperSalary.test(paise)) {
			status = false;
			document.getElementById("errSalaryNotProper").classList.remove("hidden");
			document.getElementById("errSalaryNotProper").classList.add("visible");
		} else if (rupee.length > 6) {
			status = false;
			document.getElementById("errSalaryTooBig").classList.remove("hidden");
			document.getElementById("errSalaryTooBig").classList.add("visible");
		}
	}
	return status;
}
function checkDOB() {
	console.log(txtDOB.value);
	
	if (txtDOB.value == "") { //pattern
		status = false;
		document.getElementById("errDOBNotProper").classList.remove("hidden");
		document.getElementById("errDOBNotProper").classList.add("visible");
	}
	return status;
}
function checkAadhaarNo() {
	var properAadhaarNo = /(\d{12})/;
	if (txtAadhaarNo.value != "" && !properAadhaarNo.test(txtAadhaarNo.value)) {
		status = false;
		document.getElementById("errAadhaarNoNotProper").classList.remove("hidden");
		document.getElementById("errAadhaarNoNotProper").classList.add("visible");
	}
	return status;
}

function resetErrMessage() {
	resetFirstNameErrMessage();
	resetMiddleNameErrMessage();
	resetLastNameErrMessage();
	resetFatherNameErrMessage();
	resetSalaryErrMessage();
	resetEmailErrMessage();
	resetContactNoErrMessage();
	resetDOBErrMessage();
	resetAadhaarNoErrMessage();
}
function validateForm() {
	status = true;
	resetErrMessage();
	
	if (checkFirstName() == "false") {		
		txtFirstName.focus();
	} else if (checkMiddleName() == "false") {
		txtMiddleName.focus();
	} else if (checkLastName() == "false") {
		txtLastName.focus();
	} else if (checkFatherName() == "false") {
		txtFatherName.focus();
	} else if (checkSalary() == "false") {
		txtSalary.focus();
	} else if (checkEmail() == "false") {
		txtEmail.focus();
	} else if (checkContactNo() == "false") {
		txtContactNo.focus();
	} else if (checkAadhaarNo() == "false") {
		txtAadhaarNo.focus();
	}
	if (status == "false") {
		return false;
	}
}
function enableFields() {
    txtFirstName.disabled = false;
    txtMiddleName.disabled = false;
    txtLastName.disabled = false;
    txtFatherName.disabled = false;
    txtEmail.disabled = false;
	txtContactNo.disabled = false;
    btnSubmit.classList.remove("hidden");
    btnCancel.classList.remove("hidden");
}
function enableAllFields() {
    txtFirstName.disabled = false;
    txtMiddleName.disabled = false;
    txtLastName.disabled = false;
	txtFatherName.disabled = false;
	txtSalary.disabled = false;
    txtEmail.disabled = false;
	txtContactNo.disabled = false;
	txtAadhaarNo.disabled = false;
    btnSubmit.classList.remove("hidden");
    btnCancel.classList.remove("hidden");
}
function disablefields() {
    txtFirstName.disabled = true;
    txtMiddleName.disabled = true;
    txtLastName.disabled = true;
	txtFatherName.disabled = true;
	txtSalary.disabled = true;
    txtEmail.disabled = true;
    txtContactNo.disabled = true;
	txtAadhaarNo.disabled = true;
    btnSubmit.classList.add("hidden");
    btnCancel.classList.add("hidden");
}

txtFirstName.onkeyup = function() {
	resetFirstNameErrMessage();
}
txtMiddleName.onkeyup = function() {
	resetMiddleNameErrMessage();
}
txtLastName.onkeyup = function() {
	resetLastNameErrMessage();
}
txtFatherName.onkeyup = function() {
	resetFatherNameErrMessage();
}
txtEmail.onkeyup = function() {
	resetEmailErrMessage();
}
txtContactNo.onkeyup = function () {
	resetContactNoErrMessage();
}
txtDOB.onkeyup = function () {
	resetDOBErrMessage();
}
txtAadhaarNo.onkeyup = function() {
	resetAadhaarNoErrMessage();
}

txtFirstName.onblur = function() {
	checkFirstName();
}
txtMiddleName.onblur = function() {
	checkMiddleName();
}
txtLastName.onblur = function() {
	checkLastName();
}
txtFatherName.onblur = function() {
	checkFatherName();
}
txtEmail.onblur = function() {
	checkEmail();
}
txtContactNo.onblur = function() {
	checkContactNo();
}
txtDOB.onblur = function checkDOB() {
	checkDOB();
}
txtAadhaarNo.onblur = function() {
	checkAadhaarNo();
}
window.onload = function() {
    disablefields();
}