<?php

require_once 'Modele/Ticket.php';
require_once 'Modele/Commentaire.php';
require_once 'Vue/Vue.php';

class ControleurTicket {

    private $ticket;
    private $commentaire;

    public function __construct() {
        $this->ticket = new Ticket();
        $this->commentaire = new Commentaire();
    }

    // Affiche les détails sur un ticket
    public function ticket($idTicket) {
        $ticket = $this->ticket->getTicket($idTicket);
        $commentaires = $this->commentaire->getCommentaires($idTicket);
        $vue = new Vue("Ticket");
        $vue->generer(array('ticket' => $ticket, 'commentaires' => $commentaires));
    }

    // Ajoute un commentaire à un ticket
    public function commenter($auteur, $contenu, $idTicket) {
        // Sauvegarde du commentaire
        $this->commentaire->ajouterCommentaire($auteur, $contenu, $idTicket);
        // Actualisation de l'affichage du ticket
        $this->ticket($idTicket);
    }

}

