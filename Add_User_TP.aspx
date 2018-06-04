<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User_TP.aspx.cs" Inherits="TMS.Add_User_TP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style7
        {
            font-size: x-small;
            width: 124px;
            height: 21px;
        }
        .style10
        {
            width: 65px;
            height: 21px;
        }
        .style11
        {
            height: 21px;
        }
        .style16
        {
            width: 65px;
            height: 4px;
        }
        .style17
        {
            height: 4px;
        }
        .style22
        {
            width: 65px;
            height: 7px;
        }
        .style23
        {
            height: 7px;
        }
        .style27
        {
            width: 65px;
        }
        .style28
        {
            height: 4px;
            width: 6px;
        }
        .style29
        {
            height: 7px;
            width: 6px;
        }
        .style30
        {
            width: 6px;
        }
        .style31
        {
            height: 21px;
            width: 6px;
        }
        .style32
        {
            width: 226px;
            height: 4px;
        }
        .style33
        {
            width: 226px;
            height: 7px;
        }
        .style34
        {
            width: 226px;
        }
        .style35
        {
            height: 21px;
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
                Add User Training Plan</td>
        </tr>
        <tr>
            <td class="label">
                Select Department:</td>
            <td class="style28">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style32">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Dept" runat="server" AutoPostBack="True" 
                           CssClass="form-control" onselectedindexchanged="Drp_Dept_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style16">
                        <asp:CompareValidator ID="Comp_Val_Sel_Dept" runat="server" 
                            ControlToValidate="Drp_Dept" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
            <td class="style17">
                        <asp:Button ID="btn_Get_UG_TP" runat="server"    CssClass="btn btn-primary btn-sm" 
                            onclick="btn_Get_Doc_List_Click" Text="Get TP" style="height: 21px" />
                </td>
        </tr>
        <tr>
            <td class="label">
                Select User Group:</td>
            <td class="style29">
                <asp:Label ID="Lbl_Sel_UserGroup" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style33">
                <asp:UpdatePanel ID="Upd_Pan_Sel_UG" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User_Group" runat="server" AutoPostBack="True" 
                            CssClass="form-control"
                            onselectedindexchanged="Drp_User_Group_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style22">
                        <asp:CompareValidator ID="Comp_Val_Sel_UG" runat="server" 
                            ControlToValidate="Drp_User_Group" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
            <td class="style23">
                </td>
        </tr>
        <tr>
            <td class="label">
                Select User:</td>
            <td class="style30">
                <asp:Label ID="Lbl_Sel_User" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style34">
                <asp:UpdatePanel ID="Upd_Pan_Sel_User" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_User" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style27">
                        <asp:CompareValidator ID="Comp_Val_Sel_User" runat="server" 
                            ControlToValidate="Drp_User" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td class="label">
                Selecr Doc Type:</td>
            <td class="style31">
                <asp:Label ID="Lbl_Sel_Doc_Type" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style35">
                <asp:UpdatePanel ID="Upd_Pan_Sel_Dept0" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Doc_Type" runat="server" 
                             CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </td>
            <td class="style10">
                        <asp:CompareValidator ID="Comp_Val_Sel_Doc_Type" runat="server" 
                            ControlToValidate="Drp_Doc_Type" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style31">
                &nbsp;</td>
            <td class="style35" colspan="3">
                    <asp:Label ID="lblErrorMsg" runat="server" 
                        style="color: #CC3300; font-weight: 700;"></asp:Label>
            </td>
        </tr>
        </table>
        <div class="box">

                        <asp:GridView ID="Grd_Get_SOP_List" runat="server" AutoGenerateColumns="False" 
                          Width="600PX"   CssClass="table table-bordered table-striped Datatable" >
                
                            <Columns>
                                <asp:TemplateField HeaderText="DOC ID">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Doc_ID" runat="server" Enabled="False" CssClass="form-control"
                                            Font-Strikeout="False" Text='<%# Bind("Doc_ID") %>' 
                                            Width="75px"></asp:TextBox>
                                        <br />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Doc Title">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Doc_title" runat="server" Enabled="False" 
                                          CssClass="form-control" Text='<%# Bind("DOC_Title") %>' 
                                            TextMode="MultiLine" Width="250px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Version ID">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Ver_ID" runat="server" Enabled="False" CssClass="form-control"
                                            Font-Strikeout="False" Text='<%# Bind("Version_ID") %>' Width="40px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Dt">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Eff_Dt" runat="server" CssClass="form-control" ReadOnly="True" 
                                            Text='<%# Bind("Effective_Dt") %>' Width="60px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="*Purpose of Training">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="Drp_Train_Purpose" runat="server" CssClass="form-control" Width="97px">
                                            <asp:ListItem Value="0">--Select Purpose--</asp:ListItem>
                                            <asp:ListItem>Awareness</asp:ListItem>
                                            <asp:ListItem>Competency</asp:ListItem>
                                        </asp:DropDownList>
                                       
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="#FF6600" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="*Mode of Training">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="Drp_Train_Mode" runat="server" CssClass="form-control" Width="94px">
                                            <asp:ListItem Value="0">--Select Mode--</asp:ListItem>
                                            <asp:ListItem>Self Reading</asp:ListItem>
                                            <asp:ListItem>Active</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="#FF6600" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Trainer">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Trainer" runat="server" CssClass="form-control"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="*Evaluation (Y/N)">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="Drp_Evalution" runat="server" CssClass="form-control"
                                             Width="78px">
                                            <asp:ListItem Value="0">--Select Evaluation--</asp:ListItem>
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Value="False">No</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="#FF6600" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="*Training Days">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Train_Days" runat="server" CssClass="form-control" 
                                            Font-Strikeout="False"  Width="60px"></asp:TextBox>                                     
                                        <asp:CompareValidator ID="Comp_Train_Days" runat="server" 
                                            ControlToValidate="txt_Train_Days" ErrorMessage="Enter Numeric Value" 
                                            Font-Size="X-Small" ForeColor="#FF3300" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>                                 
                                    </ItemTemplate>
                                    <ControlStyle ForeColor="#CC3300" />
                                    <HeaderStyle ForeColor="#FF6600" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="*Passing (%)">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Pass_Per" runat="server" CssClass="form-control"
                                            Font-Strikeout="False"  Width="60px"></asp:TextBox>                                       
                                        <asp:CompareValidator ID="Pass_Per" runat="server" 
                                            ControlToValidate="txt_Pass_Per" ErrorMessage="Enter Numeric Value" 
                                            Font-Size="X-Small" ForeColor="#FF3300" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="#FF6600" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Chk_Sel_Doc_ID" runat="server" style="text-align: left" 
                                             />
                                       
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:Button ID="Btn_Add" runat="server"   CssClass="btn btn-primary btn-sm"
                                            onclick="Btn_Add_Click" Text="Add" />
                                    </HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>
                           
                        </asp:GridView>
        </div>
        </asp:Content>
