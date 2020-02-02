var employeeLoginForm = document.getElementById("loginForm");
var txtUsername = document.getElementById("txtUsername");
var txtPassword = document.getElementById("txtPassword");
var errUsernameMessage = document.getElementById("errUsername");
var errPasswordMessage = document.getElementById("errPassword");
var btnAdminLogin = document.getElementById("btnAdminLogin");
var btnEmployeeLogin = document.getElementById("btnEmployeeLogin");
var status = true;

function resetErrUsernameMessage () {
	errUsernameMessage.classList.remove("visible");
	errUsernameMessage.classList.add("hidden");
}
function resetErrPasswordMessage () {
	errPasswordMessage.classList.remove("visible");
	errPasswordMessage.classList.add("hidden");
}
function resetCredentialsErrMessage() {
	resetErrUsernameMessage();
	resetErrPasswordMessage();
}
function checkUsername() {
	if (txtUsername.value == "") {
		status = false;
		message = document.getElementById("errUsername");
		message.classList.remove("hidden");
		message.classList.add("visible");
		txtUsername.focus();
	}
	return status;
}
function checkPassword() {
	if (txtPassword.value == "") {
		status = false;
		message = document.getElementById("errPassword");
		message.classList.remove("hidden");
		message.classList.add("visible");
		txtPassword.focus();
	}
	return status;
}

function activateEmployeeLoginForm () {
	document.getElementById("loginForm").action = "employeeLoginAction.jsp";
	btnEmployeeLogin.classList.add("active_button");
	btnEmployeeLogin.disabled = true;
	btnAdminLogin.classList.remove("active_button");
	btnAdminLogin.disabled = false;
	document.getElementById("registrationLink").style.display = "block";
}
function activateAdminLoginForm () {
	document.getElementById("loginForm").action = "adminLoginAction.jsp";
	btnEmployeeLogin.classList.remove("active_button");
	btnEmployeeLogin.disabled = false;
	btnAdminLogin.classList.add("active_button");
	btnAdminLogin.disabled = true;
	document.getElementById("registrationLink").style.display = "none";
}
function hideEmployeeLoginForm () {
	employeeLoginForm.style.display = "none";
}
function showAdminLoginForm () {
	employeeLoginForm.style.display = "block";
	document.getElementById("memberLoginForm").action = "adminLoginAction.jsp";
	document.getElementById("registrationLink").style.display = "none";
}
txtUsername.onkeyup = function () {
	resetErrUsernameMessage();
}
txtPassword.onkeyup = function () {
	resetErrPasswordMessage();
}
txtUsername.onblur = function () {
	checkUsername();
}
txtPassword.onblur = function () {
	checkPassword();
}
window.onload = function () {
	activateEmployeeLoginForm();
}

function validateLoginForm() {
	console.log(status);
	
	status = true;
	resetCredentialsErrMessage();
	if(checkUsername() == "false") {
		txtUsername.focus();
	} else if (checkPassword() == "false") {
		txtPassword.focus();
	}
	console.log(status);
	
	if (status == "false") {
		return false;
	}
}