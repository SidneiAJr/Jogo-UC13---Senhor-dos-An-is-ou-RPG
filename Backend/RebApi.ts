import express from "express";
import { PrismaClient } from "@prisma/client"; // ORM pra BD

const app = express();
const prisma = new PrismaClient();

app.use(express.json());

// rota para buscar player
app.get("/player/:id", async (req, res) => {
    const id = Number(req.params.id);
    const player = await prisma.player.findUnique({ where: { id } });
    res.json(player);
});

// rota para salvar novo player
app.post("/player", async (req, res) => {
    const { nome, classe, vida } = req.body;
    const novoPlayer = await prisma.player.create({
        data: { nome, classe, vida }
    });
    res.json(novoPlayer);
});

app.listen(3000, () => console.log("API rodando na porta 3000"));
