<%@ Page Language="C#" AutoEventWireup="true" CodeFile="empresas.aspx.cs" Inherits="empresas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Empresas para Venda</title>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/sitemanager.css" rel="stylesheet" />
</head>
<body>
    <form id="frmCadastro" runat="server">
    <h2>Empresas disponíveis para Venda</h2>
    <hr/>
    <div class="table-striped">
        <asp:Panel ID="pnlCadastro" runat="server" Width="810px">  
            <br />  
            <table class="table">  
<%--                <tr>  
                    <td>Código</td>  
                    <td>  
                        <asp:TextBox ID="txtIdEmpresa" runat="server" Width="110px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rfidEmpresa" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtIdEmpresa"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  --%>
                <tr>
                    <td>Nome</td>  
                    <td>  
                        <asp:TextBox ID="txtNmEmpresa" runat="server" Width="610px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rftxtNmEmpresa" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtNmEmpresa"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>  
                    <td>CNPJ</td>  
                    <td>  
                        <asp:TextBox ID="txtDsCNPJ" runat="server" Width="210px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rftxtDsCNPJ" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtDsCNPJ"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>
                    <td>Endereço</td>  
                    <td>  
                        <asp:TextBox ID="txtDsEndereco" runat="server" Width="610px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rftxtDsEndereco" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtDsEndereco"></asp:RequiredFieldValidator>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Ativa?</td>  
                    <td>  
                        <asp:CheckBox ID="chkAtivo" runat="server" Text="Sim" Width="100px" />
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
            <asp:GridView ID="grdEmpresas" runat="server" AutoGenerateColumns="False" OnRowEditing="grdEmpresas_RowEditing" OnRowCancelingEdit="grdEmpresas_RowCancelingEdit" OnRowUpdating="grdEmpresas_RowUpdating" OnRowDeleting="grdEmpresas_RowDeleting" Height="225px" Width="810px" OnRowDataBound="grdEmpresas_RowDataBound" OnRowDeleted="grdEmpresas_RowDeleted">  
                <rowstyle cssclass="RowStyle" />
                <alternatingrowstyle cssclass="AlternateRowStyle" />
                <Columns>  
                    <asp:TemplateField HeaderText="Nome">  
                        <ItemTemplate>  
                            <asp:HiddenField ID="hfIdEmpresa" Value='<% #Eval("idEmpresa") %>' runat="server" />
                            <asp:Label ID="lblNmEmpresa" runat="server" Text='<% #Bind("nmEmpresa") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:HiddenField ID="hfIdEmpresa" Value='<% #Eval("idEmpresa") %>' runat="server" />
                            <asp:TextBox ID="txtGridNmEmpresa" runat="server" Text='<% #Bind("nmEmpresa") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  
      
                    <asp:TemplateField HeaderText="CNPJ">  
                        <ItemTemplate>  
                            <asp:Label ID="lblDsCNPJ" runat="server" Text='<% #Bind("dsCNPJ") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txtGridCNPJ" runat="server" Text='<% #Bind("dsCNPJ") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  
      
                    <asp:TemplateField HeaderText="Endereço">  
                        <ItemTemplate>  
                            <asp:Label ID="lblDsEndereco" runat="server" Text='<% #Bind("dsEndereco") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txtGridEndereco" runat="server" Text='<% #Bind("dsEndereco") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  
      
                    <asp:TemplateField HeaderText="Ativo">  
                        <ItemTemplate>  
                            <asp:CheckBox ID="chkFlAtivo" runat="server" Checked='<% #Eval("flAtivo") %>' Enabled="false"></asp:CheckBox>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:CheckBox ID="chkGridFlAtivo" runat="server" Checked='<% #Bind("flAtivo") %>'></asp:CheckBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  

                     <asp:CommandField ShowEditButton="true" ButtonType ="Image" EditImageUrl="Imagens/icon-edit.png" UpdateImageUrl="Imagens/icon-ok.png" CancelImageUrl="Imagens/icon-cancel.png" HeaderText="Editar" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>

                    <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="Imagens/icon-delete.png" HeaderText="Deletar" >
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
