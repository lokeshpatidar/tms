<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_User_ExpDetails.aspx.cs" Inherits="TMS.Edit_User_ExpDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript" src="ClientValidation/basiccalendar.js"></script>
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            background-color: #6699FF;
        }
        .style7
        {
            width: 120px;
            font-size: x-small;
        }
        .style8
        {
            width: 10px;
        }
        .style9
        {
        width: 203px;
    }
        .style10
        {
            width: 57px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

 <input id="HIDdiv" style="width: 20px" type="hidden" /><asp:HiddenField ID="HiddDt_Joining" runat="server" />
    <table class="style5">
        <tr>
            <td class="style6" colspan="5" style="text-align: center; color: #000000">
                Edit User Experience Details</td>
        </tr>
        <tr>
            <td class="label">
                Select Department</td>
            <td class="style8">
                <asp:Label ID="Lbl_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Dept" runat="server" 
                          CssClass="form-control" >
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                    <asp:Label ID="lblErrorMsg" runat="server" style="color: #CC3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="style8">
                <asp:Label ID="Lbl_User_Group" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group" runat="server" 
                           CssClass="form-control"
                            
                            style="margin-bottom: 1px">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                            ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select User:</td>
            <td class="style8">
                <asp:Label ID="Lbl_User" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG0" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User" runat="server" 
                        CssClass="form-control"
                            
                            style="margin-bottom: 1px">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_User" runat="server" 
                            ControlToValidate="Drp_User" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
   
        <tr>
            <td class="label">
                Experience:</td>
            <td class="style8">
                <asp:Label ID="Lbl_Exp" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Exp" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Exp" runat="server"      CssClass="form-control">
                            <asp:ListItem Value="0">--Select Experience--</asp:ListItem>
                            <asp:ListItem Value="0 to 2 Years">0 to 2 Years</asp:ListItem>
                            <asp:ListItem Value="2 to 5 Years">2 to 5 Years</asp:ListItem>
                            <asp:ListItem>5 to 8 Years</asp:ListItem>
                            <asp:ListItem>More than 8 Years</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_Exp" runat="server" 
                            ControlToValidate="Drp_Exp" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
 
      <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
           
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:Button ID="Btn_Update" runat="server" CssClass="btn btn-primary btn-sm"  
                    onclick="Btn_Update_Click" Text="Update" />
            </td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

