<?php

require_once 'Modele/Modele.php';
/**
 * Fournit les services d'accès aux genres musicaux 
 * 
 * @author Baptiste Pesquet
 */
class Commentaire extends Modele {

// Renvoie la liste des commentaires associés à un ticket
    public function getCommentaires($idTicket) {
        $sql = 'select COM_ID as id, COM_DATE as date,'
                . ' COM_AUTEUR as auteur, COM_CONTENU as contenu from T_COMMENTAIRE'
                . ' where TIC_ID=?';
        $commentaires = $this->executerRequete($sql, array($idTicket));
        return $commentaires;
    }

    // Ajoute un commentaire dans la base
    public function ajouterCommentaire($auteur, $contenu, $idTicket) {
        $sql = 'insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, TIC_ID)'
            . ' values(?, ?, ?, ?)';
            $date = date('d-m-y h:i:s');
        $this->executerRequete($sql, array($date, $auteur, $contenu, $idTicket));
    }
}