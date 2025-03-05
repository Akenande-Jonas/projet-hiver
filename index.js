document.addEventListener('DOMContentLoaded', () => {
    const usersTable = document.getElementById('usersTable').getElementsByTagName('tbody')[0];
    const addUserForm = document.getElementById('addUserForm');

    // Fonction pour récupérer les utilisateurs
    function fetchUsers() {
        fetch('http://192.168.64.175:9100/users')
            .then(response => response.json())
            .then(users => {
                usersTable.innerHTML = '';
                users.forEach(user => {
                    const row = usersTable.insertRow();
                    row.insertCell(0).textContent = user.id;
                    row.insertCell(1).textContent = user.equipe;
                    row.insertCell(2).textContent = user.classement;
                    const actionsCell = row.insertCell(3);
                    const deleteButton = document.createElement('button');
                    deleteButton.textContent = 'Supprimer';
                    deleteButton.onclick = () => deleteUser(user.id);
                    actionsCell.appendChild(deleteButton);
                });
            });
    }

    // Fonction pour ajouter un utilisateur
    addUserForm.addEventListener('submit', (event) => {
        event.preventDefault();
        const formData = new FormData(addUserForm);
        const user = {
            equipe: formData.get('equipe'),
            classement: formData.get('classement')
        };
        fetch('http://192.168.64.175:9100/users', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(user)
        }).then(() => {
            fetchUsers();
            addUserForm.reset();
        });
    });

    // Fonction pour supprimer un utilisateur
    function deleteUser(id) {
        fetch(`http://192.168.64.175:9100/users/${id}`, {
            method: 'DELETE'
        }).then(() => fetchUsers());
    }

    // Récupérer les utilisateurs au chargement de la page
    fetchUsers();
});