using System;
using System.Linq;
using SiteManager.Model;
using SiteManager.Entidades;

namespace SiteManager.Persistencia
{
    public class Imagens
    {
        public IQueryable<Model.imagens> RetornaTodos()
        {
            var db = new artfocalEntities();

            return (from img in db.imagens select img);
        }

        public void Adicionar(Imagem imagem)
        {
            var db = new artfocalEntities();

            try
            {
                var imagens = db.imagens.Create();

                imagens.idImagem = imagem.idImagem;
                imagens.nmImagem = imagem.nmImagem;
                imagens.imImagem = imagem.imImagem;

                db.imagens.Add(imagens);
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

        public void Atualizar(Imagem imagem)
        {
            var db = new artfocalEntities();

            try
            {
                var imagens = (from img in db.imagens where img.idImagem == imagem.idImagem select img).FirstOrDefault();

                imagens.idImagem = imagem.idImagem;
                imagens.nmImagem = imagem.nmImagem;
                imagens.imImagem = imagem.imImagem;

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

        public void Apagar(int imagem)
        {
            var db = new artfocalEntities();

            try
            {
                var imagens = (from img in db.imagens where img.idImagem == imagem select img).FirstOrDefault();

                db.imagens.Remove(imagens);

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
