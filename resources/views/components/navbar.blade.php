@vite(['resources/css/partials/navbar.css', 'resources/js/script.js'])

<nav class="navbar" id="navbar">
    <ul>
        <div class="menu">
            <span class="side-visible">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" width="100" height="100">
                    <path
                        d="M15.125 12.28125L12.28125 15.125L22.21875 25L12.28125 34.875L15.125 37.71875L25.0625 27.84375L35 37.71875L37.8125 34.875L27.90625 25L37.8125 15.125L35 12.28125L25.0625 22.15625Z"
                        fill="#1C1B1A" />
                </svg>
            </span>
            <span class="side-hidden">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" width="100" height="100">
                    <path
                        d="M5 8 A 2.0002 2.0002 0 1 0 5 12L45 12 A 2.0002 2.0002 0 1 0 45 8L5 8 z M 5 23 A 2.0002 2.0002 0 1 0 5 27L45 27 A 2.0002 2.0002 0 1 0 45 23L5 23 z M 5 38 A 2.0002 2.0002 0 1 0 5 42L45 42 A 2.0002 2.0002 0 1 0 45 38L5 38 z"
                        fill="#1C1B1A" />
                </svg>
            </span>
        </div>
        <div>
            @if(!isRoute('/home/i', $route))
            <li class="nav-item">
                <a href={{ route('home') }}>Accueil</a>
            </li>
            @endif
            @if(isRoute('/inventaire/i', $route))
            <li class="nav-item nav-{{ isRoute('/liste des matiere/i', $uri) }}">
                <a href="#">Liste des matières</a>
            </li>
            <li class="nav-item nav-{{ isRoute('/inventaire.journal/i', $route) }}">
                <a href="#">Journal</a>
            </li>
            <li class="nav-item nav-{{ isRoute('/inventaire.grandlivre/i', $route) }}">
                <a href="#">Grand-Livre</a>
            </li>
            <li class="nav-item nav-{{ isRoute('/inventaire.attente/i', $route) }}">
                <a href="#">En attente</a>
            </li>
            @endif
            @if(isRoute('/rapport/i', $route))
            <li class="nav-item nav-{{ isRoute('/rapport.recensement/', $route) }}">
                <a href={{ route('rapport.recensement') }}>Recensement</a>
            </li>
            <li class="nav-item nav-{{ isRoute('/rapport.demolition/', $route) }}">
                <a href={{ route('rapport.demolition') }}>Demolition</a>
            </li>
            @endif
            @if(isRoute('/owner/i', $route))
            <li class="nav-item nav-{{ isRoute('/owner/i', $route) }}">
                <a href="#">Liste des détenteurs</a>
            </li>
            <li class="nav-item nav-{{ isRoute('/owner.affectation/i', $route) }}">
                <a href="#">Affectation</a>
            </li>
            <li class="nav-item nav-{{ isRoute('/owner.demande/i', $route) }}">
                <a href="#">Demande</a>
            </li>
            @endif
        </div>
        <div>
            <button>Nomenjanahary <span>&rsaquo;</span></button>
            <span class="logout">
                <form action={{ route('logout') }} method="post">
                    @csrf
                    <input type="submit" value="Deconnexion">
                </form>
            </span>
        </div>
    </ul>
</nav>