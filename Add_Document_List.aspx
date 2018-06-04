<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Document_List.aspx.cs" Inherits="TMS.Add_Document_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
	<title>DiagnoSearch Calendar</title>
  <%--  <script type="text/javascript" language="javascript" src="ClientValidation/basiccalendar.js"></script>
 <link rel="stylesheet" type="text/css" href="Styles/tcal.css" />
  <script type="text/javascript" language="javascript" src="ClientValidation/tcal.js"></script>--%>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #000000;
            background-color: #6699FF;
        }
        .style3
        {
            height: 39px;
            width: 75px;
        }
        .style4
        {
            height: 39px;
            width: 138px;
            font-size: x-small;
        }
        .style8
        {
            width: 150px;
            font-size: x-small;
            height: 23px;
            display: inline-block;
            max-width: 100%;
            margin-bottom: -2px;
            font-weight: bold;
            font-size: x-small;
            margin-left: 9px;
        }
        .style10
        {
        height: 23px;
        width: 105px;
    }
        .style11
        {
            height: 39px;
            width: 7px;
            font-size: x-small;
        }
        .style12
        {
            width: 7px;
            font-size: x-small;
        }
        .style13
        {
            width: 7px;
            font-size: x-small;
            height: 23px;
        }
        .style14
        {
            height: 12px;
            width: 150px;
            font-size: x-small;
             display: inline-block;
    max-width: 100%;
    margin-bottom: -2px;
    font-weight: bold;
    font-size: x-small;
    margin-left: 9px;
        }
        .style15
        {
            height: 12px;
            width: 7px;
            font-size: x-small;
        }
        .style18
        {
        width: 105px;
    }
        .style19
        {
            height: 23px;
            position: absolute;
            width: 105px;
        }
    .style20
    {
        height: 39px;
        width: 159px;
    }
    .style21
    {
            width: 159px;
        }
    .style22
    {
            height: 23px;
            width: 159px;
        }
    .style23
    {
        height: 23px;
        position: absolute;
        width: 159px;
    }
    .style24
    {
        height: 12px;
        width: 159px;
    }
    .style25
    {
        height: 39px;
        width: 150px;
        font-size: x-small;
    }
    .style26
    {
            font-size: x-small;
            width: 150px;
            display: inline-block;
            max-width: 100%;
            margin-bottom: -2px;
            font-weight: bold;
            font-size: x-small;
            margin-left: 9px;
        }
        .style27
        {
            font-size: x-small;
            width: 150px;
            height: 26px;
             display: inline-block;
    max-width: 100%;
    margin-bottom: -2px;
    font-weight: bold;
    font-size: x-small;
    margin-left: 9px;
        }
        .style28
        {
            width: 7px;
            font-size: x-small;
            height: 26px;
        }
        .style30
        {
            width: 159px;
            height: 26px;
        }
        .style31
        {
            width: 105px;
            height: 26px;
        }
        .style32
        {
            height: 39px;
            width: 186px;
        }
        .style34
        {
            height: 23px;
            width: 186px;
        }
        .style35
        {
            height: 12px;
            width: 186px;
        }
        .style36
        {
            width: 186px;
            height: 26px;
        }
        .style37
        {
            width: 186px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
                <input id="HIDdiv" style="width: 20px" type="hidden" /><asp:HiddenField ID="HiddApproveDt" runat="server" />
    <table class="style1">
        <tr>
            <td class="style2" colspan="6" style="text-align: center">
                Add Document List</td>           
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style32">
                    <asp:Label ID="lblErrorMsg" runat="server" 
                    style="color: #CC3300; font-weight: 700;" Font-Size="Small"></asp:Label>
                </td>
            <td class="style20">
                </td>
            <td class="style3">
                <input id="HIDdiv1" style="width: 20px" type="hidden" /><asp:HiddenField ID="HiddenEffDt" runat="server" />
            </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td class="style26">
                Select:</td>
            <td class="style12">
                <asp:Label ID="Lbl_Int_Ext" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style37">
            <asp:DropDownList ID="Drp_Type_Doc" runat="server" CssClass="form-control"
               >
                <asp:ListItem Value="0">--Select --</asp:ListItem>
                <asp:ListItem Value="Internal">Internal</asp:ListItem>
                <asp:ListItem Value="External">External</asp:ListItem>
            </asp:DropDownList>
            </td>
            <td class="style21">
                <asp:CompareValidator ID="Comp_Val_Sel_Type_Doc" runat="server" 
                    ControlToValidate="Drp_Type_Doc" ErrorMessage="Required" Font-Size="X-Small" 
                    ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
            <td class="style18">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Enter Doc ID:</td>
            <td class="style12">
                <asp:Label ID="Lbl_Doc_ID" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style37">
                <asp:TextBox ID="txt_Doc_ID" runat="server"  CssClass="form-control" Width="150px"></asp:TextBox>
            </td>
            <td class="style21">
                    <asp:RequiredFieldValidator ID="Req_Doc_ID" runat="server" 
                        ControlToValidate="txt_Doc_ID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style18">
               <input id="HIDdiv2" style="width: 20px" type="hidden" /> <asp:HiddenField ID="HiddNxtRevDt" runat="server" />
            </td>
            <td class="style18">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Enter Version ID:</td>
            <td class="style13">
                <asp:Label ID="Lbl_Ver_ID" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                    </td>
            <td class="style34">
                <asp:TextBox ID="txt_Ver_ID" runat="server"  CssClass="form-control" Width="66px"></asp:TextBox>
            </td>
            <td class="style22">
                    <asp:RequiredFieldValidator ID="Req_Ver_ID" runat="server" 
                        ControlToValidate="txt_Ver_ID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="Comp_Val_Ver" runat="server" 
                    ControlToValidate="txt_Ver_ID" ErrorMessage="Enter Numeric Value" Font-Size="X-Small" 
                    ForeColor="#FF3300" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                </td>
            <td class="style10">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Select Doc Type:</td>
            <td class="style12">
                <asp:Label ID="Lbl_Sel_Doc_Type" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style37">
                <asp:UpdatePanel ID="Up_Panel_Select_DOC" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Doc_Type" runat="server"  CssClass="form-control" AutoPostBack="True" 
                            onselectedindexchanged="Drp_Doc_Type_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style21">
                        <asp:CompareValidator ID="Comp_Val_Sel_Doc" runat="server" 
                            ControlToValidate="Drp_Doc_Type" ErrorMessage="Required" Font-Size="X-Small" 
                            ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td class="style18">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Select Sub Doc Type:</td>
            <td class="style13">
                <asp:Label ID="Lbl_Sel_Doc_Sub_Type" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            <td class="style34">
                <asp:UpdatePanel ID="Up_Panel_Select_Sub_DOC" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_Sub_Doc_Type" runat="server"  CssClass="form-control"
                            >
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style23">
                        <asp:CompareValidator ID="Comp_Val_Sel_Sub_Doc" runat="server" 
                            ControlToValidate="Drp_Sub_Doc_Type" ErrorMessage="Required" 
                            Font-Size="X-Small" ForeColor="#FF3300" Operator="NotEqual" 
                            ValueToCompare="0"></asp:CompareValidator>
                    </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
        </tr>
        <tr>
        <td class="style26">
                Select SOP ID:</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                <asp:UpdatePanel ID="Up_Panel_Select_SOP_ID" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Drp_SOP_ID" runat="server"  CssClass="form-control" AutoPostBack="False">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style21">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Enter Doc Title:</td>
            <td class="style13">
                <asp:Label ID="Lbl_Doc_Titl" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                    </td>
            <td class="style34">
                <asp:TextBox ID="txt_Doc_title" runat="server"  CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style22">
                    <asp:RequiredFieldValidator ID="Req_Doc_Title" runat="server" 
                        ControlToValidate="txt_Doc_title" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style10">
                    </td>
            <td class="style10">
                    </td>
        </tr>
        <tr>
            <td class="style14">
                Enter Approval Date:</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style35">
                <asp:TextBox ID="txt_Approval_Dt" runat="server" CssClass="txtDate form-control" 
                    Width="115px"></asp:TextBox>
                &nbsp;</td>
            <td class="style24">
            </td>               
        </tr>
        <tr>
            <td class="style27">
                Enter Effective Date:</td>
            <td class="style28">
                <asp:Label ID="Lbl_Eff_Dt" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                    </td>
            <td class="style36">
                <asp:TextBox ID="txt_Eff_Dt" runat="server" CssClass="txtDate form-control" Width="115px"></asp:TextBox>
                &nbsp;</td>
            <td class="style30">
                    <asp:RequiredFieldValidator ID="Req_Eff_Dt" runat="server" 
                        ControlToValidate="txt_Eff_Dt" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style31">
                    </td>
            <td class="style31">
                    </td>
        </tr>
        <tr>
            <td class="style26">
                Select Status:</td>
            <td class="style12">
                <asp:Label ID="Lbl_Sel_Status" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                    </td>
            <td class="style37">
                <asp:DropDownList ID="Drp_Status" runat="server"  
                     CssClass="form-control" Width="154px">
                </asp:DropDownList>
            </td>
            <td class="style21">
                    <asp:CompareValidator ID="Comp_Val_Sel_Status" runat="server" 
                    ControlToValidate="Drp_Status" ErrorMessage="Required" Font-Size="X-Small" 
                    ForeColor="#FF3300" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
            <td class="style18">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Enter Next Review Due Date:</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                <asp:TextBox ID="txt_Next_Rev_Dt" runat="server" CssClass="txtDate form-control" 
                    Width="115px"></asp:TextBox>
                    &nbsp;</td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Revision History:</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                <asp:TextBox ID="txt_Rev_History" runat="server"  CssClass="form-control"
                    TextMode="MultiLine" Width="304px"></asp:TextBox>
            </td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Add to User Training Plan:</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                <asp:CheckBox ID="Chk_Add_UTP" runat="server" style="font-size: x-small" />
            </td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                &nbsp;</td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Select Departments:</td>
            <td class="style12">
                <asp:Label ID="Lbl_Sel_Dept" runat="server" Font-Size="Small" 
                    ForeColor="#FF3300" Text="*"></asp:Label>
                    </td>
            <td class="style37">

    
    
                        <asp:GridView ID="Grd_Get_Dept_List" runat="server" 
                    AutoGenerateColumns="False" Font-Size="X-Small" 
                            Width="16px">
                            <Columns>
                                <asp:TemplateField HeaderText="Departments">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Dept_Name" runat="server" Enabled="False" Font-Size="X-Small" 
                                            Font-Strikeout="False" Text='<%# Bind("Dept_Name") %>' Width="196px"></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="X-Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_Dept" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="X-Small" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle 
                                Font-Size="X-Small" />
                            <RowStyle Font-Size="X-Small" />
                            <SelectedRowStyle 
                                Font-Size="X-Small" />
                        </asp:GridView>
    
    
    
            </td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                Send Email:</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                <asp:CheckBox ID="Chk_Send_Email" runat="server" style="font-size: x-small" />
            </td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style26">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td class="style37">
                <asp:Button ID="Btn_Add_Doc_List" runat="server" 
                    onclick="Btn_Add_Doc_List_Click" Text="Add" CssClass="btn btn-primary btn-sm"  />
            </td>
            <td class="style21">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
            <td class="style18">
                    &nbsp;</td>
        </tr>
        </table>
</asp:Content>
