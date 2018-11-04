using System;
using System.Linq;
using SiteManager.Model;
using SiteManager.Entidades;

namespace SiteManager.Persistencia
{
    public class Produtos
    {
        public IQueryable<Model.produtos> RetornaTodos()
        {
            var db = new artfocalEntities();

            return (from pro in db.produtos select pro);
        }

        public void Adicionar(Produto produto)
        {
            var db = new artfocalEntities();

            try
            {
                int idProduto = (from pro in db.produtos select pro).Count() + 1;

                var produtos = db.produtos.Create();

                produtos.idProduto = idProduto;
                produtos.idGrupo = produto.idGrupo;
                produtos.nmProduto = produto.nmProduto;
                produtos.dsProdutos = produto.dsProdutos;
                produtos.flAtivo = produto.flAtivo;
                produtos.flEstoque = produto.flEstoque;

                db.produtos.Add(produtos);
                db.SaveChanges();
            }
            catch (Exception erro)
            {
                throw erro;
            }
            finally
            {
                db.Dispose();
            }
        }

        public void Atualizar(Produto produto)
        {
            var db = new artfocalEntities();

            try
            {
                var produtos = (from pro in db.produtos where pro.idProduto == produto.idProduto select pro).FirstOrDefault();

                produtos.idProduto = produto.idProduto;
                produtos.idGrupo = produto.idGrupo;
                produtos.nmProduto = produto.nmProduto;
                produtos.dsProdutos = produto.dsProdutos;
                produtos.flAtivo = produto.flAtivo;
                produtos.flEstoque = produto.flEstoque;

                db.SaveChanges();
            }
            catch (Exception erro)
            {
                throw erro;
            }
            finally
            {
                db.Dispose();
            }
        }

        public void Apagar(int empresa)
        {
            var db = new artfocalEntities();

            try
            {
                var produtos = (from pro in db.produtos where pro.idProduto == empresa select pro).FirstOrDefault();

                db.produtos.Remove(produtos);

                db.SaveChanges();
            }
            catch (Exception erro)
            {
                throw erro;
            }
            finally
            {
                db.Dispose();
            }
        }
    }
}
