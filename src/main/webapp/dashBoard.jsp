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
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3>MODE</h3>
									</div>
									<div class="panel-body">
										<div class="input-group">
											<div class="radioBtn btn-group">
												<a class="btn btn-primary  active" data-toggle="happy"
													data-title="Y" id="home" onclick="func2()"><h3
														id="home1">HOME</h3></a> <a class="btn btn-primary  notActive"
													data-toggle="happy" data-title="N" id="away" value="away"
													onclick="func2()"><h3 id="away1">AWAY</h3></a>
											</div>
											<input type="hidden" name="happy" class="happy">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-primary" style="max-height: 400px;">
									<div class="panel-heading">
										<h3>History</h3>
									</div>
									<ul class="list-group history" style="overflow-y: scroll; min-height: 100px;">
								
									</ul>
									<div id="noData" style="display: none; text-align: left;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-12">
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
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3>THERMOSTAT</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-md-4">
												<h5>Thermostat</h5>
											</div>
											<div class="col-md-4">
												<h6>Set: 25C</h6>
											</div>
											<div class="col-md-4">
												<h6>Current: 22C</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>