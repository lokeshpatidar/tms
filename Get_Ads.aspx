<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Get_Ads.aspx.cs" Inherits="TMS.Get_Ads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 54%;
        }
        .style2
        {}
        .style3
        {
            width: 308px;
        }
    </style>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td colspan="4" 
                style="background-color: #6699FF; text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: small;">
                List of Ad&#39;s</td>
        </tr>
        <tr>
            <td class="style3">
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-weight: 700;"></asp:Label>
            </td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:GridView ID="Grd_Get_SOP_List" runat="server" AutoGenerateColumns="False" 
                  CssClass="table table-bordered table-striped Datatable"
                    Width="394px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="DOC ID">
                            <ItemTemplate>
                                <asp:TextBox ID="txt_Doc_ID" runat="server" Font-Size="X-Small" 
                                   CssClass="form-control" Text='<%# Bind("DOC_ID") %>' 
                                    Width="50px" Enabled="False"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Version ID">
                            <ItemTemplate>
                                <asp:TextBox ID="txt_Ver_ID" runat="server" Enabled="False"  CssClass="form-control"
                                   Text='<%# Bind("Version_ID") %>' Width="40px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ref ID">
                            <ItemTemplate>
                                <asp:TextBox ID="txt_SOP_ID" runat="server" Enabled="False"  CssClass="form-control"
                                Text='<%# Bind("SOP_ID") %>' Width="50px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Doc Title">
                            <ItemTemplate>
                                <asp:TextBox ID="txt_Doc_title" runat="server" Enabled="False" 
                                   CssClass="form-control" Text='<%# Bind("DOC_Title") %>' 
                                    Width="175px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Open">
                            <ItemTemplate>
                                <asp:LinkButton ID="Lnk_Open" runat="server" 
                                CommandArgument='<%# Eval("Id") %>' OnClick="DownloadFile" Text="Ad's"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                </asp:GridView>
            </td>
            <td>
                    &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    </form>
</body>
</html>
