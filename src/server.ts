import Fastify from 'fastify';
import cors from '@fastify/cors';
import { appRoutes } from './routes';

const app = Fastify();
const PORT: number = Number(process.env.PORT) || 3333;
console.log(PORT);

app.register(cors, {
  origin: '*',
});
app.register(appRoutes);

app
  .listen({
    port: PORT,
  })
  .then(() => {
    console.log(`Server is running on ${PORT}`);
  });
