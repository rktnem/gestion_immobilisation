<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureUserHasJob
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, string $jobs): Response
    {
        if (auth()->user()->poste === "Super admin") {
            return $next($request);
        }
        $arr_jobs = explode(";", $jobs);
        foreach ($arr_jobs as $job){
            if(auth()->user()->poste === $job){
                return $next($request);
            }
        }
        
        return redirect()->route("home");
    }
}
