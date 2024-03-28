@vite('resources/css/pages/type.css')

<section class="achat-section">
    <div class="display-content">
        <ul class="step-part">
            <li class="step-item">
                <span class="count">1</span>
                <span class="label">PV de réception</span>
            </li>
            <li class="step-item">
                <span class="count">2</span>
                <span class="label">Validation</span>
            </li>
            <li class="step-item current-item">
                <span class="count">3</span>
                <span class="label">Insertion</span>
            </li>
        </ul>
        <div class="save-part">
            @include('../pages/type/step/insertion')
        </div>
</section>