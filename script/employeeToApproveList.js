var txtUsername = document.getElementById("txtUsername");
var link = document.getElementById("link");
var btnApprove = document.getElementById("btnApprove");
var btnDispprove = document.getElementById("btnDisapprove");
var selectedRow;
window.onload = function() {
    btnApprove.disabled = true;
    btnDispprove.disabled = true;
}

function trim(value) {
    var temp = "";
    var length = value.length;
    var lowerBound, upperBound;
    for (upperBound = length -1; upperBound >= 0; --upperBound) {
        if (value[upperBound] != " ") {
            break;
        }
    }        
    for (lowerBound = 1; lowerBound < length; ++lowerBound) {
        if(value[lowerBound] != " " && value[lowerBound] != "\n") {
            break;
        }
    }
    for (index = lowerBound; index < upperBound; ++index) {
        temp += value[index];
    }
    return temp;    
}

function select(rowId) {
    if (selectedRow != null) {
        selectedRow.classList.remove("selected")
    }
    selectedRow = document.getElementById(rowId);
    var username = trim(document.getElementById(rowId + "col2").innerHTML);
    selectedRow.classList.add("selected");
    link.href = "employee.jsp?username=" + username;
    txtUsername.value = username;
    btnApprove.disabled = false;
    btnDispprove.disabled = false;
    console.log(link.href);
}

function makeAdmin() {
    console.log("useless"); 
}
function approve() {
    document.getElementById("employeeListContainer").action = "approveEmployee.jsp";
}
function disapprove() {
    document.getElementById("employeeListContainer").action = "disapproveEmployee.jsp";
}