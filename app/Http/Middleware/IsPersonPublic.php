<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IsPersonPublic
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if(auth()->user()->poste === "Personne responsables des marchés publiques" || auth()->user()->poste === "Super admin") {
            return $next($request);
        }
        else {
            return to_route('home');
        }
    }
}