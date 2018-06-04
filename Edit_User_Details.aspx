<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_User_Details.aspx.cs" Inherits="TMS.Edit_User_Details" %>
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
                Edit User Details</td>
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
                        <asp:DropDownList ID="Drp_Dept" runat="server" AutoPostBack="True" 
                          CssClass="form-control" onselectedindexchanged="Drp_Dept_SelectedIndexChanged">
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
                        <asp:DropDownList ID="Drp_User_Group" runat="server" AutoPostBack="True" 
                           CssClass="form-control"
                            onselectedindexchanged="Drp_User_Group_SelectedIndexChanged" 
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
                        <asp:DropDownList ID="Drp_User" runat="server" AutoPostBack="True" 
                        CssClass="form-control"
                            onselectedindexchanged="Drp_User_SelectedIndexChanged" 
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
                Select User Type:</td>
            <td class="style8">
                <asp:Label ID="Lbl_User_Type" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_User_Type" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Type" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">--Select User Type--</asp:ListItem>
                            <asp:ListItem Value="1">Permanent</asp:ListItem>
                            <asp:ListItem Value="2">Temporary</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_User_Type" runat="server" 
                            ControlToValidate="Drp_User_Type" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Gender:</td>
            <td class="style8">
                <asp:Label ID="Lbl_Gender" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Gender" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Gender" runat="server"  CssClass="form-control">
                            <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_Gender" runat="server" 
                            ControlToValidate="Drp_Gender" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Date of Joining:</td>
            <td class="style8">
                <asp:Label ID="Lbl_Dt_Joining" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_DOJ" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txt_Dt_of_Join" runat="server"    CssClass="form-control txtDate"
                            Width="115px"></asp:TextBox>
                        <a ID="Dt_Joining" runat="server" visible="false">
                        <img id="Img2" runat="server"
                        alt="Select Date"  height="16" src="images/cal.gif" visible="true"
                        width="16" border = "0" style="vertical-align:bottom;" />
                        </a>
                        <div id="DivJoining" 
                    
                    style="border: thin none #FFFFFF; position:absolute; right: inherit; background-color: #808080; font-family: Arial; font-size: x-small; font-weight: normal; font-style: normal; color: #FFFFFF; empty-cells: hide; line-height: normal; word-spacing: inherit;">
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                        <asp:RequiredFieldValidator ID="Req_Eff_Dt" runat="server" 
                            ControlToValidate="txt_Dt_of_Join" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="Red"></asp:RequiredFieldValidator>
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
            <td class="label">
                Level 1 Manager:</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Levl1" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="Chk_Lev1_Manager" runat="server" Font-Size="X-Small" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Level 2 Manager:</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Levl2" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="Chk_Lev2_Manager" runat="server" Font-Size="X-Small" />
                    </ContentTemplate>
                </asp:UpdatePanel>
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
        <tr>
            <td class="label">
                Select Department</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Dept1" runat="server" AutoPostBack="True" 
                                 CssClass="form-control"
                            onselectedindexchanged="Drp_Dept1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Update User Group:</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group1" runat="server" AutoPostBack="True" 
                            CssClass="form-control"
                            style="margin-bottom: 1px">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
