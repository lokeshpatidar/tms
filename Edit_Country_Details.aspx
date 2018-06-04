<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Country_Details.aspx.cs" Inherits="TMS.Edit_Country_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 129px;
            font-size: x-small;
        }
        .style7
        {
            width: 11px;
        }
        .style8
        {
        }
        .style9
        {
            width: 269px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style5">
        <tr>
            <td colspan="5" 
                style="color: #000000; text-align: center; background-color: #6699FF">
                Edit Country Details</td>
        </tr>
        <tr>
            <td class="label">
                Select Country:</td>
            <td class="style7">
                    <asp:Label ID="Lbl_Sel_Country" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style9">
                            <asp:DropDownList ID="Drp_Country" runat="server" 
                Width="195px" CssClass="form-control"
                                
                                AutoPostBack="True" 
                                onselectedindexchanged="Drp_Country_SelectedIndexChanged">
                            </asp:DropDownList>
                            </td>
            <td>
                            <asp:CompareValidator ID="Comp_Val_Sel_Country" runat="server" 
                                ControlToValidate="Drp_Country" ErrorMessage="Required" Font-Size="X-Small" 
                                ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                        </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Country ID:</td>
            <td class="style7">
                    <asp:Label ID="Lbl_Cntry_ID" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:TextBox ID="txt_Country_ID" runat="server" CssClass="form-control"
                    Width="103px" Enabled="False"></asp:TextBox>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_Country_ID" runat="server" 
                        ControlToValidate="txt_Country_ID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Country Name:</td>
            <td class="style7">
                    <asp:Label ID="Lbl_Cntry_Name" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:TextBox ID="txt_Country" runat="server" CssClass="form-control" Width="251px"></asp:TextBox>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_Country_Name" runat="server" 
                        ControlToValidate="txt_Country" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Country Prefix:</td>
            <td class="style7">
                    <asp:Label ID="Lbl_Cntry_Prefix" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:TextBox ID="txt_Country_Prefix" runat="server"   CssClass="form-control"
                    Width="45px"></asp:TextBox>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_Country_Prefix" runat="server" 
                        ControlToValidate="txt_Country_Prefix" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style9">
                <asp:Button ID="Btn_Update_Country" runat="server"  
                    Text="Update" CssClass="btn btn-primary btn-sm" onclick="Btn_Update_Country_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style8" colspan="2">
                    <asp:Label ID="lblErrorMsg" runat="server" style="color: #FF0000; font-weight: 700;" 
                        Font-Size="X-Small"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
