//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SiteManager.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class grupos_produto
    {
        public grupos_produto()
        {
            this.produtos = new HashSet<produtos>();
        }
    
        public int idGrupo { get; set; }
        public string nmGrupo { get; set; }
        public string dsGrupo { get; set; }
    
        public virtual ICollection<produtos> produtos { get; set; }
    }
}
