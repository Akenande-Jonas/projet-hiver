import { Request, Response } from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { bddConnection } from '../app'; // Assuming bddConnection is exported from app.ts

export const registerUser = async (req: Request, res: Response) => {
    try {
        const hashedPassword = await bcrypt.hash(req.body.password, 10);
        const user = { username: req.body.username, password: hashedPassword };
        bddConnection.query('INSERT INTO users SET ?', user, (err) => {
            if (err) {
                return res.status(500).send('Erreur lors de l\'enregistrement de l\'utilisateur');
            }
            res.status(201).send('Utilisateur enregistré');
        });
    } catch {
        res.status(500).send('Erreur lors de l\'enregistrement');
    }
};

export const loginUser = (req: Request, res: Response) => {
    const username = req.body.username;
    const password = req.body.password;
    bddConnection.query('SELECT * FROM users WHERE username = ?', [username], async (err, rows) => {
        if (err) {
            return res.status(500).send('Erreur lors de la connexion');
        }
        if (rows.length === 0) {
            return res.status(400).send('Utilisateur non trouvé');
        }
        try {
            if (await bcrypt.compare(password, rows[0].password)) {
                const user = { name: username };
                const accessToken = jwt.sign(user, process.env.ACCESS_TOKEN_SECRET);
                res.cookie('token', accessToken, { httpOnly: true });
                res.json({ accessToken });
            } else {
                res.send('Mot de passe incorrect');
            }
        } catch {
            res.status(500).send('Erreur lors de la connexion');
        }
    });
};

export const authenticateToken = (req: Request, res: Response, next: Function) => {
    const token = req.cookies.token;
    if (token == null) return res.sendStatus(401);
    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.sendStatus(403);
        req.user = user;
        next();
    });
};