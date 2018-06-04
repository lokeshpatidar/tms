<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Get_SOP_List.aspx.cs" Inherits="TMS.Get_SOP_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style5
        {
            width: 197px;
            height: 25px;
        }
        .style8
        {
            font-size: x-small;
            width: 6px;
            height: 25px;
        }
        .style9
        {
            height: 25px;
            width: 711px;
        }
        .style4
        {
            font-size: x-small;
            width: 101px;
        }
        .style10
        {
            font-size: x-small;
            width: 138px;
        }
        .style11
        {
            display: inline-block;
            max-width: 100%;
            margin-bottom: -2px;
            font-weight: bold;
            font-size: x-small;
            margin-left: 9px;
            width: 138px;
        }
        .style12
        {
            height: 25px;
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td colspan="5" style="text-align: center; color: #000000; background-color: #6699FF">
                Get SOP List
            </td>
        </tr>
        <asp:Label ID="lblErrorMsg" runat="server" Style="color: #CC3300; font-weight: 700;"></asp:Label>
        <tr>
            <td class="style11">
                Select Department:
            </td>
            <td class="style8">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300"
                    Text="*"></asp:Label>
            </td>
            <td class="style12">
                <asp:DropDownList ID="Drp_Departments" runat="server" Width="195px" CssClass="form-control">
                </asp:DropDownList>
            </td>
            <td class="style9">
                <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" ControlToValidate="Drp_Departments"
                    ErrorMessage="Required" Font-Size="X-Small" ForeColor="#FF3300" Operator="NotEqual"
                    ValueToCompare="0"></asp:CompareValidator>
                <asp:Button ID="Btn_Get_Sop_List" runat="server" OnClick="Btn_Get_Sop_List_Click"
                    Text="Get SOP List" Style="margin-left: 0px" CssClass="btn btn-primary btn-sm" />
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;
            </td>
            <td class="style8">
                &nbsp;
            </td>
            <td class="style12">
                &nbsp;
            </td>
            <td class="style9">
                &nbsp;
            </td>
            <td class="style5">
                &nbsp;
            </td>
        </tr>
    </table>
    <div class="box">
        <asp:GridView ID="Grd_Get_SOP_List" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped Datatable"
            OnPreRender="grd_data_PreRender" GridLines="None" HeaderStyle-CssClass="bg-gray">
            <Columns>
                <asp:TemplateField HeaderText="DOC ID">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Doc_ID" runat="server" CssClass="form-control" Text='<%# Bind("DOC_ID") %>'
                            Width="50px" Enabled="False"></asp:TextBox>
                        <asp:Label ID="TextBox4" runat="server" CssClass="form-control disp-none" Style="display: none"
                            Text='<%# Bind("DOC_ID") %>' Width="40px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version ID">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Ver_ID" runat="server" CssClass="form-control txt_Center" Text='<%# Bind("Version_ID") %>'
                            Width="40px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Doc Title">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Doc_title" runat="server" Enabled="False" CssClass="form-control"
                            Text='<%# Bind("DOC_Title") %>' Height="30px" Width="296px" TextMode="MultiLine"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Doc Type">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Doc_type" runat="server" Enabled="False" CssClass="form-control"
                            Text='<%# Bind("Doc_Type") %>' Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Doc Status">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_Doc_Status" runat="server" Enabled="False" CssClass="form-control"
                            Text='<%# Bind("Status") %>' Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approval Dt" ItemStyle-CssClass="txt_Center">
                    <ItemTemplate>
                        <asp:Label ID="txt_App_Dt" runat="server" CssClass="form-control" Text='<%# Bind("Approval_Dt") %>'
                            Width="80px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Effective Dt" ItemStyle-CssClass="txt_Center">
                    <ItemTemplate>
                        <asp:Label ID="txt_Eff_Dt" runat="server" CssClass="form-control txt_Center" Text='<%# Bind("Effective_Dt") %>'
                            Width="80px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Next Review Dt" ItemStyle-CssClass="txt_Center">
                    <ItemTemplate>
                        <asp:Label ID="txt_Next_Rev_Dt" runat="server" CssClass="form-control" Text='<%# Bind("Next_Review_Due") %>'
                            Width="80px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
