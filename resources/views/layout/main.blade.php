<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->

    @vite('resources/js/app.js')
    @vite('resources/css/app.css')
</head>

<body>
    <div style="display: flex">
        <aside>@include('../partials/sidebar')</aside>
        <div class="content-section">
            @include('../partials/navbar')
            @yield('content')
        </div>
    </div>
</body>

</html>