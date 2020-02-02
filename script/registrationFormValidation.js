var txtFirstName = document.getElementById("txtFirstName");
var txtMiddleName = document.getElementById("txtMiddleName");
var txtLastName = document.getElementById("txtLastName");
var txtFatherName = document.getElementById("txtFatherName");
var txtUsername = document.getElementById("txtUsername");
var txtPassword = document.getElementById("txtPassword");
var txtCPassword = document.getElementById("txtCPassword");
var txtEmail = document.getElementById("txtEmail");
var txtContactNo = document.getElementById("txtContactNo");
var txtDOB = document.getElementById("txtDOB");
var txtUIDNo = document.getElementById("txtUIDNo");
var message;
var status = true;
var test = 1;
window.onload = function() {
	var checkboxVisibility = document.getElementById("checkboxPasswordVisibility");
	document.getElementById("checkboxPasswordVisibility").checked = false;
    toggleVisibiltiy();
}
function toggleVisibiltiy() {
    var txtPassword = document.getElementById("txtPassword");
    var txtCPassword = document.getElementById("txtCPassword");
    var checkboxVisibility = document.getElementById("checkboxPasswordVisibility");
    console.log(checkboxVisibility.checked);
    
    if(checkboxVisibility.checked) {
        txtPassword.type = "text";
        txtCPassword.type = "text";
    } else {
        txtPassword.type = "password";
        txtCPassword.type = "password";
    }
}
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
function resetUsernameErrMessage() {
	message = document.getElementById("errUsername");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errUsernameNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetPasswordErrMessage() {
	message = document.getElementById("errPassword");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errPasswordNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetCPasswordErrMessage() {
	message = document.getElementById("errCPassword");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errCPasswordNotMatching");
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
function resetContactNoErrMessage() {
	message = document.getElementById("errContactNo");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errContactNoNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetDOBErrMessage() {
	message = document.getElementById("errDOBNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetUIDNoErrMessage() {
	message = document.getElementById("errUIDNoNotProper");
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
function checkUsername() {
	var notProperUsername = /([^A-Za-z|0-9|_])/;
	if (txtUsername.value == "") {
		status = false;
		document.getElementById("errUsername").classList.remove("hidden");
		document.getElementById("errUsername").classList.add("visible");
	} else if (notProperUsername.test(txtUsername.value)) {
		status = false;
		document.getElementById("errUsernameNotProper").classList.remove("hidden");
		document.getElementById("errUsernameNotProper").classList.add("visible");
	}
	return status;
}
function checkPassword() {
	var properPassword = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
	if (txtPassword.value == "") {
		status = false;
		document.getElementById("errPassword").classList.remove("hidden");
		document.getElementById("errPassword").classList.add("visible");
	} else if (!properPassword.test(txtPassword.value)) {
		status = false;
		document.getElementById("errPasswordNotProper").classList.remove("hidden");
		document.getElementById("errPasswordNotProper").classList.add("visible");
	}
	return status;
}
function checkCPassword() {
	if (txtCPassword.value == "") {
		status = false;
		document.getElementById("errCPassword").classList.remove("hidden");
		document.getElementById("errCPassword").classList.add("visible");
	} else if (txtCPassword.value != txtPassword.value) {
		status = false;
		document.getElementById("errCPasswordNotMatching").classList.remove("hidden");
		document.getElementById("errCPasswordNotMatching").classList.add("visible");
	}
	return status;
}
function checkEmail() {
	if (txtEmail.value == "") {
		status = false;
		document.getElementById("errEmail").classList.remove("hidden");
		document.getElementById("errEmail").classList.add("visible");
	} else { //pattern
		var parts = split(txtEmail.value, '@');
		if (parts[0] == "") {
			parts[0] = "@";
		} else if (parts[1] == "") {
			parts[1] = "@";
		}
		var notProperEmailID = /([^A-Za-z0-9|\.|_|-])+/;
		var notProperDomain = /([^A-Za-z0-9.])+/;
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
function checkDOB() {
	console.log(txtDOB.value);
	
	if (txtDOB.value == "") { //pattern
		status = false;
		document.getElementById("errDOBNotProper").classList.remove("hidden");
		document.getElementById("errDOBNotProper").classList.add("visible");
	}
	return status;
}
function checkUIDNo() {
	var properUIDNo = /(\d{12})/;
	if (txtUIDNo.value != "" && !properUIDNo.test(txtUIDNo.value)) {
		status = false;
		document.getElementById("errUIDNoNotProper").classList.remove("hidden");
		document.getElementById("errUIDNoNotProper").classList.add("visible");
	}
	return status;
}

function resetErrMessage() {
	resetFirstNameErrMessage();
	resetMiddleNameErrMessage();
	resetLastNameErrMessage();
	resetFatherNameErrMessage();
	resetUsernameErrMessage();
	resetPasswordErrMessage();
	resetCPasswordErrMessage();
	resetEmailErrMessage();
	resetContactNoErrMessage();
	resetDOBErrMessage();
	resetUIDNoErrMessage();
}
function validateRegistrationForm() {
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
	} else if (checkUsername() == "false") {
		txtUsername.focus();
	} else if (checkPassword() == "false") {
		txtPassword.focus();
	} else if (checkCPassword() == "false") {
		txtCPassword.focus();
	} else if (checkEmail() == "false") {
		txtEmail.focus();
	} else if (checkContactNo() == "false") {
		txtContactNo.focus();
	} else if (checkUIDNo() == "false") {
		txtUIDNo.focus();
	}
	if (status == "false") {
		return false;
	}
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
txtUsername.onkeyup = function() {
	resetUsernameErrMessage();
}
txtPassword.onkeyup = function() {
	resetPasswordErrMessage();
}
txtCPassword.onkeyup = function() {
	resetCPasswordErrMessage();
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
txtUIDNo.onkeyup = function() {
	resetUIDNoErrMessage();
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
txtUsername.onblur = function() {
	checkUsername();
}
txtPassword.onblur = function() {
	checkPassword();
}
txtCPassword.onblur = function() {
	checkCPassword();
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
txtUIDNo.onblur = function() {
	checkUIDNo();
}