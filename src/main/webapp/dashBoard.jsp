<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/circle.css">
<link rel="stylesheet"
	href="resources/fonts/font-awesome-4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/style/main.css">
<!-- jQuery library -->
<script src="resources/jslib/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="resources/js/dashBoard.js"></script>
<script src="resources/js/loadData.js"></script>
<script src="resources/js/modalProperties.js"></script>
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
				<div class="navbar-wrapper">
					<div class="container-fluid">
						<nav class="navbar navbar-fixed-top">
							<div class="container">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<a class="navbar-brand" href="#">Logo</a>
								</div>
								<div id="navbar" class="navbar-collapse collapse">
									<ul class="nav navbar-nav">
										<li class="active"><a href="#" class="">Home</a></li>
										<li class=" dropdown"><a href="#"
											class="dropdown-toggle " data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false">CAMERAS <span
												class="caret"></span></a>
											<ul class="dropdown-menu">
												<li class=" dropdown"><a href="#"
													class="dropdown-toggle " data-toggle="dropdown"
													role="button" aria-haspopup="true" aria-expanded="false">CAMERA_1</a>
												</li>
												<li><a href="#">Add New</a></li>
											</ul></li>

										<li class=" dropdown"><a href="#"
											class="dropdown-toggle " data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false">THERMOSTATS <span
												class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="#">View Managers</a></li>
												<li><a href="#">Add New</a></li>
											</ul></li>
										<li class=" dropdown"><a href="#"
											class="dropdown-toggle active" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">LIGHTS
												<span class="caret"></span>
										</a>
											<ul class="dropdown-menu">
												<li><a href="#">View Staff</a></li>
												<li><a href="#">Add New</a></li>
												<li><a href="#">Bulk Upload</a></li>
											</ul></li>
										<li class=" down"><a href="#"
											class="dropdown-toggle active" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">HISTORY
												<span class="caret"></span>
										</a>
											<ul class="dropdown-menu">
												<li><a href="#">Change Time Entry</a></li>
												<li><a href="#">Report</a></li>
											</ul></li>
									</ul>
									<ul class="nav navbar-nav pull-right">
										<li class=" dropdown"><a href="#"
											class="dropdown-toggle active" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false"><i
												class="fa fa-exclamation-circle fa-2x" aria-hidden="true" onclick="showAlertDropdown()"></i><span
												class="badge" id="alertNos" style="background-color:red"></span></a>
												<div class="dropdown-content1 show" id="searchDropdown"></div>
												<%--             		<%
    				for(int i = 0; i < item.size(); i++)
    				{%>
		
										<li>
										<%=item.get(i).get("deviceId").getS() %>: <%=item.
    					get(i).get("deviceName").getS() %> <%=item.
    					get(i).get("status").getS() %> </li>
<%}%> --%>
											</li>
										<li class=" dropdown"><a href="#"
											class="dropdown-toggle active" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">Signed
												in as <span class="caret"></span>
										</a>
											<ul class="dropdown-menu">
												<li><a href="#">Change Password</a></li>
												<li><a href="#">My Profile</a></li>
											</ul></li>
										<li class=""><a href="index.jsp">Logout</a></li>
									</ul>
								</div>
							</div>
						</nav>
					</div>
				</div>
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

						<div class="btn-group mode1" role="group" aria-label="">
							<button type="button" class="btn btn-default" id="homeBtn" style="font-size:24pt;">HOME</button>
							<button type="button" class="btn btn-default" id="awayBtn" style="font-size:24pt;">AWAY</button>
						</div>
					</div>
				</div>

				<div class="panel panel-primary" style="max-height: 400px;">
					<div class="panel-heading">
						<i class="fa fa-list" aria-hidden="true"></i> <label
							style="font-size: 16pt;">HISTORY</label>
					</div>
					<div class="panel-body" id="panel-body" style="padding: 0;">
						<ul class="list-group" id="history-list"
							style="margin-bottom: 0; overflow-y: auto; overflow-x: hidden;">
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
								<h6>
									Total Count <span class="label label-info" id="totalSize">0</span>
								</h6>
							</div>
							<div class="col-md-6">
								<ul class="pagination pagination-sm pull-right myPagination">
									<li><span class="pages" role="button"
										onclick="changePage(this)">1</span></li>
									<li><span class="pages" role="button"
										onclick="changePage(this)">2</span></li>
									<li><span class="pages" role="button"
										onclick="changePage(this)">3</span></li>
									<li><span class="pages" role="button"
										onclick="changePage(this)">4</span></li>
									<li><span class="pages" role="button"
										onclick="changePage(this)">5</span></li>
									<li><span class="pages" role="button"
										onclick="changePage(this)">6</span></li>
									<li><span class="pages" role="button"
										onclick="changePage(this)">&#62&#62</span></li>
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
						<h3>YOUR SECURITY STATUS</h3>
					</div>
					<div class="panel-body">
					<label style="font-size: small">You are currently using only 7 out of 10 recommended security features. Please contact us to know how to make your home 100% secure!</label>
						<!-- <div id="healthValue"></div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-warning" role="progressbar"
                                 aria-valuemin="0" aria-valuemax="100" id="healthbar">

                                </div>
                        </div> -->
						<div class="c100 p0 big orange" id = "progress" style="margin-left: 25%;">
							<span id = "healthbar">0%</span>
								<div class="slice">
								<div class="bar"></div>
								<div class="fill"></div>
							</div>
						</div>
					</div>
				</div>
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

</body>
</html>