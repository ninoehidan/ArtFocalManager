<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imagens.aspx.cs" Inherits="imagens" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imagens do Produto</title>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/sitemanager.css" rel="stylesheet" />
</head>
<body>
    <form id="frmCadastro" runat="server">
        <div class="table-striped">
            <asp:Panel ID="pnlCadastro" runat="server" Width="510px" Height="510px">  
                <asp:HiddenField ID="hfIdImagem" runat="server" />
                <br />  
                <table class="table">  
                    <tr>
                        <td>Nome</td>  
                        <td>  
                            <asp:TextBox ID="txtNmImagem" runat="server" Width="410px" MaxLength="50"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="rftxtNmImagem" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtNmImagem"></asp:RequiredFieldValidator>  
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
            </asp:Panel>  
        </div>
        <asp:Label ID="lblaviso" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
