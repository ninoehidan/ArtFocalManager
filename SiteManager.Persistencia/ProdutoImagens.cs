using System;
using System.Linq;
using SiteManager.Model;
using SiteManager.Entidades;

namespace SiteManager.Persistencia
{
    public class ProdutoImagens
    {
        public IQueryable<Model.produtos_imagens> RetornaTodos()
        {
            var db = new artfocalEntities();

            return (from img in db.produtos_imagens select img);
        }

        public IQueryable<Model.produtos_imagens> RetornaImagensByProduto(int idProduto)
        {
            var db = new artfocalEntities();

            return (from img in db.produtos_imagens select img).Where(p => p.idProduto == idProduto);
        }

        public void Adicionar(ProdutoImagem imagem)
        {
            var db = new artfocalEntities();

            try
            {
                var imagens = db.produtos_imagens.Create();

                imagens.idImagem = imagem.idImagem;
                imagens.idProduto = imagem.idProduto;

                db.produtos_imagens.Add(imagens);
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

        public void Atualizar(ProdutoImagem imagem)
        {
            var db = new artfocalEntities();

            try
            {
                var imagens = (from img in db.produtos_imagens where img.idImagem == imagem.idImagem  && img.idProduto == imagem.idProduto select img).FirstOrDefault();

                imagens.idImagem = imagem.idImagem;
                imagens.idProduto = imagem.idProduto;

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

        public void Apagar(int imagem, int produto)
        {
            var db = new artfocalEntities();

            try
            {
                var imagens = (from img in db.produtos_imagens where img.idImagem == imagem && img.idProduto == produto select img).FirstOrDefault();

                db.produtos_imagens.Remove(imagens);

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
