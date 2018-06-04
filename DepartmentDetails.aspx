<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentDetails.aspx.cs" Inherits="TMS.DepartmentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 135px;
            height: 25px;
            font-size: x-small;
        }
       
        .style5
        {
            width: 277px;
            height: 25px;
        }
        .style6
        {
            height: 25px;
        }
        
    .style7
    {
        width: 135px;
        height: 25px;
        text-align: left;
        font-size: x-small;
        }
    .style8
    {
        width: 135px;
        height: 26px;
        font-size: x-small;
        }
    .style9
    {
        width: 277px;
        height: 26px;
    }
    .style10
    {
        height: 26px;
    }
    .style11
    {
        width: 6px;
        height: 26px;
        font-size: x-small;
    }

     .style12
    {
        width: 6px;
        height: 25px;
        text-align: left;
        font-size: x-small;
    }

    .style13
    {
        width: 6px;
        height: 25px;
        font-size: x-small;
    }
        
    .style15
    {
        color: #000000;
        text-align: center;
        background-color: #6699FF;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
        <table class="style1">
            <tr>
                <td class="style15" colspan="4">
                    Add Departments</td>
            </tr>
            <tr>
                <td class="label">
                    Select Country:</td>
                <td class="style11">
                    <asp:Label ID="Lbl_Sel_Country" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
                <td class="style9">
                    <asp:UpdatePanel ID="Upd_Sel_Country" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="Drp_Country" runat="server"  
                Width="195px" CssClass="form-control"
                                onselectedindexchanged="Drp_Country_SelectedIndexChanged" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="Comp_Val_Sel_Country" runat="server" 
                                ControlToValidate="Drp_Country" ErrorMessage="Required" Font-Size="X-Small" 
                                ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="label">
                    Enter Department Name: 
                </td>
                <td class="style12">
                    <asp:Label ID="Lbl_Dept_Prefix0" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="txt_Dept_name" runat="server"    Width="170px"
                      CssClass="form-control"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="Req_Dep_Name" runat="server" 
                        ControlToValidate="txt_Dept_name" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="label">
                    Enter Department Prefix:</td>
                <td class="style13">
                    <asp:Label ID="Lbl_Dept_Prefix" runat="server" Font-Size="Small" 
                        ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="txt_Dept_Prefix" runat="server" Width="65px" 
                        CssClass="form-control" MaxLength="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Req_Dep_Prefix" runat="server" 
                        ControlToValidate="txt_Dept_Prefix" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                </td>
                <td class="style13">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Button ID="Btn_Add_Dept" runat="server" Text="Add" Width="65px" 
                        onclick="Btn_Add_Dept_Click" CssClass="btn btn-primary btn-sm" />
                </td>
                <td class="style6">
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Label ID="lblErrorMsg" runat="server" style="color: #FF0000; font-weight: 700;" 
                        Font-Size="X-Small"></asp:Label>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
        </table>

<table>
    
</table>
   
<asp:UpdatePanel ID="Upd_Repeater" runat="server">
            <ContentTemplate>
 <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False" 
        >
          <HeaderTemplate>
        <table>
           <td scope="col" style="width: 200px; text-decoration: underline; font-weight: bold;">
            Departments Added 
           </td>
    </HeaderTemplate>
<ItemTemplate>
    
        <tr>
            <td>
                <%# Eval("Dept_Name1")%>
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
