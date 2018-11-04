using System;
using System.Linq;
using System.Web.UI.WebControls;

using SiteManager.Entidades;
using SiteManager.Persistencia;

public partial class empresas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) BindGrid();
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        if (this.Page.IsValid)
        {
            //int idEmp = Convert.ToInt32(txtIdEmpresa.Text);

            //if (new Empresas().RetornaTodos().Where(p => p.idEmpresa == idEmp).Count() > 0)
            //{
            //    Response.Write("<script>alert('Código já existe');</script>");
            //    return;
            //}

            Empresa emp = new Empresa()
            {
                //idEmpresa = idEmp,
                nmEmpresa = txtNmEmpresa.Text,
                dsCNPJ = txtDsCNPJ.Text,
                dsEndereco = txtDsEndereco.Text,
                flAtivo = chkAtivo.Checked
            };

            new Empresas().Adicionar(emp);

            grdEmpresas.EditIndex = -1;
            BindGrid();
            ClearFields();
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ClearFields();
    }

    protected void grdEmpresas_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Empresa emp = new Empresa()
        {
            idEmpresa = Convert.ToInt32(((HiddenField)grdEmpresas.Rows[e.RowIndex].FindControl("hfIdEmpresa")).Value),
            nmEmpresa = ((TextBox)grdEmpresas.Rows[e.RowIndex].FindControl("txtGridNmEmpresa")).Text,
            dsCNPJ = ((TextBox)grdEmpresas.Rows[e.RowIndex].FindControl("txtGridCNPJ")).Text,
            dsEndereco = ((TextBox)grdEmpresas.Rows[e.RowIndex].FindControl("txtGridEndereco")).Text,
            flAtivo = ((CheckBox)grdEmpresas.Rows[e.RowIndex].FindControl("chkGridFlAtivo")).Checked
        };

        new Empresas().Atualizar(emp);

        grdEmpresas.EditIndex = -1;
        BindGrid();
    }

    protected void grdEmpresas_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdEmpresas.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void grdEmpresas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        new Empresas().Apagar(Convert.ToInt32(((HiddenField)grdEmpresas.Rows[e.RowIndex].FindControl("hfIdEmpresa")).Value));
        BindGrid();
    }

    protected void grdEmpresas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdEmpresas.EditIndex = -1;
        BindGrid();
    }

    private void BindGrid()
    {
        var listaEmpresas = new Empresas().RetornaTodos();
        grdEmpresas.DataSource = listaEmpresas.ToList();
        grdEmpresas.DataBind();
    }

    private void ClearFields()
    {
        //txtIdEmpresa.Text = string.Empty;
        txtNmEmpresa.Text = string.Empty;
        txtDsEndereco.Text = string.Empty;
        txtDsCNPJ.Text = string.Empty;
        chkAtivo.Checked = false;
    }

    protected void grdEmpresas_RowDataBound(object sender, GridViewRowEventArgs e)
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
                //if (e.Row.RowType == DataControlRowType.DataRow)
                //{
                //    ImageButton deleteButton = (ImageButton)e.Row.Cells[5].Controls[0];

                //    if (deleteButton != null)
                //        deleteButton.OnClientClick = "if (!window.confirm('Confirma a exclusão deste registro ?')) return false;";
                //}
            }
        }
        catch (Exception ex)
        {
            //lblaviso.Text = ex.Message;
        }
    }

    protected void grdEmpresas_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
    }
}