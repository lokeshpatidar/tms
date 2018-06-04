<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assess_Users.aspx.cs" Inherits="TMS.Assess_Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
            width: 7px;
        }
        .style9
        {
        }
        .style10
        {
            width: 198px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style5">
        <tr>
            <td class="style6" colspan="6" style="text-align: center; color: #000000">
                Assess Users</td>
        </tr>
        <tr>
            <td class="label">
                Select Department:</td>
            <td class="style8">
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
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            <asp:Button ID="btn_Get_User_Ans" runat="server"  CssClass="btn btn-primary btn-sm"  
                             Text="Get User Answers" onclick="btn_Get_User_Ans_Click" />
            </td>
            <td>
                        &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="style8">
                <asp:Label ID="Lbl_Sel_UserGroup0" runat="server" Font-Size="Small" ForeColor="#FF3300" 
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
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                            ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select User:</td>
            <td class="style8">
                <asp:Label ID="Lbl_Sel_User" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
                <asp:UpdatePanel ID="Upd_Pan_Sel_User" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User" runat="server" CssClass="form-control"
                            AutoPostBack="True" onselectedindexchanged="Drp_User_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_User" runat="server" 
                            ControlToValidate="Drp_User" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select DOC ID</td>
            <td class="style8">
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Doc_ID" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Doc_ID" runat="server" AutoPostBack="True" 
                          CssClass="form-control" onselectedindexchanged="Drp_Doc_ID_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_Doc_ID" runat="server" 
                            ControlToValidate="Drp_Doc_ID" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select Version ID</td>
            <td class="style8">
                <asp:Label ID="Lbl_Sel_Ver_ID" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style10">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Ver_ID" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Ver_ID" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                        <asp:CompareValidator ID="Comp_Val_Sel_Ver" runat="server" 
                            ControlToValidate="Drp_Ver_ID" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-weight: 700; font-size: x-small;"></asp:Label>
            </td>
            <td class="style9">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                    &nbsp;</td>
            <td class="style9">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

                        <asp:GridView ID="Grd_Get_SOP_List" runat="server" AutoGenerateColumns="False" 
                           CssClass="table table-bordered table-striped Datatable" HeaderStyle-CssClass="bg-gray"
                            Width="16px">
                        
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Attempt" runat="server" Enabled="False" 
                                            CssClass="form-control" Text='<%# Bind("Attempt") %>' Width="36px"></asp:TextBox>
                                        <asp:TextBox ID="txt_CA_ID" runat="server" Enabled="False" Font-Size="X-Small" 
                                            ForeColor="White" Height="5px" Text='<%# Bind("CA_ID") %>' Visible="False" 
                                            Width="0px"></asp:TextBox>
                                        <asp:TextBox ID="txt_QuesID" runat="server" Enabled="False" Font-Size="X-Small" 
                                            ForeColor="White" Height="5px" Text='<%# Bind("QuesID") %>' Visible="False" 
                                            Width="0px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Question">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Quest" runat="server" CssClass="form-control"
                                            ReadOnly="True" Text='<%# Bind("Questions") %>' TextMode="MultiLine" 
                                            Width="284px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actual Answer">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Act_Ans" runat="server" CssClass="form-control" 
                                            ReadOnly="True" Text='<%# Bind("Answer") %>' TextMode="MultiLine" Width="284px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Answer">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_User_Ans" runat="server" CssClass="form-control"
                                            ReadOnly="True" Text='<%# Bind("User_Ans") %>' TextMode="MultiLine" 
                                            Width="284px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correct">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_Correct" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Wrong">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_Wrong" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Button ID="Btn_Update" runat="server" CssClass="btn btn-primary btn-sm" 
                                            onclick="Btn_Update_Click" Text="Update" />
                                    </HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>
                          
                        </asp:GridView>
        
        </asp:Content>
