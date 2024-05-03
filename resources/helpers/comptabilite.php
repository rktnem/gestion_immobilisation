<?php 

function dotationExercice($prix, $taux) {
    $dotation = ((int)$prix * (int)$taux) / 100;

    return $dotation;
}

function amortissementAnterieur($anterieur, $dotation) {
    $actuel = (int)$anterieur + (int)$dotation;

    return $actuel;
}

function totalAmortissement($anterieurActuel, $dotation) {
    $total = (int)$anterieurActuel + (int)$dotation;

    return $total;
}

function netteComptable($prix, $totalAmortissement) {
    $valeurComptable = (int)$prix - (int)$totalAmortissement;

    return $valeurComptable;
}

?>