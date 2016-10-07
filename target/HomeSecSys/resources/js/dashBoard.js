$(document).ready(function() {

	$('navbar').load("navbar.jsp");
	$("#home").click(function(){
		var h = $("#home1").text();
		alert(h);
		window.location.replace("dashBoard.jsp?home="+e);
	});

	$("#away").click(function(){
		var a = $("#away1").text();
		alert(a);
		window.location.replace("dashBoard.jsp?home="+a);
	});
	$('.container').on('click', '.radioBtn a', function() {
		var sel = $(this).data('title');
		var tog = $(this).data('toggle');
		$(this).parent().next('.' + tog).prop('value', sel);
		$(this).parent().find('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
		$(this).parent().find('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');

	});  

	$.ajax({
		url: "http://localhost:8080/HomeSecSys/services/dashBoard",
		success: function(data){
			if(data !=="failure"){
				var data = JSON.parse(data);
				var array = [];
				data.forEach(function(itm, ind){
					
					$('.history').append($('<div class="historyRow row">'))
					.append($('<div class = "col-md-2"></div>'))
					.append($('<div class = "col-md-6 deviceName"></div>'))
					.append($('<div class = "col-md-4 deviceStatus"></div></div>'));
					
					array.push(itm.deviceId);
					
					//var id = 	$(".deviceName").attr("id");
					//console.log(id);
					//$(".deviceName").find(id).text(itm.deviceId);

				});
					
				var coll = document.getElementsByClassName("deviceName");
				console.log(coll.length); 
				for(var j = 0; j < coll.length; j++) {
				    coll[j].innerHTML = array[j];
				    console.log(array[j]);
				}
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
