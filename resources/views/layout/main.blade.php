@php
use Illuminate\Support\Facades\Route;

$route = Route::current()->getName();
$uri = Route::current()->uri();

@endphp

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Font family Roboto -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">

    <!-- Fonts -->

    @vite('resources/js/app.js')
    @vite('resources/css/app.css')
    @vite('resources/js/jquery.js')
    @vite('resources/js/script.js')
    @vite('resources/css/pages/main.css')
    @vite('resources/css/pages/display.css')
</head>

<body>
    <div style="display: flex; position: relative;">
        <aside>@include('../partials/sidebar')</aside>
        <div class="content-section">
            @include('../partials/navbar')
            @yield('content')
        </div>
        <div class="to-top">
            <a href="#navbar">&uarr;</a>
        </div>
    </div>
</body>

</html>