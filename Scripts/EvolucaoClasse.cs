namespace Kalleotopia
{
    public class EvolucaoClasse
    {
        public int IdEvolucao { get; set; }
        public string NomeEvolucao { get; set; }
        public string InfoEvolucao { get; set; }
        public int IdClasse { get; set; }

        // Relacionamento com Classe
        public virtual Classe Classe { get; set; }
    }
}
