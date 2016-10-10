var deviceArray = [];
var messageArray = [];
var currentPage;
var totalPages;
var totalResults;
$(document).ready(function() {

	$('navbar').load("navbar.jsp");


	$.ajax({
		url: "http://localhost:8080/HomeSecSys/services/dashBoard",
		success: function(data){
			if(data !== "failure"){
				
				var temp = data.split(":::");
				var data = JSON.parse(temp[0]);
				currentPage = temp[1];
				totalResults = temp[2];
				totalPages = Math.ceil(temp[2]/7);
				//console.log(data);
				
				data.forEach(function(itm, ind){

					$('.list-group').append($('<li class="list-group-item"><div class="checkbox row"><div class="col-md-1"> <input type="checkbox" id="checkbox" style="margin-left: 10px;"/></div><div class="col-md-2"> <label for="checkbox" class = "deviceName"></label></div><div class = "col-md-8"><label for="checkbox" class = "deviceStatus"></label></div><div class="col-md-1 pull-right action-buttons"><a href="#" class="trash"><span class="glyphicon glyphicon-trash"></span></a></div></div></li>'));

					deviceArray.push(itm.deviceName);
					messageArray.push(itm.deviceMessage);

				});
				var coll = document.getElementsByClassName("deviceName");
				//console.log(coll.length); 
				populateDivs(deviceArray, coll);
				var col = document.getElementsByClassName("deviceStatus");
				populateDivs(messageArray, col);
				document.getElementById("totalSize").innerHTML = totalResults;
				
			}
			else{
				$('#noData').html('<p class="text-danger"><strong>Please connect to the internet</strong></p>')
			}
		},
		error: function( jqXhr, textStatus, errorThrown ){
			$('#noData').html('<p class="text-danger"><strong>Please connect to the internet</strong></p>')
		}
	});
	
	
	$.ajax({
		url: "http://localhost:8080/HomeSecSys/services/alerts",
		success: function(data){
			if(data !== "failure"){
				var data = JSON.parse(data);
				console.log(data);
			}
			else{
				console.log("failure");
			}
		},
		error: function( jqXhr, textStatus, errorThrown ){
			$('#noData').html('<p class="text-danger"><strong>Please make sure you are connected to the internet</strong></p>')
		}
	});
});

function populateDivs(arr, coll) {
	for(var j = 0; j < coll.length; j++) {
		coll[j].innerHTML = arr[j];
		//console.log(arr[j]);
	}
}

