var selectedRow;
var feedbackMessage;
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
        selectedRow.classList.remove("selected");
        feedbackMessage.classList.add("hidden");
    }
    selectedRow = document.getElementById(rowId);
    feedbackMessage = document.getElementById("m" + rowId);
    selectedRow.classList.add("selected");
    feedbackMessage.classList.remove("hidden");
}