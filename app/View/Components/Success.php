<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Success extends Component
{
    public $success;
    /**
     * Create a new component instance.
     */
    public function __construct($success)
    {
        $this->success = $success;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.success');
    }
}