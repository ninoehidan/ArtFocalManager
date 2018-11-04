using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

using SiteManager.Entidades;
using SiteManager.Persistencia;
using System.IO;

public partial class produtos : System.Web.UI.Page
{
    private static List<string> arquivosEnviados = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
            BindEmpresas();
            BindGrupos();
            ClearListAndFiles();
        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        ClearListAndFiles();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ClearFields();
        ClearListAndFiles();
    }

    protected void grdProdutos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Empresa emp = new Empresa()
        //{
        //    idEmpresa = Convert.ToInt32(((HiddenField)grdEmpresas.Rows[e.RowIndex].FindControl("hfIdEmpresa")).Value),
        //    nmEmpresa = ((TextBox)grdEmpresas.Rows[e.RowIndex].FindControl("txtGridNmEmpresa")).Text,
        //    dsCNPJ = ((TextBox)grdEmpresas.Rows[e.RowIndex].FindControl("txtGridCNPJ")).Text,
        //    dsEndereco = ((TextBox)grdEmpresas.Rows[e.RowIndex].FindControl("txtGridEndereco")).Text,
        //    flAtivo = ((CheckBox)grdEmpresas.Rows[e.RowIndex].FindControl("chkGridFlAtivo")).Checked
        //};

        //new Empresas().Atualizar(emp);

        //grdEmpresas.EditIndex = -1;
        //BindGrid();
    }

    protected void grdProdutos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //grdEmpresas.EditIndex = e.NewEditIndex;
        //BindGrid();
    }

    protected void grdProdutos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        new Produtos().Apagar(Convert.ToInt32(((HiddenField)grdProdutos.Rows[e.RowIndex].FindControl("hfIdProduto")).Value));
        BindGrid();
    }

    protected void grdProdutos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdProdutos.EditIndex = -1;
        BindGrid();
    }

    private void BindGrid()
    {
        var listaProdutos = new Produtos().RetornaTodos();
        grdProdutos.DataSource = listaProdutos.ToList();
        grdProdutos.DataBind();
    }

    private void BindEmpresas()
    {
        var listaEmpresas = new Empresas().RetornaTodos().Where(p => p.flAtivo.Equals(true));
        //cblEmpresas.DataMember = "nmEmpresa";
        cblEmpresas.DataValueField = "idEmpresa";
        cblEmpresas.DataTextField = "nmEmpresa";
        cblEmpresas.DataSource = listaEmpresas.ToList();
        cblEmpresas.DataBind();
    }

    private void BindGrupos()
    {
        var listaGrupos = new Grupos().RetornaTodos();
        //cblEmpresas.DataMember = "nmEmpresa";
        ddlGrupo.DataValueField = "idGrupo";
        ddlGrupo.DataTextField = "nmGrupo";
        ddlGrupo.DataSource = listaGrupos.ToList();
        ddlGrupo.DataBind();

        ddlGrupo.SelectedIndex = -1;
        ddlGrupo.SelectedValue = null;
        ddlGrupo.ClearSelection();
    }

    private void ClearFields()
    {
        cblEmpresas.SelectedIndex = -1;
        cblEmpresas.SelectedValue = null;
        cblEmpresas.ClearSelection();

        ddlGrupo.SelectedIndex = -1;
        ddlGrupo.SelectedValue = null;
        ddlGrupo.ClearSelection();

        cblImagens.SelectedIndex = -1;
        cblImagens.SelectedValue = null;
        cblImagens.ClearSelection();

        txtNmProduto.Text = string.Empty;
        txtDsProduto.Text = string.Empty;
        chkEstoque.Checked = false;
        chkAtivo.Checked = false;

        foreach (string arquivo in arquivosEnviados)
        {
            File.Delete(arquivo);
        }

        arquivosEnviados = new List<string>();
    }

    private void ClearListAndFiles()
    {
        // Limpa lista e arquivos após salvar
        foreach (string arquivo in arquivosEnviados)
        {
            File.Delete(arquivo);
        }

        arquivosEnviados = new List<string>();
    }

    protected void grdProdutos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if ((e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == DataControlRowState.Alternate) || e.Row.RowState == DataControlRowState.Edit)
            {
                return;
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (DataControlFieldCell cell in e.Row.Cells)
                {
                    foreach (System.Web.UI.Control control in cell.Controls)
                    {
                        ImageButton button = control as ImageButton;
                        if (button != null && button.CommandName == "Delete")
                            // Add delete confirmation
                            button.OnClientClick = "if (!confirm('Confirma a exclusão deste registro ?')) return;";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblaviso.Text = ex.Message;
        }
    }

    protected void grdProdutos_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnAbrirImagens_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        mpeImagens.Show();
    }

    protected void btnSalvarImagem_Click(object sender, EventArgs e)
    {
        if (this.Page.IsValid)
        {
            foreach (string arquivo in arquivosEnviados)
            {
                FileStream fs = new FileStream(arquivo, FileMode.Open);
                BufferedStream bf = new BufferedStream(fs);
                byte[] buffer = new byte[bf.Length];
                bf.Read(buffer, 0, buffer.Length);

                byte[] buffer_new = buffer;

                bf.Close();
                bf.Dispose();

                fs.Close();
                fs.Dispose();

                GC.Collect();

            }
        }
    }

    protected void btnCancelarImagem_Click(object sender, EventArgs e)
    {
        foreach (string arquivo in arquivosEnviados)
        {
            File.Delete(arquivo);
        }

        mpeImagens.Hide();
    }

    protected void afuUploadImage_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string nomeArquivo = e.FileName;
        afuUploadImage.SaveAs(Server.MapPath("~/Upload/" + nomeArquivo));

        arquivosEnviados.Add(Server.MapPath("~/Upload/" + nomeArquivo));
    }
}