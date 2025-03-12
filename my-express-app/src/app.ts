import express from 'express';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import { createConnection } from 'mysql';
import { userRoutes } from './routes/index';

const app = express();
const port = 9100;

// Middleware
app.use(cors());
app.use(express.json());
app.use(cookieParser());

// Database connection
const dbConnection = createConnection({
    host: '192.168.64.175',
    user: 'site1',
    password: 'yuzu007',
    database: 'Classement'
});

dbConnection.connect(err => {
    if (err) throw err;
    console.log("Connected to the database!");
});

// Routes
app.use('/api', userRoutes);

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});