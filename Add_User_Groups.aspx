<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Groups.aspx.cs" Inherits="TMS.Add_User_Groups" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
    {
        width: 100%;
    }
    .style2
    {
        text-align: center;
            font-weight: 700;
            height: 21px;
        }
    .style4
    {
            width: 137px;
        }
    .style5
    {
        color: #000000;
        background-color: #6699FF;
    }
        .style6
        {
            text-align: left;
            width: 132px;
            font-size: x-small;
        }
        .style7
        {
            text-align: left;
            width: 5px;
            font-size: x-small;
        }
        .style8
        {
            text-align: left;
            width: 132px;
            font-size: x-small;
            height: 8px;
        }
        .style9
        {
            text-align: left;
            width: 5px;
            font-size: x-small;
            height: 8px;
        }
        .style10
        {
            width: 75px;
            height: 8px;
        }
        .style11
        {
            width: 137px;
            height: 8px;
        }
        .style12
        {
            height: 8px;
        }
        .style15
        {
            width: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
    <tr>
        <td class="style5" colspan="5" style="text-align: center">
            Add User Groups</td>
    </tr>
    <tr>
        <td class="label">
            Select Country:</td>
        <td class="style9">
                <asp:Label ID="Lbl_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
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
        <td class="style11">
                    <asp:CompareValidator ID="Comp_Val_Sel_Country0" runat="server" 
                        ControlToValidate="Drp_Country" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
        <td class="style12">
            </td>
    </tr>
    <tr>
        <td class="label">
            Select Department:</td>
        <td class="style7">
                <asp:Label ID="Lbl_Dept0" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
        <td class="style15">
            <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="Drp_Departments" runat="server" CssClass="form-control"
                         Width="195px" AutoPostBack="True" 
                        onselectedindexchanged="Drp_Departments_SelectedIndexChanged">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td class="style4">
                    <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                        ControlToValidate="Drp_Departments" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="label">
            Enter User Group Name:</td>
        <td class="style7">
                <asp:Label ID="Lbl_Dept1" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
        <td class="style15">
            <asp:TextBox ID="txt_User_Group" runat="server" Width="170px" 
                 CssClass="form-control"></asp:TextBox>
        </td>
        <td class="style4">
                    <asp:RequiredFieldValidator ID="Req_Dep_Prefix" runat="server" 
                        ControlToValidate="txt_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style6">
            </td>
        <td class="style7">
            </td>
        <td class="style15">
            <asp:Button ID="Add_User_Group" runat="server" onclick="Add_User_Group_Click" 
                Text="Add" Width="50px" CssClass="btn btn-primary btn-sm"/>
        </td>
        <td class="style4">
            </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style2" colspan="5">
            <asp:Label ID="lblErrorMsg" runat="server" style="color: #FF0000"></asp:Label>
        </td>
    </tr>
</table>

<table>
 
</table>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
 <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False" 
        >
          <HeaderTemplate>
        <table>
           <td scope="col" style="width: 200px; text-decoration: underline; font-weight: bold;">
            User Groups Added 
           </td>
    </HeaderTemplate>
<ItemTemplate>

        <tr>
            <td>
                <%# Eval("UserGroup_Name1")%>
            </td>
         </tr>
 
    </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
