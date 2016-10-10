var deviceArray = [];
var messageArray = [];
var currentPage;
var totalPages;
var totalResults;
var alertResults = [];
var mode;
$(document).ready(function() {

	$('navbar').load("navbar.jsp");
//	$("#home").click(function(){
//		var h = $("#home1").text();
////		alert(h);
//		window.location.replace("dashBoard.jsp?home="+e);
//	});
//
//	$("#away").click(function(){
//		var a = $("#away1").text();
////		alert(a);
//		window.location.replace("dashBoard.jsp?home="+a);
//	});
//	$('.container').on('click', '.radioBtn a', function() {
//		var sel = $(this).data('title');
//		var tog = $(this).data('toggle');
//		$(this).parent().next('.' + tog).prop('value', sel);
//		$(this).parent().find('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
//		$(this).parent().find('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
//
//	});  

	$.ajax({
		url: "http://localhost:8080/HomeSecSys/services/dashBoard",
		success: function(data){
			if(data !== "failure"){
				var temp = data.split(":::");
				var data = JSON.parse(temp[0]);
				currentPage = temp[1];
				totalResults = temp[2];
				totalPages = Math.ceil(temp[2]/7);
				loadData(data);
				document.getElementById("homeBtn").classList.add("active");
				
				populateAlert("HOME");
			}
			else{
				$('#noData').html('<p class="text-danger"><strong>Please connect to the internet</strong></p>')
			}
		},
		error: function( jqXhr, textStatus, errorThrown ){
			$('#noData').html('<p class="text-danger"><strong>Please connect to the internet</strong></p>')
		}
	});
	
	
	
});

function loadData(data) {
	deviceArray = [];
	deviceStatus = [];
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
	paginate();
	document.getElementById("totalSize").innerHTML = totalResults;
}

function populateDivs(arr, coll) {
	for(var j = 0; j < coll.length; j++) {
		coll[j].innerHTML = arr[j];
		//console.log(arr[j]);
	}
}

function changePage(arg) {
	var allPages = $('.pages');
	
	for(var i = 0; i < allPages.length; i++) {
		if(allPages[i].classList.contains("active-page")) {
			allPages[i].classList.remove("active-page");
			console.log(allPages[i] + " - " + allPages[i].innerHTML);
		}
	}
	$('#panel-body').load(document.URL + ' #panel-body');
	var reqPageNo;
	if(arg.innerHTML == "&gt;&gt;" ||(arg.innerHTML == totalPages)) {
		reqPageNo = "last";
	} else if(arg.innerHTML == "&lt;&lt;") {
		reqPageNo = "1";
	} else {
		reqPageNo = arg.innerHTML;
	}
	var data = JSON.stringify({"PAGE":reqPageNo});

	console.log(data);
	$.ajax({
		type: "POST",
		url:"services/historyPagination",
		data: data,
		contentType: "application/json; charset=utf-8",
		success: function( data, textStatus, jQxhr ){
			var temp = data.split(":::");
			var data = JSON.parse(temp[0]);
			currentPage = temp[1];
			loadData(data);	
		},
		error: function( jqXhr, textStatus, errorThrown ){
			
		}
	});
}

function paginate() {
	var allPages = $('.pages');
	for(var i = 0; i < allPages.length; i++) {
		if(allPages[i].classList.contains("active-page")) {
			allPages[i].classList.remove("active-page");
			console.log(allPages[i] + " - " + allPages[i].innerHTML);
		}
	}
	if(currentPage >= 5){
		allPages[0].innerHTML = "&#60&#60";
		if(currentPage >= totalPages - 3) {
			for(var i = 1; i < 7; i++){
				allPages[i].innerHTML = "";
				allPages[i].innerHTML = parseInt(totalPages) + i - 6;
			}
		}else {
			for(var i = 1; i < 6; i++) {
				allPages[i].innerHTML="";
				allPages[i].innerHTML=parseInt(currentPage) + i - 3;	
			}
			allPages[6].innerHTML = "&#62&#62";
		}
	}
	else {
		for(var i = 0; i < 6; i++) {
			allPages[i].innerHTML="";
			allPages[i].innerHTML = i+1;
		}
		allPages[6].innerHTML = "&#62&#62"; 
	} 

	for(var i = 0; i < allPages.length; i++) {
		if(allPages[i].innerHTML == currentPage) {
			allPages[i].classList.add("active-page");	
		}
	}
}

function showAlertDropdown() {
	 var alertDropdown = document.getElementById("searchDropdown");
		while(alertDropdown.hasChildNodes()) {
		alertDropdown.removeChild(alertDropdown.childNodes[0]);
	}
	if(alertResults.length > 0){
		// creating the a tags which will together form a dropdown list
		for(var i=0; i<alertResults.length; i++) {
			$('.dropdown-content1').append($('<a class="searchRecommendations" href="#"></a>'));
		}

		// populating each a tag with one search recommendation
		var collection = document.getElementsByClassName("searchRecommendations");
//		console.log(collection.length);
		for(var j = 0; j < collection.length; j++) {
			collection[j].innerHTML = alertResults[j];
//			console.log("Search results returned - " + alertResults[j]);
		}

//		document.getElementById("searchDropdown").classList.toggle("show");
	}
	else {
		$('.dropdown-content1').append($('<a class="searchRecommendations" href="#"></a>'));
		var collection = document.getElementsByClassName("searchRecommendations");
		collection[0].innerHTML = "No Recommendations found. Please try again."
	}
}

window.onclick = function(event) {
	if (!event.target.matches('.dropdown-toggle')) {
		var dropdowns = document.getElementsByClassName("searchRecommendations");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			openDropdown.style.display = "none";
		}
		 if (event.target.matches('#homeBtn') || event.target.matches('#awayBtn')) {
			 var home = document.getElementById("homeBtn");
			 	if(home.classList.contains("active"))
			 		home.classList.remove("active");
			 var away = document.getElementById("awayBtn");
			 if(away.classList.contains("active"))
				 away.classList.remove("active");
			 populateAlert(event.target.innerHTML);
		}
		
	}else {
		
		var dropdowns = document.getElementsByClassName("searchRecommendations");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			openDropdown.style.display = "block";
		}
	}    
}

function populateAlert(mode){
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/HomeSecSys/services/alerts",
        data: mode,
        contentType: "application/json; charset=utf-8",
        success: function( data, textStatus, jQxhr ){
            if(data !== "failure"){
                //var data = JSON.parse(data);
                //console.log(data);
                var temp = data.split(":::");
                var data = JSON.parse(temp[0]);
                var alerts = parseInt(temp[1]);
                var health = (7 - alerts)*10;
//                health = health + "%";
                $("#healthValue").text(health);
//                $("#healthbar").css("width", health);
//                $("#healthbar").attr("aria-valuenow", health);
               var healthBar = document.getElementById("healthbar");
               healthBar.innerHTML = health+"%";
               var prog = document.getElementById("progress");
               $('#progress').attr("class", "c100 p" + health + " big orange");
//               prog.classList.re
//               classes[1] = "p"+health;
               
               document.getElementById("alertNos").innerHTML = alerts; 
               for(var i =0; i < data.length; i++) {
            	   alertResults.push(data[i].deviceMessage);
               }
            }
            else{
                console.log("failure");
            }
        },
        error: function( jqXhr, textStatus, errorThrown ){
            $('#noData').html('<p class="text-danger"><strong>Please make sure you are connected to the internet</strong></p>')
        }
    });
}