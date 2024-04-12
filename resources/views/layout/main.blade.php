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

    <!--         <link href="{{ asset('build/assets/app-Cm5XApxe.css') }}" rel="stylesheet"> -->

    <!-- Fonts -->

    @vite('resources/js/app.js')
    @vite('resources/css/app.css')
    @vite('resources/js/jquery.js')
    @vite('resources/js/script.js')
    @vite('resources/css/pages/main.css')
    @vite('resources/css/pages/display.css')
</head>

<body>
    <div>
        <aside>
            <x-sidebar :route="$route" :uri="$uri" />
        </aside>
        <div class="content-section">
            <x-navbar :route="$route" :uri="$uri" />
            @yield('content')
        </div>
        <div class="waiting">
            <div class="waiting-container">
                <div class="waiting-header">
                    <h3>En attente de validation...</h3>
                    <div class="close" id="closeBoxWait">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" width="100" height="100">
                            <path
                                d="M15.125 12.28125L12.28125 15.125L22.21875 25L12.28125 34.875L15.125 37.71875L25.0625 27.84375L35 37.71875L37.8125 34.875L27.90625 25L37.8125 15.125L35 12.28125L25.0625 22.15625Z"
                                fill="#1C1B1A" />
                        </svg>
                    </div>
                </div>
                <div class="waiting-content">
                    <div class="waiting-box">
                        <h4>Validation du PV de reception</h4>
                        <p><strong>Convention N°:</strong> 04-22 FTM</p>
                        <p><strong>Objet:</strong> Acquisition et reception de materiel informatique repartit en deux
                            lot
                        </p>
                        <p><strong>Declaré le:</strong> 12 décembre 2014</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="to-top">
            <a href="#navbar">&uarr;</a>
        </div>
    </div>
</body>

</html>