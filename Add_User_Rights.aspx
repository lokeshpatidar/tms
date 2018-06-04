<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_Rights.aspx.cs" Inherits="TMS.Add_User_Rights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            background-color: #6699FF;
        }
        .style4
        {
            width: 7px;
        }
        .style5
        {
            width: 195px;
        }
        .style8
        {
            width: 195px;
            height: 28px;
        }
        .style9
        {
            height: 28px;
        }
        .style10
        {
            height: 28px;
            width: 70px;
        }
        .style11
        {
            width: 70px;
        }
        .style12
        {
            font-size: x-small;
            width: 99px;
        }
        .style13
        {
            width: 4px;
            height: 28px;
        }
        .style14
        {
            width: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td class="style2" colspan="5" style="text-align: center; color: #000000">
                Add User Rights</td>
        </tr>
        <tr>
            <td class="label">
                Select Department:</td>
            <td class="style13">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style8">
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
            <td class="style9">
                        <asp:Button ID="btn_Get_Fun" runat="server"   CssClass="btn btn-primary btn-sm"
                            onclick="btn_Get_Doc_List_Click" Text="Get Functions" />
            </td>
        </tr>
        <tr>
            <td class="label">
                Select user Group:</td>
            <td class="style14">
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style5">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group" runat="server" AutoPostBack="True" 
                         CssClass="form-control" 
                            onselectedindexchanged="Drp_User_Group_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style11">
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
            <td class="style14">
                <asp:Label ID="Lbl_Sel_User" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style5">
                <asp:UpdatePanel ID="Upd_Pan_Sel_User" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User" runat="server"  CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style11">
                        <asp:CompareValidator ID="Comp_Val_Sel_User" runat="server" 
                            ControlToValidate="Drp_User" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style11">
                    &nbsp;</td>
            <td>
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-weight: 700;"></asp:Label>
            </td>
        </tr>
        </table>
     
        <div class="box">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
    HeaderStyle-CssClass="bg-gray"    AutoGenerateColumns="false" OnPreRender="grd_data_PreRender"    CssClass="table table-bordered table-striped Datatable"
        >         
            <Columns>
                <asp:TemplateField HeaderText="Function ID">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Fun_ID" runat="server" Text='<%# Bind("FunctionID") %>' 
                            Enabled="False" CssClass="form-control"
                            Width="48px" ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parent Function">
                    <ItemTemplate>
                        <asp:label ID="txt_Parent" runat="server" Text='<%# Bind("Parent") %>' 
                          ></asp:label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Function Name">
                    <ItemTemplate>
                        <asp:label ID="txt_Fun_Name" runat="server" 
                            Text='<%# Bind("FunctionName") %>' ></asp:label>
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="Chk_Sel_Fun" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Add">
                    <HeaderTemplate>
                        <asp:Button ID="Btn_Add_Fun" runat="server" CssClass="btn btn-primary btn-sm" 
                            onclick="Btn_Add_Fun_Click" Text="Add" Width="60px" />
                    </HeaderTemplate>
                </asp:TemplateField>
            </Columns>       
        </asp:GridView>
        </div>
</asp:Content>
