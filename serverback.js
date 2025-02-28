//Déclaration de constantes & des paramètres de travail
const dotenv = require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const port = 8000; 
const app = express();

// Middleware
app.use(cors());
app.use(express.json());

//Route à empreinter dans le navigateur
app.get('/', (req, res) => {
    res.send('Bonjour, ceci est notre serveur (back-end), soyez les bienvenus !');
});

//Démarrer le serveur
app.listen(port, () => {
    console.log(`Le serveur est en écoute sur le port ${port}`);
});

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
  
  // Fermez la connexion (optionnel, selon votre cas d'usage)
  bddConnection.end();

const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('Classement', 'teddy', 'TE42be98&*', {
  host: '192.168.64.175',
  dialect: 'mysql'
});

// Testez la connexion
sequelize.authenticate()
  .then(() => {
    console.log('Connexion à la base de données réussie !');
  })
  .catch((err) => {
    console.error('Erreur de connexion à la base de données :', err);
  });