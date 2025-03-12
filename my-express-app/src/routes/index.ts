import { Router } from 'express';
import { registerUser, loginUser, getUsers } from '../controllers/index';

const router = Router();

router.post('/register', registerUser);
router.post('/login', loginUser);
router.get('/users', getUsers);

export default router;