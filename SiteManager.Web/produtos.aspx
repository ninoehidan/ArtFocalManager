<%@ Page Language="C#" AutoEventWireup="true" CodeFile="produtos.aspx.cs" Inherits="produtos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Produtos da Empresa</title>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/sitemanager.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
         $(document).ready(function () {
             AjaxFileUpload_change_text();
 
         });
 
         function AjaxFileUpload_change_text() {
             Sys.Extended.UI.Resources.AjaxFileUpload_SelectFile = "Selecionar";
             Sys.Extended.UI.Resources.AjaxFileUpload_DropFiles = "Arraste os arquivos aqui";
             Sys.Extended.UI.Resources.AjaxFileUpload_Pending = "pendente";
             Sys.Extended.UI.Resources.AjaxFileUpload_Remove = "Remover";
             Sys.Extended.UI.Resources.AjaxFileUpload_Upload = "Enviar";
             Sys.Extended.UI.Resources.AjaxFileUpload_Uploaded = "Enviado";
             Sys.Extended.UI.Resources.AjaxFileUpload_UploadedPercentage = "enviado {0} %";
             Sys.Extended.UI.Resources.AjaxFileUpload_Uploading = "Enviando";
             Sys.Extended.UI.Resources.AjaxFileUpload_FileInQueue = "{0} arquivo(s) na fila.";
             Sys.Extended.UI.Resources.AjaxFileUpload_AllFilesUploaded = "Todos arquivos enviados.";
             Sys.Extended.UI.Resources.AjaxFileUpload_FileList = "Lista dos arquivos encviados:";
             Sys.Extended.UI.Resources.AjaxFileUpload_SelectFileToUpload = "Selecione os arquivos para enviar.";
             Sys.Extended.UI.Resources.AjaxFileUpload_Cancelling = "Cancelando...";
             Sys.Extended.UI.Resources.AjaxFileUpload_UploadError = "Um erro ocorreu durante envio do arquivo.";
             Sys.Extended.UI.Resources.AjaxFileUpload_CancellingUpload = "Cancelando envio...";
             Sys.Extended.UI.Resources.AjaxFileUpload_UploadingInputFile = "Enviando arquivo: {0}.";
             Sys.Extended.UI.Resources.AjaxFileUpload_Cancel = "Cancelar";
             Sys.Extended.UI.Resources.AjaxFileUpload_Canceled = "cancelado";
             Sys.Extended.UI.Resources.AjaxFileUpload_UploadCanceled = "Envio de arquivo cancelado";
             Sys.Extended.UI.Resources.AjaxFileUpload_DefaultError = "Erro ao enviar aquivo";
             Sys.Extended.UI.Resources.AjaxFileUpload_UploadingHtml5File = "Enviando arquivo: {0} de {1} bytes.";
             Sys.Extended.UI.Resources.AjaxFileUpload_error = "erro";
         }
 
    </script>
