import React, { useState, useEffect } from "react";

const App = () => {
    const [users, setUsers] = useState([]);

    // Récupérer les utilisateurs
    useEffect(() => {
        fetch("http://192.168.64.175:8000/users")
            .then((response) => response.json())
            .then((data) => setUsers(data))
            .catch((error) => console.error("Erreur lors de la récupération des utilisateurs :", error));
    }, []);

    // Ajouter un utilisateur
    const addUser = () => {
        fetch("http://192.168.64.175:8000/users", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ equipe: "Equipe 1", classement: 1 }),
        })
            .then(() => {
                alert("Utilisateur ajouté");
                window.location.reload();
            })
            .catch((error) => console.error("Erreur lors de l'ajout de l'utilisateur :", error));
    };

    // Modifier un classement (exemple sur le premier utilisateur)
    const updateClassement = (id) => {
        fetch(`http://192.168.64.175:8000/users/${id}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ classement: 2 }),
        })
            .then(() => {
                alert("Classement mis à jour");
                window.location.reload();
            })
            .catch((error) => console.error("Erreur lors de la mise à jour du classement :", error));
    };

    return (
        <div>
            <h1>Gestion des Utilisateurs</h1>
            <button onClick={addUser}>Ajouter un utilisateur</button>
            <ul>
                {users.map((user) => (
                    <li key={user.id}>
                        {user.equipe} - Classement: {user.classement} 
                        <button onClick={() => updateClassement(user.id)}>Modifier Classement</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default App;