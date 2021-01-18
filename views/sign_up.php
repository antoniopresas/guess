<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Sign up</title>
  </head>
  <body>
  <div class="container mt-4">
    <div class="title text-center">
        <h1>Registrate</h1>
    </div>
    <div class="formularios">

    <form action="../controllers/player.php" method="post" class="row g-3 needs-validation mt-3">
   
        <div class="mb-3 row">
            <label for="name" class="col-sm-2 col-form-label">Nombre de usuario</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="name" required name="name">
            </div>
        </div>

        <div class="mb-3 row">
        <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-8">
                <input type="email"  class="form-control" id="email" placeholder="email@example.com" required name="email">
            </div>
        </div>

        <div class="mb-3 row">
            <label for="password" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-8">
                <input type="password" class="form-control" id="password" required name="password">
            </div>
        </div>

        <div class="mb-3 row">
            <label for="rePassword" class="col-sm-2 col-form-label">Repetir Password</label>
            <div class="col-sm-8">
                <input type="password" class="form-control" id="rePassword" required name="rePassword">
            </div>
        </div>

        <div class="col-12">
            <button class="btn btn-success" type="submit">Registrar</button>
        </div>
    </form>

    </div>
      
  </div>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

  </body>
</html>