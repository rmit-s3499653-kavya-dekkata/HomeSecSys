<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/fonts/font-awesome-4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/style/main.css">
<!-- jQuery library -->
<script src="resources/jslib/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="resources/js/dashBoard.js"></script>
<script src="resources/js/loadData.js"></script>
<script src="resources/jslib/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

	<div class="container">
		<div class="row" style="height: 70px;">
			<div class="col-md-12">
				<navbar></navbar>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>MODE</h3>
					</div>
					<div class="panel-body">
						<!-- <div class="input-group">
								<div class="radioBtn btn-group">
									<a class="btn btn-primary  active" data-toggle="happy"
									data-title="Y" id="home" onclick="func2()"><h3
									id="home1">HOME</h3></a> <a class="btn btn-primary  notActive"
									data-toggle="happy" data-title="N" id="away" value="away"
									onclick="func2()"><h3 id="away1">AWAY</h3></a>
								</div>
								<input type="hidden" name="happy" class="happy">
							</div> -->

							<div class="btn-group" role="group" aria-label="">
								<button type="button" class="btn btn-default active"><h3 id="home1" style="    margin-top: 10px;">HOME</h3></button>
								<button type="button" class="btn btn-default"><h3 id="away1" style="    margin-top: 10px;">AWAY</h3></button>
							</div>
					</div>
				</div>
						
				<div class="panel panel-primary" style="max-height: 400px;">
					<div class="panel-heading">
						<i class="fa fa-list" aria-hidden="true"></i> <label style="font-size: 16pt;">HISTORY</label>
					</div>
					<div class="panel-body" style = "padding:0;">
						<ul class="list-group" id="history-list" style="margin-bottom: 0;  overflow-y: auto;">
							<!-- <li class="list-group-item"><a href="#">Blah</a></li>
							<li class="list-group-item"><a href="#">Blah</a></li>
							<li class="list-group-item"><a href="#">Blah</a></li>
							<li class="list-group-item"><a href="#">Blah</a></li>
							<li class="list-group-item"><a href="#">Blah</a></li> -->  				
						</ul>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-6">
								<h6>Total Count <span class="label label-info" id="totalSize">25</span></h6>
							</div>
							<div class="col-md-6">
								<ul class="pagination pagination-sm pull-right myPagination">
									<li><span class="pages" role="button" onclick = "changePage(this)">1</span></li>
									<li><span class="pages" role="button" onclick = "changePage(this)">2</span></li>
									<li><span class="pages" role="button" onclick = "changePage(this)">3</span></li>
									<li><span class="pages" role="button" onclick = "changePage(this)">4</span></li>
									<li><span class="pages" role="button" onclick = "changePage(this)">5</span></li>
									<li><span class="pages" role="button" onclick = "changePage(this)">6</span></li>
									<li><span class="pages" role="button" onclick = "changePage(this)">&#62&#62</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
									<!-- <ul class="list-group history"
										style="overflow-y: scroll; min-height: 100px;">

									</ul>
									<div id="noData" style="display: none; text-align: left;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
 -->					
 			<div class="col-md-6">
				<div class="panel panel-primary" style="min-height: 350px;">
					<div class="panel-heading">
						<h3>CAMERA 1</h3>
					</div>
					<div class="panel-body">
						<video width="100%" controls>
							<source src="mov_bbb.mp4" type="video/mp4">
							<source src="mov_bbb.ogg" type="video/ogg">
							Your browser does not support HTML5 video.
						</video>
					</div>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>THERMOSTAT</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4"><h5>Thermostat</h5></div>
							<div class="col-md-4"><h6>Set: 25C</h6></div>
							<div class="col-md-4"><h6>Current: 22C</h6></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				
</body>
</html>