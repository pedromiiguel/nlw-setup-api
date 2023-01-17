import Fastify from 'fastify';
import cors from '@fastify/cors'
import { PrismaClient } from '@prisma/client';

const app = Fastify();
const prisma = new PrismaClient();
const PORT = 3333;

app.register(cors, {
  origin: 'https://localhost:3000'
})

app.get('/', async (req, res) => {
 const habits = await prisma.habit.findMany()

  return habits
});

app.listen({
  port: PORT,
}).then(() => {
  console.log(`Server is running on ${PORT}`);
});
