import Fastify from 'fastify';
import cors from '@fastify/cors'
import { appRoutes } from './routes';

const app = Fastify();
const PORT = 3333;

app.register(cors, {
  origin: 'https://localhost:3000'
})
app.register(appRoutes)



app.listen({
  port: PORT,
}).then(() => {
  console.log(`Server is running on ${PORT}`);
});
