<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Approve_User_Training.aspx.cs" Inherits="TMS.Approve_User_Training" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 8px;
        }
        .style5
        {
            width: 181px;
            font-size: x-small;
        }
        .style6
        {
        }
        .style7
        {
            width: 64px;
        }
        .style9
        {
            width: 392px;
        }
        .style10
        {
            width: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td colspan="6" 
                style="color: #000000; text-align: center; background-color: #6699FF">
                Approve User Training</td>
        </tr>
        <tr>
            <td class="label">
                Select Deparment</td>
            <td>
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Dept" runat="server" AutoPostBack="True" 
                            CssClass="form-control" onselectedindexchanged="Drp_Dept_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style7">
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
            <td class="style9">
                        <asp:Button ID="btn_Get_UG_TP" runat="server"
                            onclick="btn_Get_Doc_List_Click" CssClass="btn btn-primary btn-sm"  Text="Get TP" />
            </td>
            <td class="style9">
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-weight: 700;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="label">
                Select User Group</td>
            <td>
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
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
            <td class="style7">
                        <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                            ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td class="style9">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select User:</td>
            <td>
                <asp:Label ID="Lbl_Sel_User" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
                <asp:UpdatePanel ID="Upd_Pan_Sel_User" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style7">
                        <asp:CompareValidator ID="Comp_Val_Sel_User" runat="server" 
                            ControlToValidate="Drp_User" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td class="style9">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6" colspan="2">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
        </tr>
    </table>



    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                        <asp:GridView ID="Grd_Get_SOP_List" runat="server" AutoGenerateColumns="False" 
                            CssClass="table table-bordered table-striped Datatable" GridLines="None"   OnPreRender="grd_data_PreRender" 
                            Width="16px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="DOC ID">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Doc_ID" runat="server" Enabled="False"  CssClass="form-control"
                                            Font-Strikeout="False" Text='<%# Bind("DOC_ID") %>' Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Version ID">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Ver_ID" runat="server" Enabled="False" CssClass="form-control"
                                           Text='<%# Bind("Version_ID") %>' Width="40px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Doc Title">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Doc_title" runat="server" Enabled="False" 
                                           CssClass="form-control" Text='<%# Bind("DOC_Title") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mode of Training">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="Drp_Train_Mode" runat="server" CssClass="form-control"
                                      Width="90px" SelectedValue='<%# Bind("Train_Mode") %>' 
                                            Enabled="False">
                                            <asp:ListItem Value="0">--Select Mode--</asp:ListItem>
                                            <asp:ListItem>Self Reading</asp:ListItem>
                                            <asp:ListItem>Active</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Dt">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Eff_Dt" runat="server" Enabled="False" CssClass="form-control" 
                                            Text='<%# Bind("Effective_Dt") %>' Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Training Due Date">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Planned_Dt" runat="server" Enabled="False" 
                                             CssClass="form-control"  Text='<%# Bind("Planned_Train_Dt") %>' Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Training Completion Dt">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Actual_Dt" runat="server" Enabled="False" 
                                           CssClass="form-control"  Text='<%# Bind("Actual_Train_Comp_Dt") %>' 
                                            Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reason for Delay">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Res_Delay" runat="server" Enabled="False" 
                                           CssClass="form-control"  Text='<%# Bind("Res_Delay") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approve">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Chk_Approve" runat="server" />
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:Button ID="Btn_Update" runat="server" Font-Size="X-Small" 
                                            onclick="Btn_Update_Click" Text="Update" />
                                    </HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>
                          
                        </asp:GridView>
                </td>
        </tr>
    </table>
</asp:Content>
