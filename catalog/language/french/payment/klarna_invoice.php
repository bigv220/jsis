<?php
// Text
$_['text_title']          = 'Facturation Klarna';
$_['text_fee']            = 'Facturation Klarna - Pay within 14 days <span id="klarna_invoice_toc_link"></span> (+%s)<script text="javascript\">$.getScript(\'http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js\', function(){ var terms = new Klarna.Terms.Invoice({ el: \'klarna_invoice_toc_link\', eid: \'%s\', country: \'%s\', charge: %s});})</script>';
$_['text_no_fee']         = 'Facturation Klarna - Pay within 14 days <span id="klarna_invoice_toc_link"></span><script text="javascript">$.getScript(\'http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js\', function(){ var terms = new Klarna.Terms.Invoice({ el: \'klarna_invoice_toc_link\', eid: \'%s\', country: \'%s\'});})</script>';
$_['text_additional']     = 'Facturation Klarna requiert des informations supplémentaires avant de pouvoir traiter votre commande.';
$_['text_wait']           = 'Veuillez patienter !';
$_['text_male']           = 'Homme';
$_['text_female']         = 'Femme';
$_['text_year']           = 'Année';
$_['text_month']          = 'Mois';
$_['text_day']            = 'Jour';
$_['text_comment']        = 'ID de facturation Klarna: %s\n%s/%s: %.4f';

// Entry
$_['entry_gender']        = 'Sexe:';
$_['entry_pno']           = 'N° personnel:<br /><span class="help">Veuillez entrer ici votre numéro de Sécurité Sociale.</span>';
$_['entry_dob']           = 'Date de naissance:';
$_['entry_phone_no']      = 'N° téléphone:<br /><span class="help">Veuillez entrer votre numéro de téléphone.</span>';
$_['entry_street']        = 'Rue:<br /><span class="help">Notez que la livraison ne peut s\effectuer qu\'à l\'adresse enregistrée lors d\'un paiement avec Klarna.</span>';
$_['entry_house_no']      = 'N° domicile:<br /><span class="help">Veuillez entrer votre numéro de domicile.</span>';
$_['entry_house_ext']     = 'Ext. domicile:<br /><span class="help">Veuillez entrer ici votre extension domicile. Ex: A, B, C, Rouge, Bleu, etc...</span>';
$_['entry_company']       = 'N° enregistrement société:<br /><span class="help">Veuillez entrer votre numéro d\'enregistrement société</span>';

// Error
$_['error_deu_terms']     = 'Vous devez accepter la politique de confidentialité de Klarna (Datenschutz)';
$_['error_address_match'] = 'Les adresses de livraison et de facturation doivent correspondre si vous voulez utiliser les paiements Klarna';
$_['error_network']       = 'Une erreur est survenue lors de la connexion à Klarna. Veuillez réessayer ultérieurement.';
?>