<!DOCTYPE html>
<html lang="en">
<head>
  <title>HomeSecurity</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/style/style.css">
  <script src="resources/jslib/jquery.min.js"></script>
  <script src="resources/jslib/bootstrap.min.js"></script>
  <script src="resources/js/index.js"></script>
</head>
<body>

  <div class="container">
    <div class="row" style="text-align: center; padding-top: 15%;">
      <div class="col-md-6 col-md-offset-3">
        <img class="logo" src="resources/images/logo/homesecurity.png">
      </div>
    <div class="row" style="text-align: center; padding-left: 10%; padding-right:10%;">
          <div class="col-md-6 col-md-offset-3" >
    <div id="form-olvidado">
    <form accept-charset="UTF-8" role="form" id="login-form" method="post">
        <fieldset>
          <h4 style="text-align: left;">
            <strong>Sign in</strong>
          </h4>
          <div class="form-group input-group">
            <span class="input-group-addon">
              <i class="glyphicon glyphicon-user">
              </i>
            </span>
            <input class="form-control" placeholder="User Name" id="email" name="email" required="" autofocus="" style="height:40px;">
          </div>
          <div class="form-group input-group">
            <span class="input-group-addon">
              <i class="glyphicon glyphicon-lock">
              </i>
            </span>
            <input class="form-control" placeholder="Password" id="password" name="password" type="password" value="" required="" style="height:40px;">
          </div>
          <div id="invalid" style="display: none; text-align: left;"></div>
          <div class="form-group">
            <button id="login" type="submit" class="btn btn-primary btn-block" style="height:40px">
              <strong>Login</strong>
            </button>
            <p style="display: none;"class="help-block">
              <a class="pull-right text-muted" href="#" id="olvidado">Forgot your password?</a>
            </p>
          </div>
        </fieldset>
      </form>
    </div>
    <div style="display: none;" id="form-olvidado">
      <h4 class="">
        Forgot your password?
      </h4>
      <form accept-charset="UTF-8" role="form" id="login-recordar" method="post">
        <fieldset>
          <span class="help-block">
            User name you use to log in to your account
            <br>
            Admin will send you an email with instructions to choose a new password.
          </span>
          <div class="form-group input-group">

            <span class="input-group-addon">
              <i class="glyphicon glyphicon-user">
              </i>
            </span>
            <input class="form-control" placeholder="User Name" name="email" type="email" required="" style="height:40px;">
          </div>
          <button type="submit" class="btn btn-primary btn-block" id="btn-olvidado" style="height:40px;">
            <strong>Continue</strong>
          </button>
          <p class="help-block">
            <a class="text-muted" style="text-align: left;" href="#" id="acceso">Sign-in</a>
          </p>
        </fieldset>
      </form>
    </div>
</body>
</html>
