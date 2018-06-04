<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete_User_Group.aspx.cs" Inherits="TMS.Delete_User_Group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style6
        {
            width: 186px;
        }
        .style7
        {
            width: 106px;
        }
        .style10
        {
            width: 186px;
            height: 13px;
        }
        .style11
        {
            width: 106px;
            height: 13px;
        }
        .style12
        {
            height: 13px;
        }
        .style15
        {
            width: 119px;
        }
        .style18
        {
            font-size: x-small;
            width: 1px;
        }
        .style19
        {
            width: 1px;
            height: 13px;
        }
        .style20
        {
            width: 164px;
        }
        .style21
        {
            width: 164px;
            height: 13px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td colspan="5" 
                style="color: #000000; text-align: center; background-color: #6699FF">
                Delete User Group</td>
            <td 
                style="color: #000000; text-align: center; background-color: #6699FF">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Select Department:</td>
            <td class="style18">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style6">
                                 
                        <asp:DropDownList ID="Drp_Dept" runat="server" 
                            CssClass="form-control">
                        </asp:DropDownList>
                   
            
            </td>
            <td style="font-weight: 700" class="style7">
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                   
            
            </td>
            <td style="font-weight: 700" class="style20">
                <asp:Button ID="Btn_Get_UG" runat="server" CssClass="btn btn-primary btn-sm" Text="Get User Group" 
                    onclick="Btn_Get_UG_Click" />
            </td>
            <td style="font-weight: 700">
                    <asp:Label ID="lblErrorMsg" runat="server" style="color: #CC3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15">
                </td>
            <td class="style19">
                </td>
            <td class="style10">
                </td>
            <td class="style11">
                </td>
            <td class="style21">
                </td>
            <td class="style12">
                &nbsp;</td>
        </tr>
        </table>
<div class="box">
        
                        <asp:GridView ID="Grd_User_List" runat="server" AutoGenerateColumns="False" 
                         CssClass="table table-bordered table-striped Datatable"  HeaderStyle-CssClass="bg-gray" 
                            Width="196px">
                        
                            <Columns>
                                <asp:TemplateField HeaderText="User Group_ID">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_UserUG_ID" runat="server" Enabled="False" 
                                          Text='<%# Bind("UserGroup_ID") %>' CssClass="form-control" 
                                            Width="70px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Group Name">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_UG_Name" runat="server" Enabled="False" 
                                           Text='<%# Bind("UserGroup_Name") %>'  CssClass="form-control" 
                                            Width="113px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. of Users">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_User_ID_Count" runat="server" Enabled="False" 
                                           CssClass="form-control"  Text='<%# Bind("User_ID") %>' Width="50px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Chk_UG" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderTemplate>
                                        <asp:Button ID="Bth_Delete" runat="server"  CssClass="btn btn-primary btn-sm"   Text="Delete" 
                                            onclick="Bth_Delete_Click" />
                                    </HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>
                           
                        </asp:GridView>
                   
      </div>
</asp:Content>
