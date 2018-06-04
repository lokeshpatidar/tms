<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Group_Rights.aspx.cs" Inherits="TMS.Add_User_Group_Rights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style13
        {
            width: 1px;
            height: 10px;
            font-size: x-small;
        }
        .style14
        {
            height: 10px;
            width: 190px;
        }
        .style16
        {
            height: 10px;
        }
        .style17
        {
            width: 126px;
            height: 5px;
            font-size: x-small;
        }
        .style18
        {
            width: 1px;
            height: 5px;
            font-size: x-small;
        }
        .style19
        {
            height: 5px;
            width: 190px;
        }
        .style21
        {
            height: 5px;
        }
        .style22
        {
            height: 10px;
            width: 86px;
        }
        .style23
        {
            height: 5px;
            width: 86px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  
        <table class="style1">
            <tr>
                <td colspan="5" 
                    style="text-align: center; color: #000000; background-color: #6699FF">
                    Add User Group Functions</td>
            </tr>
            <tr>
                <td class="label">
                    Select Department:</td>
                <td class="style13">
                <asp:Label ID="Lbl_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
                <td class="style14">
                    <asp:UpdatePanel ID="Upd_Pan_Sel_Dep" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="Drp_Departments" runat="server" AutoPostBack="True" 
                                 CssClass="form-control"
                                onselectedindexchanged="Drp_Departments_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style22">
                            <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                                ControlToValidate="Drp_Departments" ErrorMessage="Required" Font-Size="X-Small" 
                                ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style16">
                    <asp:Button ID="Btn_Get_Fun" runat="server" onclick="Btn_Get_Fun_Click" 
                        Text="Get Functions" Width="90px" CssClass="btn btn-primary btn-sm"
                        style="margin-left: 11px" />
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-weight: 700;"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="label">
                    Select User Group:</td>
                <td class="style18">
                <asp:Label ID="Lbl_UserGroup" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
                <td class="style19">
                    <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="Drp_User_Group" runat="server"  CssClass="form-control"
                                style="margin-left: 0px">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style23">
                            <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                                ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                                ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                <td class="style21">
                </td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style23">
                    &nbsp;</td>
                <td class="style21">
                    &nbsp;</td>
            </tr>
        </table>
        <div class="box">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False"  HeaderStyle-CssClass="bg-gray"  CssClass="table table-bordered table-striped Datatable"
         OnPreRender="grd_data_PreRender">

            <Columns>
                <asp:TemplateField HeaderText="Function ID">
                    <HeaderTemplate>
                        <asp:Button ID="Btn_Add_Fun" runat="server" CssClass="btn btn-primary btn-sm" 
                            onclick="Btn_Add_Fun_Click" Text="Add" Width="60px" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Fun_ID" runat="server" Text='<%# Bind("FunctionID") %>' 
                            Enabled="False" 
                            Width="48px"  CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parent Function">
                    <ItemTemplate>
                    
                               <asp:Label ID="txt_Parent" runat="server" Text='<%# Bind("Parent") %>' CssClass="txt_center"
                                    Font-Bold="true"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Function Name">
                    <ItemTemplate>
                        <asp:label ID="txt_Fun_Name" runat="server" 
                            Text='<%# Bind("FunctionName") %>' Font-Bold="True" 
                     ></asp:label>
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select Function">
                    <ItemTemplate>
                        <asp:CheckBox ID="Chk_Sel_Fun" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
    
        </asp:GridView>
       
     </div>
  
</asp:Content>
