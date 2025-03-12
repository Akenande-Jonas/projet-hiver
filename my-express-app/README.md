# My Express App

This project is a simple Express application that provides user registration, login functionality, and data retrieval from a MySQL database. It is built using TypeScript and includes middleware for authentication and data handling.

## Features

- User registration and login
- Secure password storage using bcrypt
- JSON Web Token (JWT) authentication
- CORS support
- MySQL database integration

## Project Structure

```
my-express-app
├── src
│   ├── app.ts               # Entry point of the application
│   ├── controllers          # Contains user-related operations
│   │   └── index.ts
│   ├── routes               # Defines application routes
│   │   └── index.ts
│   └── types                # TypeScript interfaces
│       └── index.ts
├── package.json             # NPM dependencies and scripts
├── tsconfig.json            # TypeScript configuration
└── README.md                # Project documentation
```

## Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd my-express-app
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Create a `.env` file in the root directory and add your database connection details and JWT secret:
   ```
   ACCESS_TOKEN_SECRET=your_secret_key
   DB_HOST=your_database_host
   DB_USER=your_database_user
   DB_PASSWORD=your_database_password
   DB_NAME=your_database_name
   ```

## Usage

To start the application, run:
```
npm start
```

The server will start on `http://localhost:9100`.

## API Endpoints

- `POST /register` - Register a new user
- `POST /login` - Log in an existing user
- `GET /accueil` - Access the protected home page (requires authentication)
- `GET /classement` - Retrieve the ranking data

## License

This project is licensed under the MIT License.