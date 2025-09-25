namespace Kalleotopia
{
    public class PersonagemClasse
    {
        public int IdPersonagem { get; set; }
        public int IdClasse { get; set; }

        // Relacionamento com Personagem
        public virtual Personagem Personagem { get; set; }

        // Relacionamento com Classe
        public virtual Classe Classe { get; set; }
    }
}
