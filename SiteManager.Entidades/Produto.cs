using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteManager.Entidades
{
    public class Produto
    {
        public int idProduto { get; set; }
        public int idGrupo { get; set; }
        public string nmProduto { get; set; }
        public string dsProdutos { get; set; }
        public bool flAtivo { get; set; }
        public bool flEstoque { get; set; }
    }

    public class ProdutoGrid
    {
        public int idProduto { get; set; }
        public int idGrupo { get; set; }
        public string nmGrupo { get; set; }
        public string nmProduto { get; set; }
        public string dsProdutos { get; set; }
        public int idProdutosImagens { get; set; }
        public bool flAtivo { get; set; }
        public bool flEstoque { get; set; }
    }
}
