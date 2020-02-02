var txtUsername = document.getElementById("txtUsername");
var txtSearchParameter = document.getElementById("txtSearchParameter");
var link = document.getElementById("link");
var btnMakeAdmin = document.getElementById("btnMakeAdmin");
var searchLink = document.getElementById("searchLink");
var selectedRow;
window.onload = function() {
    btnMakeAdmin.disabled = true;
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
    btnMakeAdmin.disabled = false;
    console.log(link.href);
}

function makeAdmin() {
    console.log("useless"); 
}

function search() {
    var parameter = txtSearchParameter.value;
    searchLink.href = "filteredEmployeeList.jsp?parameter=" + parameter;
}