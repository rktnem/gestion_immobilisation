<div class="nav-auth">
    @if(!Route::is('register'))
    <a href={{ route('register') }}>Creer un compte</a>
    @endif
    @if(!Route::is('login'))
    <a href={{ route('login') }}>Log in</a>
    @endif
</div>