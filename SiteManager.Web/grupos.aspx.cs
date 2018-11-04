using System;
using System.Linq;
using System.Web.UI.WebControls;

using SiteManager.Entidades;
using SiteManager.Persistencia;

public partial class grupos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) BindGrid();
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        if (this.Page.IsValid)
        {
            int idGru = Convert.ToInt32(txtIdGrupo.Text);

            if (new Grupos().RetornaTodos().Where(p => p.idGrupo == idGru).Count() > 0)
            {
                Response.Write("<script>alert('Código já existe');</script>");
                return;
            }

            Grupo gru = new Grupo()
            {
                idGrupo = idGru,
                nmGrupo = txtNmGrupo.Text,
                dsGrupo = txtDsGrupo.Text
            };

            new Grupos().Adicionar(gru);

            grdGrupos.EditIndex = -1;
            BindGrid();
            ClearFields();
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ClearFields();
    }

    protected void grdGrupos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Grupo gru = new Grupo()
        {
            idGrupo = Convert.ToInt32(((HiddenField)grdGrupos.Rows[e.RowIndex].FindControl("hfIdGrupo")).Value),
            nmGrupo = ((TextBox)grdGrupos.Rows[e.RowIndex].FindControl("txtGridNmGrupo")).Text,
            dsGrupo = ((TextBox)grdGrupos.Rows[e.RowIndex].FindControl("txtGriDsGrupo")).Text,
        };

        new Grupos().Atualizar(gru);

        grdGrupos.EditIndex = -1;
        BindGrid();
    }

    protected void grdGrupos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdGrupos.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void grdGrupos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        new Grupos().Apagar(Convert.ToInt32(((HiddenField)grdGrupos.Rows[e.RowIndex].FindControl("hfIdGrupo")).Value));
        BindGrid();
    }

    protected void grdGrupos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdGrupos.EditIndex = -1;
        BindGrid();
    }

    private void BindGrid()
    {
        var listaGrupos = new Grupos().RetornaTodos();
        grdGrupos.DataSource = listaGrupos.ToList();
        grdGrupos.DataBind();
    }

    private void ClearFields()
    {
        txtIdGrupo.Text = string.Empty;
        txtNmGrupo.Text = string.Empty;
        txtDsGrupo.Text = string.Empty;
    }

    protected void grdGrupos_RowDataBound(object sender, GridViewRowEventArgs e)
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
}