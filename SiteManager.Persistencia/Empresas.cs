using System;
using System.Linq;
using SiteManager.Model;
using SiteManager.Entidades;

namespace SiteManager.Persistencia
{
    public class Empresas
    {
        public IQueryable<Model.empresas> RetornaTodos()
        {
            var db = new artfocalEntities();

            return (from emp in db.empresas select emp);
        }

        public void Adicionar(Empresa empresa)
        {
            var db = new artfocalEntities();

            try
            {
                var empresas = db.empresas.Create();

                empresas.idEmpresa = empresa.idEmpresa;
                empresas.nmEmpresa = empresa.nmEmpresa;
                empresas.dsCNPJ = empresa.dsCNPJ;
                empresas.dsEndereco = empresa.dsEndereco;
                empresas.flAtivo = empresa.flAtivo;

                db.empresas.Add(empresas);
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

        public void Atualizar(Empresa empresa)
        {
            var db = new artfocalEntities();

            try
            {
                var empresas = (from emp in db.empresas where emp.idEmpresa == empresa.idEmpresa select emp).FirstOrDefault();

                empresas.idEmpresa = empresa.idEmpresa;
                empresas.nmEmpresa = empresa.nmEmpresa;
                empresas.dsCNPJ = empresa.dsCNPJ;
                empresas.dsEndereco = empresa.dsEndereco;
                empresas.flAtivo = empresa.flAtivo;

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
                var empresas = (from emp in db.empresas where emp.idEmpresa == empresa select emp).FirstOrDefault();

                db.empresas.Remove(empresas);

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
