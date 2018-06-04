<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Country.aspx.cs" Inherits="TMS.Add_Country" %>
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
        .style3
        {
            width: 105px;
            font-size: x-small;
            height: 11px;
        }
        .style8
        {
            width: 6px;
            height: 18px;
        }
        .style9
        {
            width: 315px;
            height: 18px;
        }
        .style10
        {
            height: 18px;
        }
        .style12
        {
            width: 6px;
            height: 16px;
        }
        .style13
        {
            width: 315px;
            height: 16px;
        }
        .style14
        {
            height: 16px;
        }
        .style15
        {
            width: 6px;
            height: 11px;
        }
        .style16
        {
            width: 315px;
            height: 11px;
        }
        .style17
        {
            height: 11px;
        }
        .style18
        {
            width: 105px;
            font-size: x-small;
            height: 1px;
        }
        .style19
        {
            width: 6px;
            height: 1px;
        }
        .style20
        {
            width: 315px;
            height: 1px;
        }
        .style21
        {
            height: 1px;
        }
        .style22
        {
            display: inline-block;
            max-width: 100%;
            margin-bottom: -2px;
            font-weight: bold;
            font-size: x-small;
            margin-left: 9px;
            width: 105px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="5" style="text-align: center; color: #000000">
                Add Country</td>
        </tr>
        <tr>
            <td class="style22">
                Enter Country Name:</td>
            <td class="style8">
                <asp:Label ID="Lbl_Cntry" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style9">
                <asp:TextBox ID="txt_Country" runat="server"  CssClass="form-control" Width="251px"></asp:TextBox>
            </td>
            <td class="style10">
                    <asp:RequiredFieldValidator ID="Req_Country_Name" runat="server" 
                        ControlToValidate="txt_Country" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style22">
                Enter Country Prefix</td>
            <td class="style12">
                <asp:Label ID="Lbl_Cntry_Prefix" runat="server" Font-Size="Small" ForeColor="#FF3300" 
                    Text="*"></asp:Label>
                </td>
            <td class="style13">
                <asp:TextBox ID="txt_Coun_Prefix" runat="server" 
                    MaxLength="3" Width="39px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="style14">
                    <asp:RequiredFieldValidator ID="Req_Country_Prefix" runat="server" 
                        ControlToValidate="txt_Coun_Prefix" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td class="style14">
                </td>
        </tr>
        <tr>
            <td class="style18">
                </td>
            <td class="style19">
                </td>
            <td class="style20">
                <asp:Button ID="Btn_Add_Country" runat="server" onclick="Btn_Add_Country_Click" 
                    Text="Add" CssClass="btn btn-primary btn-sm" />
            <asp:Label ID="lblErrorMsg" runat="server" style="color: #FF0000; font-weight: 700;" 
                        Font-Size="X-Small"></asp:Label>
                </td>
            <td class="style21">
                </td>
            <td class="style21">
                </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
    </table>


   

    <table>
     <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False" 
        >
          <HeaderTemplate>
        <table>
           <td scope="col" style="width: 150px; text-decoration: underline; font-weight: bold;">
            Country Name Added 
           </td>
    </HeaderTemplate>
<ItemTemplate>

        <tr>
            <td>
                <%# Eval("Country_Name")%>
            </td>
         </tr>
 
    </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    </table>
    </asp:Content>
