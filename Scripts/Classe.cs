using System;

namespace Kalleotopia
{
    public class Classe
    {
        public int IdClasse { get; set; }
        public string NomeClasse { get; set; }
        public string InfoClasse { get; set; }
        public int DanoClasse { get; set; }
        public decimal VelocidadeAtaqueClasse { get; set; }
        public decimal RouboVidaClasse { get; set; }
        public int Mana { get; set; }
        
        // Relacionamento com Evoluções de Classe
        public virtual ICollection<EvolucaoClasse> Evolucoes { get; set; }

        // Relacionamento com Personagens
        public virtual ICollection<PersonagemClasse> Personagens { get; set; }

        // Construtor padrão
        public Classe()
        {
            Evolucoes = new List<EvolucaoClasse>();
            Personagens = new List<PersonagemClasse>();
        }
    }
}
