namespace SiteManager.Entidades
{
    public class Empresa
    {
        public int idEmpresa { get; set; }
        public string nmEmpresa { get; set; }
        public string dsCNPJ { get; set; }
        public string dsEndereco { get; set; }
        public bool flAtivo { get; set; }
    }
}
