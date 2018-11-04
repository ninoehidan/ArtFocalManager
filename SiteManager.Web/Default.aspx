<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlTitulo" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Names="Arial" Font-Size="X-Large" HorizontalAlign="Center">
                <asp:Label ID="lblHeader" runat="server" Text="Administração dos Dados do Site"></asp:Label>
            </asp:Panel>
            <br />
            <asp:Panel ID="pnlMenu" runat="server" BackColor="Black" Font-Names="Arial" Font-Size="Large" ForeColor="White" HorizontalAlign="Center">
                <table style="width: 100%; align-items:center; align-content:center;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:HyperLink ID="lnkEmpresas" runat="server" ForeColor="White" NavigateUrl="empresas.aspx">Empresas</asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="lnkGrupos" runat="server" ForeColor="White" NavigateUrl="grupos.aspx">Grupos</asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="lnkProdutos" runat="server" ForeColor="White" NavigateUrl="produtos.aspx">Produtos</asp:HyperLink>
                        </td>
                    </tr>
                </table>
                
            </asp:Panel>
        </div>
    </form>
</body>
</html>
