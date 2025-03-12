export interface User {
    id: number;
    username: string;
    password: string;
}

export interface AuthRequest {
    username: string;
    password: string;
}

export interface AuthResponse {
    accessToken: string;
}

export interface Match {
    id: number;
    Equipe1: number;
    Equipe2: number;
    Butequipe1: number;
    Butequipe2: number;
    nom_equipe1: string;
    nom_equipe2: string;
}

export interface Ranking {
    id: number;
    nom: string;
    matchsJoues: number;
    points: number;
    butsPour: number;
    butsContre: number;
    differenceButs: number;
}