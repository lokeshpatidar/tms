<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Profile.aspx.cs" Inherits="TMS.Add_User_Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript" src="ClientValidation/basiccalendar.js"></script>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style10
        {
            width: 3px;
            font-size: x-small;
        }
        .style16
        {
            width: 141px;
            font-size: x-small;
            text-align: left;
        }
        .style18
        {
            width: 222px;
            font-size: x-small;
        }
        .style21
        {
            width: 222px;
            font-size: x-small;
            height: 12px;
        }
        .style22
        {
            width: 3px;
            font-size: x-small;
            height: 12px;
        }
        .style23
        {
            height: 12px;
        }
        .style25
        {
            width: 3px;
            font-size: x-small;
            height: 4px;
        }
        .style26
        {
            width: 222px;
            font-size: x-small;
            height: 4px;
        }
        .style27
        {
            height: 4px;
        }
        .style32
        {
            width: 222px;
            font-size: x-small;
            text-align: left;
            height: 25px;
        }
        .style34
        {
            width: 3px;
            font-size: x-small;
            height: 24px;
        }
        .style35
        {
            width: 222px;
            font-size: x-small;
            height: 24px;
        }
        .style36
        {
            height: 24px;
        }
        .style38
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <input id="HIDdiv" style="width: 20px" type="hidden" /><asp:HiddenField ID="HiddDt_Joining" runat="server" />

    <table class="style1">
        <tr>
            <td colspan="4" 
                style="text-align: center; color: #000000; background-color: #6699FF">
                Add User Profile</td>
        </tr>
        <tr>
            <td class="label">
                Select Department:</td>
            <td class="style10">
                <asp:Label ID="Lbl_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style18">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Dept" runat="server" AutoPostBack="True" 
                           CssClass="form-control" onselectedindexchanged="Drp_Dept_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    <asp:Label ID="lblErrorMsg" runat="server" style="color: #CC3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="style22">
                <asp:Label ID="Lbl_User_Group" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style21">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style23">
                        <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                            ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td class="label">
                Enter User Name:</td>
            <td class="style25">
                <asp:Label ID="Lbl_User_Name" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style26">
                <asp:TextBox ID="txt_User_Name" runat="server" CssClass="form-control"
                    Width="177px"></asp:TextBox>
            </td>
            <td class="style27">
                    <asp:RequiredFieldValidator ID="Req_User_Name" runat="server" 
                        ControlToValidate="txt_User_Name" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="label">
                Employee_ID:</td>
            <td class="style10">
                <asp:Label ID="Lbl_Emp_ID" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style18">
                <asp:TextBox ID="txt_Emp_ID" runat="server" CssClass="form-control" Width="83px"></asp:TextBox>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_Emp_ID" runat="server" 
                        ControlToValidate="txt_Emp_ID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="label">
                User Type:</td>
            <td class="style10">
                <asp:Label ID="Lbl_User_Type" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style18">
            <asp:DropDownList ID="Drp_User_Type" runat="server" 
               CssClass="form-control">
                <asp:ListItem Value="0">--Select User Type--</asp:ListItem>
                <asp:ListItem Value="1">Permanent</asp:ListItem>
                <asp:ListItem Value="2">Temporary</asp:ListItem>
            </asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="Comp_Val_Sel_User_Type" runat="server" 
                    ControlToValidate="Drp_User_Type" ErrorMessage="Required" Font-Size="X-Small" 
                    ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td class="label">
                Gender:</td>
            <td class="style10">
                <asp:Label ID="Lbl_Gender" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style18">
            <asp:DropDownList ID="Drp_Gender" runat="server" 
             CssClass="form-control">
                <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                <asp:ListItem Value="1">Male</asp:ListItem>
                <asp:ListItem Value="2">Female</asp:ListItem>
            </asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="Comp_Val_Sel_Gender" runat="server" 
                    ControlToValidate="Drp_Gender" ErrorMessage="Required" Font-Size="X-Small" 
                    ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td class="label">
                Enter Date of Joining</td>
            <td class="style38">
                <asp:Label ID="Lbl_Dt_Joining" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style32">
                <asp:TextBox ID="txt_Dt_of_Join" runat="server" CssClass="txtDate form-control" 
                    Width="115px"></asp:TextBox>
                <a id="Dt_Joining" runat="server" visible="false">               
                <img id="Img2" runat="server"
                        alt="Select Date"  height="16" src="images/cal.gif" visible="true"
                        width="16" border = "0" style="vertical-align:bottom;" /></a>
                <div id="DivJoining" 
                    
                    style="border: thin none #FFFFFF; position:absolute; right: inherit; background-color: #808080; font-family: Arial; font-size: x-small; font-weight: normal; font-style: normal; color: #FFFFFF; empty-cells: hide; line-height: normal; word-spacing: inherit;">
                </div>                    
                    <asp:RequiredFieldValidator ID="Req_Eff_Dt" runat="server" 
                        ControlToValidate="txt_Dt_of_Join" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="label">
                Experience:</td>
            <td class="style34">
                <asp:Label ID="Lbl_Exp" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style35">
            <asp:DropDownList ID="Drp_Exp" runat="server" 
                CssClass="form-control">
                <asp:ListItem Value="0">--Select Experience--</asp:ListItem>
                <asp:ListItem Value="0 to 2 Years">0 to 2 Years</asp:ListItem>
                <asp:ListItem Value="2 to 5 Years">2 to 5 Years</asp:ListItem>
                <asp:ListItem>5 to 8 Years</asp:ListItem>
                <asp:ListItem>More than 8 Years</asp:ListItem>
            </asp:DropDownList>
            </td>
            <td class="style36">
                <asp:CompareValidator ID="Comp_Val_Sel_Exp" runat="server" 
                    ControlToValidate="Drp_Exp" ErrorMessage="Required" Font-Size="X-Small" 
                    ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="label">
                Level 1 Manager</td>
            <td class="style34">
                </td>
            <td class="style35">
                <asp:CheckBox ID="Chk_Lev1_Manager" runat="server" />
            </td>
            <td class="style36">
                </td>
        </tr>
        <tr>
            <td class="label">
                Level2 Manager</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style18">
                <asp:CheckBox ID="Chk_Lev2_Manager" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style18">
                <asp:Button ID="Btn_Add" runat="server"    CssClass="btn btn-primary btn-sm"
                    onclick="Btn_Add_Click" Text="Add" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
