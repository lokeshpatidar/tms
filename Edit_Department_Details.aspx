<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Department_Details.aspx.cs" Inherits="TMS.Edit_Department_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 110px;
        }
        .style7
        {
            width: 8px;
        }
        .style8
        {
            margin-left: 80px;
        }
        .style9
        {
            width: 145px;
        }
        .style10
        {
            width: 232px;
            margin-left: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style5">
        <tr>
            <td colspan="5" 
                style="color: #000000; text-align: center; background-color: #6699FF">
                Edit Department Details</td>
        </tr>
        <tr>
            <td class="label">
                Select Country:</td>
            <td class="style7">
                <asp:Label ID="Lbl_Country" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
            <asp:UpdatePanel ID="Upd_Pan_Sel_Country" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="Drp_Country" runat="server" AutoPostBack="True" 
                     CssClass="form-control"
                        onselectedindexchanged="Drp_Country_SelectedIndexChanged" Width="195px">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            <td class="style9">
                    <asp:CompareValidator ID="Comp_Val_Sel_Country0" runat="server" 
                        ControlToValidate="Drp_Country" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select Department:</td>
            <td class="style7">
                <asp:Label ID="Lbl_Dept_N" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
            <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="Drp_Departments" runat="server" CssClass="form-control"
                        Width="195px" AutoPostBack="True" 
                        onselectedindexchanged="Drp_Departments_SelectedIndexChanged">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            <td class="style9">
                    <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                        ControlToValidate="Drp_Departments" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Department Name:</td>
            <td class="style7">
                    <asp:Label ID="Lbl_Dept_Name" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style10">
            <asp:UpdatePanel ID="Upd_Pan_Dept_Name" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txt_Dept_name" runat="server" CssClass="form-control"
                        Width="170px"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            <td class="style9">
                    <asp:RequiredFieldValidator ID="Req_Dep_Name" runat="server" 
                        ControlToValidate="txt_Dept_name" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Department Prefix</td>
            <td class="style7">
                    <asp:Label ID="Lbl_Dept_Prefix" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style10">
            <asp:UpdatePanel ID="Upd_Pan_Dept_Prefix" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txt_Dept_Prefix" runat="server" CssClass="form-control"
                        MaxLength="3" Width="65px"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            <td class="style9">
                    <asp:RequiredFieldValidator ID="Req_Dep_Prefix" runat="server" 
                        ControlToValidate="txt_Dept_Prefix" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="font-size: x-small">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="Btn_Update_Dept" runat="server"  
                    Text="Update" CssClass="btn btn-primary btn-sm" onclick="Btn_Update_Dept_Click" />
            </td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="font-size: x-small">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style8" colspan="3">
                    <asp:Label ID="lblErrorMsg" runat="server" style="color: #FF0000; font-weight: 700;" 
                        Font-Size="X-Small"></asp:Label>
                </td>
        </tr>
    </table>
</asp:Content>