</head>
<body>
    <form id="frmCadastro" runat="server">
        <h2>Produtos da Loja</h2>
        <hr/>
        <div class="table-striped">
            <asp:Panel ID="pnlCadastro" runat="server" Width="810px">  
                <asp:HiddenField ID="hfIdEmpresa" runat="server" />
                <asp:HiddenField ID="hfIdGrupo" runat="server" />
                <asp:HiddenField ID="hfIdImagem" runat="server" />
                <br />  
                <table class="table">  
                    <tr>
                        <td>Empresas</td>  
                        <td>  
                            <asp:ListBox ID="cblEmpresas" runat="server" Width="274px" SelectionMode="Multiple"></asp:ListBox>  
                        </td>  
                    </tr>  
                    <tr>
                        <td>Grupo</td>  
                        <td>  
                            <asp:DropDownList ID="ddlGrupo" runat="server" Width="274px"></asp:DropDownList>  
                            <asp:RequiredFieldValidator ID="rfigGripo" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="ddlGrupo"></asp:RequiredFieldValidator>  
                        </td>  
                    </tr>  
                    <tr>
                        <td>Nome</td>  
                        <td>  
                            <asp:TextBox ID="txtNmProduto" runat="server" Width="610px" MaxLength="50"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="rftxtNmProduto" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtNmProduto"></asp:RequiredFieldValidator>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td>Descrição</td>  
                        <td>  
                            <asp:TextBox ID="txtDsProduto" runat="server" Width="610px" Height="81px" MaxLength="500" TextMode="MultiLine"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="rftxtDsProduto" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtDsProduto"></asp:RequiredFieldValidator>  
                        </td>  
                    </tr>  
                    <tr>
                        <td>Imagens</td>  
                        <td>  
                            <asp:CheckBoxList ID="cblImagens" runat="server" Width="110px"></asp:CheckBoxList>&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnAddImage" runat="server" ImageUrl="Imagens/icon-add.png" OnClick="btnAbrirImagens_Click" />
                        </td>  
                    </tr>  
                    <tr>  
                        <td>Estoque?</td>  
                        <td>  
                            <asp:CheckBox ID="chkEstoque" runat="server" Text="Sim" Width="100px" />
                       </td>  
                    </tr>  
                    <tr>  
                        <td>Ativo?</td>  
                        <td>  
                            <asp:CheckBox ID="chkAtivo" runat="server" Text="Sim" Width="100px" />
                       </td>  
                    </tr>  
                    <tr>  
                        <td colspan="2" align="right">  
                            <asp:Button type="button" CssClass="btn btn-success" ID="btnSalvar" runat="server" Text="Salvar" ValidationGroup="vg1" OnClick="btnSalvar_Click" />  
                            <asp:Button type="button" CssClass="btn btn-danger" ID="btnCancelar" runat="server" Text="Cancelar" ValidationGroup="vg1" OnClick="btnCancelar_Click" />  
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
                <asp:GridView ID="grdProdutos" runat="server" AutoGenerateColumns="False" OnRowEditing="grdProdutos_RowEditing" OnRowCancelingEdit="grdProdutos_RowCancelingEdit" OnRowUpdating="grdProdutos_RowUpdating" OnRowDeleting="grdProdutos_RowDeleting" Height="225px" Width="810px" OnRowDataBound="grdProdutos_RowDataBound" OnSelectedIndexChanged="grdProdutos_SelectedIndexChanged">  
                    <rowstyle cssclass="RowStyle" />
                    <alternatingrowstyle cssclass="AlternateRowStyle" />
                    <Columns>  
                        <asp:TemplateField HeaderText="Nome">  
                            <ItemTemplate>  
                                <asp:HiddenField ID="hfItemIdGrupo" Value='<% #Eval("idGrupo") %>' runat="server" />
                                <asp:Label ID="lblNmGrupo" runat="server" Text='<% #Bind("nmGrupo") %>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>  
                                <asp:HiddenField ID="hfEditIdGrupo" Value='<% #Eval("idGrupo") %>' runat="server" />
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
                    </Columns>  
                </asp:GridView>  
            </asp:Panel>  
        </div>
        <asp:Label ID="lblaviso" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>

        <asp:Panel ID="pnlPopUp" runat="server" CssClass="modalPopup" Style="display:block; width:550px; height:510px; background-color: #DDDDDD; border: solid 1px Gray; color: Black">  
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
                <br />  
                <table class="table">  
                    <tr>
                        <td>Nome</td>  
                        <td>  
                            <asp:TextBox ID="txtNmImagem" runat="server" Width="400px" MaxLength="50"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="rfttxtNmImagem" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg2" ControlToValidate="txtNmImagem"></asp:RequiredFieldValidator>  
                        </td>  
                    </tr>  
                    <tr>
                        <td align="center" colspan="2">
                            <cc1:AjaxFileUpload width="500px" id="afuUploadImage" runat="server" throbberid="myThrobber" onuploadcomplete="afuUploadImage_UploadComplete" maximumnumberoffiles="5" allowedfiletypes="jpg,jpeg,png" BorderStyle="Solid" MaxFileSize="5120"></cc1:AjaxFileUpload>
                        </td>
                    </tr>
                    <tr>  
                        <td align="right" colspan="2">  
                            <asp:Button type="button" CssClass="btn btn-success" ID="btnSalvarImagem" runat="server" Text="Salvar" ValidationGroup="vg2" OnClick="btnSalvarImagem_Click" />  
                            <asp:Button type="button" CssClass="btn btn-danger" ID="btnCancelarImagem" runat="server" Text="Cancelar" OnClick="btnCancelarImagem_Click" />  
                        </td>  
                    </tr>  
                </table>
                <asp:Label ID="lblAvisoPopUp" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </div>
        </asp:Panel>  

        <cc1:ModalPopupExtender ID="mpeImagens" runat="server"
            BackgroundCssClass="modalBackground"
            DropShadow="true"
            PopupControlID="pnlPopUp" TargetControlID="btnAddImage">
        </cc1:ModalPopupExtender>

    </form>
</body>
</html>
