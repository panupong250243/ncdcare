<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>NCDs CARE</title>
</head>

<body>
  <div class="container">
    <div class="imgcontainer">
      <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Avatar" class="avatar">
    </div>
    <form method="post" action="action_login.php">
      <h1 style="text-align:center"><b>NCDs CARE</b> - Admin Login</h1>
      <div class="container">
        <span for="admin_email">Email:</span>
        <input type="text" id="admin_email" name="admin_email">

        <span for="admin_passwd">Password:</span>
        <input type="password" id="admin_passwd" name="admin_passwd">

        <center><button type="submit" class="btn btn-success" name="login">Login</button></center>
      </div>
    </form>

  </div>
</body>

</html>

<style>
  body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: #778899;
  }

  input[type=text],
  input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }

  .btn {
    background-color: #04AA6D;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
  }

  button:hover {
    opacity: 0.8;
  }

  .cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
  }

  .imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
  }

  img.avatar {
    width: 40%;
    border-radius: 50%;
  }

  .container {
    padding: 16px;
  }

  span.psw {
    float: right;
    padding-top: 16px;
  }

  /* Change styles for span and cancel button on extra small screens */
  @media screen and (max-width: 300px) {
    span.psw {
      display: block;
      float: none;
    }

    .cancelbtn {
      width: 100%;
    }
  }

  .container {
    background-color: #fff;
    margin-left: 10vw;
    margin-right: 10vw;
    margin-bottom: 5vh;
    margin-top: 5vh;
    display: flex;
    align-items: center;
    width: auto;
    height: auto;
    justify-content: space-around;
    flex-direction: column;
    border-radius: 10px;
  }
</style>