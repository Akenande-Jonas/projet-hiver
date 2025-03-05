//Déclaration de constantes & des paramètres du serveur
const dotenv = require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const port = 9100; 
const app = express();

// Middleware
app.use(cors());
app.use(express.json());
//Connexion à la base de données
const bddConnection = mysql.createConnection({
    host: '192.168.64.175',
    user: 'teddy',
    password: 'TE42be98&*',
    database: 'Classement'
});

bddConnection.connect(function (err) {
    if (err) throw err;
    console.log("Vous êtes enfin connecté sur le serveur !");
});


//Route à empreinter dans le navigateur
app.get('/', (req, res) => {
    res.send('Bonjour, ceci est notre serveur (back-end), soyez les bienvenus !');
});

// route pour la page d'accueil
app.get('/accueil', (req, res) => {
    res.send('Vous êtes dans la page d\'accueil. Soyez les bienvenus sur cette page');
});

// route pour la page de classement
app.get('/classement', (req, res) => {

    const query = "SELECT m.id, m.Equipe1,  m.Equipe2, m.Gagnant, m.nul,   e1.nom AS nom_equipe1,   e2.nom AS nom_equipe2 FROM  Matchs m JOIN equipe e1 ON m.Equipe1 = e1.id JOIN equipe e2 ON m.Equipe2 = e2.id;";

    bddConnection.query(query, (error, results, fields) => {
        if (error) throw error;
      
        // Traiter les résultats pour calculer le classement
        const classement = calculerClassement(results);
      
        console.log(classement);
      });
});
// route pour la page users
app.get('/users', (req, res) => {
    res.send('Vous êtes dans la page users. Soyez les bienvenus sur cette page');
});

//Démarrer le serveur
app.listen(port, () => {
    console.log(`Le serveur est en écoute sur le port ${port}`);
});


//Recuperer les données de la table
app.get('/users', (req, res) => {
    bddConnection.query('SELECT * FROM users', function (err, rows) {
        if (err) throw err;
        res.send(rows);
    });
});

//Ajouter des données dans la table 
app.post('/users', (req, res) => {
    let user = { equipe: 'Equipe 1', classement: 1 };
    bddConnection.query('INSERT INTO users SET ?', user, function (err, rows) {
        if (err) throw err;
        res.send('Utilisateur ajouté à la base de données');
    });
});

//Modifier des données dans la table
app.put('/users/:id', (req, res) => {
    let id = req.params.id;
    let newClassement = 2;
    bddConnection.query('UPDATE users SET classement = ? WHERE id = ?', [newClassement, id], function (err, rows) {
        if (err) throw err;
        res.send('Classement modifié');
    });
});

//supprimer les donnees de la table
app.delete('/users/:id', (req, res) => {
    let id = req.params.id;
    bddConnection.query('DELETE FROM users WHERE id = ?', id, function (err, rows) {
        if (err) throw err;
        res.send('Utilisateur supprimé de la base de données');
    });
});

// Requête SQL
bddConnection.query('SELECT * FROM users', (err, results) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête :', err.stack);
      return;
    }
    console.log('Résultats de la requête :', results);
  });
  


  function calculerClassement(matchs) {
    const classement = {};
  
    matchs.forEach(match => {
      const { Equipe1, Equipe2, Gagnant, nul, nom_equipe1, nom_equipe2 } = match;
  
      // Initialiser les équipes dans le classement si elles n'existent pas
      if (!classement[Equipe1]) {
        classement[Equipe1] = { id: Equipe1, nom: nom_equipe1, points: 0 };
      }
      if (!classement[Equipe2]) {
        classement[Equipe2] = { id: Equipe2, nom: nom_equipe2, points: 0 };
      }
  
      // Gestion des matchs nuls
      if (nul === 1) {
        classement[Equipe1].points += 1;
        classement[Equipe2].points += 1;
      } else {
        // Attribuer les points en fonction du gagnant
        if (Gagnant === Equipe1) {
          classement[Equipe1].points += 3;
        } else if (Gagnant === Equipe2) {
          classement[Equipe2].points += 3;
        }
      }
    });
  
    // Convertir l'objet en tableau pour un classement plus lisible
    const classementArray = Object.values(classement);
  
    // Trier le classement par points décroissants
    classementArray.sort((a, b) => b.points - a.points);
  
    return classementArray;
  }