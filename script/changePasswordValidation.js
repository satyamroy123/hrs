var txtUsername = document.getElementById("txtUsername");
var txtCurrentPassword = document.getElementById("txtCurrentPassword");
var txtNewPassword = document.getElementById("txtNewPassword");
var txtCNewPassword = document.getElementById("txtCNewPassword");
var error = document.getElementById("error");
var checkboxVisibility = document.getElementById("checkboxPasswordVisibility");
var message;
var status = true;
var test = 1;
window.onload = function() {
    checkboxVisibility.checked = false;
    toggleVisibiltiy();
}
function toggleVisibiltiy() {
    if(checkboxVisibility.checked) {
        txtCurrentPassword.type = "text";
        txtNewPassword.type = "text";
        txtCNewPassword.type = "text";
    } else {
        txtCurrentPassword.type = "password";
        txtNewPassword.type = "password";
        txtCNewPassword.type = "password";
    }
}
function resetCurrentPasswordErrMessage() {
	message = document.getElementById("errCurrentPassword");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetNewPasswordErrMessage() {
	message = document.getElementById("errNewPassword");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errNewPasswordNotProper");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function resetCNewPasswordErrMessage() {
	message = document.getElementById("errCNewPassword");
	message.classList.remove("visible");
	message.classList.add("hidden");
	message = document.getElementById("errCNewPasswordNotMatching");
	message.classList.remove("visible");
	message.classList.add("hidden");
}
function checkCurrentPassword() {
    if(txtCurrentPassword.value == "") {
        status = false;
        document.getElementById("errCurrentPassword").classList.remove("hidden");
        document.getElementById("errCurrentPassword").classList.remove("visible");
    }
    return status;  
}
function checkNewPassword() {
	var properPassword = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
	if (txtNewPassword.value == "") {
		status = false;
		document.getElementById("errNewPassword").classList.remove("hidden");
		document.getElementById("errNewPassword").classList.add("visible");
	} else if (!properPassword.test(txtNewPassword.value)) {
		status = false;
		document.getElementById("errNewPasswordNotProper").classList.remove("hidden");
		document.getElementById("errNewPasswordNotProper").classList.add("visible");
	}
	return status;
}
function checkCNewPassword() {
	if (txtCNewPassword.value == "") {
		status = false;
		document.getElementById("errCNewPassword").classList.remove("hidden");
		document.getElementById("errCNewPassword").classList.add("visible");
	} else if (txtCNewPassword.value != txtNewPassword.value) {
		status = false;
		document.getElementById("errCNewPasswordNotMatching").classList.remove("hidden");
		document.getElementById("errCNewPasswordNotMatching").classList.add("visible");
	}
	return status;
}
function resetErrMessage() {
    resetCurrentPasswordErrMessage();
    resetNewPasswordErrMessage();
	resetCNewPasswordErrMessage();
}
function validateChangePasswordForm() {
	status = true;
	resetErrMessage();
	
	if (checkCurrentPassword() == "false") {
        txtCurrentPassword.focus();
    } else if (checkNewPassword() == "false") {
        txtNewPassword.focus();
	} else if (checkCNewPassword() == "false") {
		txtCPassword.focus();
    }
	if (status == "false") {
		return false;
	}
}
function hideError() {
    error.classList.remove("visible");
    error.classList.add("hidden");
}
function showError() {
    error.classList.remove("hidden");
    error.classList.add("visible");
}

txtCurrentPassword.onkeyup = function() {
	resetCurrentPasswordErrMessage();
}
txtNewPassword.onkeyup = function() {
	resetNewPasswordErrMessage();
}
txtCNewPassword.onkeyup = function() {
    resetCNewPasswordErrMessage();
}
txtCurrentPassword.onblur = function() {
	checkCurrentPassword();
}
txtNewPassword.onblur = function() {
	checkNewPassword();
}
txtCNewPassword.onblur = function() {
    checkCNewPassword();
}