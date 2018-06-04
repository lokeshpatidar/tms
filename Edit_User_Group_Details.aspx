<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_User_Group_Details.aspx.cs" Inherits="TMS.Edit_User_Group_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 137px;
            font-size: x-small;
        }
        .style7
        {
            width: 7px;
        }
        .style8
        {
            margin-left: 160px;
        }
        .style9
        {
            width: 271px;
            margin-left: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style5">
        <tr>
            <td colspan="5" 
                style="text-align: center; color: #000000; background-color: #6699FF">
                Edit User Group Details</td>
        </tr>
        <tr>
            <td class="label">
                Select Departments:</td>
            <td class="style7">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Dept" runat="server" AutoPostBack="True" 
                              CssClass="form-control"  onselectedindexchanged="Drp_Dept_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="style7">
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group" runat="server" AutoPostBack="True" 
                            CssClass="form-control" 
                            onselectedindexchanged="Drp_User_Group_SelectedIndexChanged" 
                            style="margin-bottom: 1px">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                            ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Emter User Group Name:</td>
            <td class="style7">
                <asp:Label ID="Lbl_UG" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG0" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txt_User_Group" runat="server" Width="259px" 
                 CssClass="form-control" ></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_UG_Prefix" runat="server" 
                        ControlToValidate="txt_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
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
                <asp:Button ID="Btn_Update_UG" runat="server"  
                    Text="Update" CssClass="btn btn-primary btn-sm" onclick="Btn_Update_UG_Click" />
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
