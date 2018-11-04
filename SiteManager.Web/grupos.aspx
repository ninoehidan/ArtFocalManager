<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grupos.aspx.cs" Inherits="grupos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grupos para Venda</title>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/sitemanager.css" rel="stylesheet" />
</head>
<body>
    <form id="frmCadastro" runat="server">
    <h2>Grupos de Produtos da Loja</h2>
    <hr/>
    <div class="table-striped">
        <asp:Panel ID="pnlCadastro" runat="server" Width="810px">  
            <br />  
            <table class="table">  
                <tr>  
                    <td>Código</td>  
                    <td>  
                        <asp:TextBox ID="txtIdGrupo" runat="server" Width="110px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rfidGrupo" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtIdGrupo"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>
                    <td>Nome</td>  
                    <td>  
                        <asp:TextBox ID="txtNmGrupo" runat="server" Width="610px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rftxtNmGrupo" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtNmGrupo"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Descrição</td>  
                    <td>  
                        <asp:TextBox ID="txtDsGrupo" runat="server" Width="210px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rftxtDsGrupo" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtDsGrupo"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan="2" align="right">  
                        <asp:Button type="button" CssClass="btn btn-success" ID="btnSalvar" runat="server" Text="Salvar" ValidationGroup="vg1" OnClick="btnSalvar_Click" />  
                        <asp:Button type="button" CssClass="btn btn-danger" ID="btnCancelar" runat="server" Text="Cancelar" ValidationGroup="vg2" OnClick="btnCancelar_Click" />  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan="2" align="center">  
                        <asp:Panel ID="pnlMenu" runat="server" BackColor="Black" Font-Names="Arial" Font-Size="Medium" ForeColor="White" HorizontalAlign="Center">
                            <asp:HyperLink ID="lnkVoltar" runat="server" ForeColor="White" NavigateUrl="default.aspx">Voltar ao Menu</asp:HyperLink>
                        </asp:Panel>
                    </td>  
                </tr>  
            </table>  
            <asp:GridView ID="grdGrupos" runat="server" AutoGenerateColumns="False" OnRowEditing="grdGrupos_RowEditing" OnRowCancelingEdit="grdGrupos_RowCancelingEdit" OnRowUpdating="grdGrupos_RowUpdating" OnRowDeleting="grdGrupos_RowDeleting" Height="225px" Width="810px" OnRowDataBound="grdGrupos_RowDataBound">  
                <rowstyle cssclass="RowStyle" />
                <alternatingrowstyle cssclass="AlternateRowStyle" />
                <Columns>  
                    <asp:TemplateField HeaderText="Nome">  
                        <ItemTemplate>  
                            <asp:HiddenField ID="hfIdGrupo" Value='<% #Eval("idGrupo") %>' runat="server" />
                            <asp:Label ID="lblNmGrupo" runat="server" Text='<% #Bind("nmGrupo") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:HiddenField ID="hfIdGrupo" Value='<% #Eval("idGrupo") %>' runat="server" />
                            <asp:TextBox ID="txtGridNmGrupo" runat="server" Text='<% #Bind("nmGrupo") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  
      
                    <asp:TemplateField HeaderText="Descrição">  
                        <ItemTemplate>  
                            <asp:Label ID="lblDsGrupo" runat="server" Text='<% #Bind("dsGrupo") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txtGriDsGrupo" runat="server" Text='<% #Bind("dsGrupo") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  
      
                     <asp:CommandField ShowEditButton="true" ButtonType ="Image" EditImageUrl="Imagens/icon-edit.png" UpdateImageUrl="Imagens/icon-ok.png" CancelImageUrl="Imagens/icon-cancel.png" HeaderText="Editar" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>

                    <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="Imagens/icon-delete.png" HeaderText="Deletar">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
    <%--                <asp:CommandField ButtonType="Link" ShowEditButton="true" CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" InsertText="Inserir" NewText="Novo" SelectText="Selecionar" UpdateText="Atualizar" />  
                    <asp:CommandField ButtonType="Link" ShowDeleteButton="true" CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" InsertText="Inserir" NewText="Novo" SelectText="Selecionar" UpdateText="Atualizar" />  --%>
                </Columns>  
            </asp:GridView>  
        </asp:Panel>  
    </div>
        <asp:Label ID="lblaviso" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
