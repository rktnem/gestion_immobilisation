<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action={{ route('create.send') }} method="post">
        @csrf
        <input type="submit" value="Creer">
    </form>
</body>

</html>