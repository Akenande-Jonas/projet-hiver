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