import controller from '../controllers/usuarioController';
import verifyToken from '../middleware/verifyToken';
import verifyPermission from '../middleware/verifyPermission';

export default (app) => {
  app.post('/usuario/persist', controller.persist);
  app.post('/usuario/persist/:id', controller.persist);
  app.post('/usuario/destroy', controller.destroy);
  app.get('/usuario', verifyToken, verifyPermission, controller.get);
  app.get('/usuario/:id', controller.get);
  app.post('/usuario/login', controller.login);
  app.post('/usuario/register', controller.register);
  app.post('/usuario/update', controller.update);
};
