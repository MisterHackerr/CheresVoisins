<?php
	session_start();
	if(isset($_GET['act']))
	{
		switch($_GET['act']) {
			case "ajouter":
				
				$prod = $_GET['prod'];
				include('connexionBDD.php'); //on se connecte à la base de donnée.
                 $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                 
				$controle= 'SELECT COUNT(*) AS NB_SERVICE  FROM SERVICE_CONSOMMER WHERE IDUSER_C = "'.$prod.'" AND IDUSER_C= "'.$_SESSION['identifiant_client']. '" ';
						$resultat=$connexion->query($controle);
        				$ligne=$resultat->fetch();
       					 $NB_SERVICE_CONSOMMER=$ligne['NB_SERVICE'];
       									

       			if($NB_SERVICE_CONSOMMER>0)
				{
					
					header('location:../erreur.php?err=objet_consommé');
					
				}
				else
				{
				try{
					
					$time = date("Y-m-d");
					
					$connexion = new PDO('mysql:host=localhost;dbname=cheresVoisins;charset=utf8', 'root', '',array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
					
				$traitement = $connexion->prepare('INSERT INTO `SERVICE_CONSOMMER`(  IDSERVICE_C, IDUSER_C,DATE_CONSOMMATION) VALUES (:idS,:ID_U,:date_d) ');
				$traitement->execute(array(
				'idS'=> $_GET['prod'],
				'ID_U'=>  $_SESSION['identifiant_client'],
				'date_d'=>$time
				));

				header('location:../panier.php');
				
			}
				catch(PDOException $e){
       			
       			
					
       				header('location:../erreur.php?err=objet_en_cours_emprunt');
       			
       			
       		
       	}

				
				
					
				}
				
				

			break;
			case "retirer":
				$prod = $_GET['prod'];
				if(($_SESSION['panier'][$prod]) == 1)
				{
					unset($_SESSION['panier'][$prod]);
					var_dump($_SESSION['panier']);
					header('location:../panier.php');
				}
				else
				{
					$_SESSION['panier'][$prod] -= 1;
					var_dump($_SESSION['panier']);
					header('location:../panier.php');
				}
			break;
			case "vider":
					unset($_SESSION['panier']);
					header('location:../panier.php');
			break;
		}
	}
	else
	{
		header('location:../erreur.php?err=panier');
	}
?>