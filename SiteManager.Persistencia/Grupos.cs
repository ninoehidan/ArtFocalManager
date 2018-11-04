using System;
using System.Linq;
using SiteManager.Model;
using SiteManager.Entidades;

namespace SiteManager.Persistencia
{
    public class Grupos
    {
        public IQueryable<Model.grupos_produto> RetornaTodos()
        {
            var db = new artfocalEntities();

            return (from gru in db.grupos_produto select gru);
        }

        public void Adicionar(Grupo grupo)
        {
            var db = new artfocalEntities();

            try
            {
                var grupos = db.grupos_produto.Create();

                grupos.idGrupo = grupo.idGrupo;
                grupos.nmGrupo = grupo.nmGrupo;
                grupos.dsGrupo = grupo.dsGrupo;

                db.grupos_produto.Add(grupos);
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

        public void Atualizar(Grupo grupo)
        {
            var db = new artfocalEntities();

            try
            {
                var grupos = (from gru in db.grupos_produto where gru.idGrupo == grupo.idGrupo select gru).FirstOrDefault();

                grupos.idGrupo = grupo.idGrupo;
                grupos.nmGrupo = grupo.nmGrupo;
                grupos.dsGrupo = grupo.dsGrupo;

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

        public void Apagar(int grupo)
        {
            var db = new artfocalEntities();

            try
            {
                var grupos = (from gru in db.grupos_produto where gru.idGrupo == grupo select gru).FirstOrDefault();

                db.grupos_produto.Remove(grupos);

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
