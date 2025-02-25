<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Classement du Tournoi de Football</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
</head>

<body>
    <header>
        <h1>Classement du Tournoi de Football</h1>
    </header>
    <nav>
        <a href="Connect.html">Connection</a>
        <a href="Inscription.html">Inscription</a>
    </nav>
    <div class="container">
        <h2>Classement des Équipes</h2>
        <table>
            <thead>
                <tr>
                    <th>Position</th>
                    <th>Équipe</th>
                    <th>Points</th>
                    <th>Joués</th>
                    <th>Gagnés</th>
                    <th>Nuls</th>
                    <th>Perdus</th>
                    <th>But Pour</th>
                    <th>But Contre</th>
                    <th>Différence</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Équipe A</td>
                    <td>30</td>
                    <td>15</td>
                    <td>10</td>
                    <td>0</td>
                    <td>5</td>
                    <td>25</td>
                    <td>10</td>
                    <td>+15</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Équipe B</td>
                    <td>28</td>
                    <td>15</td>
                    <td>9</td>
                    <td>1</td>
                    <td>5</td>
                    <td>22</td>
                    <td>12</td>
                    <td>+10</td>
                </tr>
                <!-- Ajoutez plus de lignes pour les autres équipes -->
            </tbody>
        </table>
    </div>
</body>
</html>
Acceuil.html

body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
}

.login-container {
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 350px;
  max-width: 90%;
  transition: transform 0.3s ease-in-out;
}

.login-container:hover {
  transform: scale(1.05);
}

.login-container h2 {
  margin-bottom: 20px;
  text-align: center;
  color: #333;
}

.login-container input[type="text"],
.login-container input[type="password"] {
  width: 100%;
  padding: 12px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  transition: border-color 0.3s ease-in-out;
}

.login-container input[type="text"]:focus,
.login-container input[type="password"]:focus {
  border-color: #4CAF50;
  outline: none;
}

.login-container button {
  width: 100%;
  padding: 12px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s ease-in-out;
}

.login-container button:hover {
  background-color: #45a049;
}

.login-container button:focus {
  outline: none;
  box-shadow: 0 0 3px 2px rgba(70, 130, 180, 0.5);
}

.login-container .forgot-password {
  display: block;
  text-align: center;
  margin-top: 10px;
  color: #4CAF50;
  text-decoration: none;
  transition: color 0.3s ease-in-out;
}

.login-container .forgot-password:hover {
  color: #45a049;
}

Connect.css

document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Empêche l'envoi du formulaire

        const username = form.username.value;
        const password = form.password.value;

        // Exemple de validation simple
        if (username === '' || password === '') {
            alert('Veuillez remplir tous les champs.');
            return;
        }

        // Simuler une requête de connexion
        fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username, password })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Connexion réussie !');
                // Rediriger vers une autre page
                window.location.href = '/dashboard';
            } else {
                alert('Nom d\'utilisateur ou mot de passe incorrect.');
            }
        })
        .catch(error => {
            console.error('Erreur:', error);
            alert('Une erreur est survenue. Veuillez réessayer plus tard.');
        });
    });
});
COnnect.js


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page de Connexion</title>
    <link rel="stylesheet" href="style.css">
    <script src='main.js'></script>
    </head>

<body>
    <div class="login-container">
        <h2>Connexion</h2>
        <form action="Acceuil.html" method="post">
            <input type="text" name="username" placeholder="Nom d'utilisateur" required>
            <input type="password" name="password" placeholder="Mot de passe" required>
            <button type="submit">Se connecter</button>
        </form>
    </div>
</body>
</html>

Index.html

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inscription</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='Inscription.css'>
    <script src='Inscription.js'></script>
</head>
<body>
    
</body>
</html>
Inscription.html


body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}
header {
    background-color: #4CAF50;
    color: white;
    padding: 20px;
    width: 100%;
    text-align: center;
}
nav {
    margin: 20px 0;
}
nav a {
    margin: 0 15px;
    text-decoration: none;
    color: #4CAF50;
    font-weight: bold;
}
.container {
    width: 80%;
    max-width: 1200px;
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
table, th, td {
    border: 1px solid #ddd;
}
th, td {
    padding: 12px;
    text-align: left;
}
th {
    background-color: #4CAF50;
    color: white;
}
tr:nth-child(even) {
    background-color: #f2f2f2;
}

main.css
