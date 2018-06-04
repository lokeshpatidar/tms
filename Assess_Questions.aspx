<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assess_Questions.aspx.cs" Inherits="TMS.Assess_Questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 133px;
            font-size: x-small;
        }
        .style7
        {
            width: 449px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style5">
        <tr>
            <td colspan="5" 
                style="text-align: center; color: #000000; background-color: #6699FF">
                User Assessment</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
            <asp:Label ID="lbldisplaymsg" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small;" 
                    Font-Size="X-Small"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Doc ID</td>
            <td class="style7">
                <asp:TextBox ID="txt_DOC_ID" runat="server" Font-Size="X-Small" Width="138px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_CA_ID" runat="server" Font-Size="X-Small" Width="16px" 
                    Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Req_Doc_ID" runat="server" 
                        ControlToValidate="txt_DOC_ID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Version ID</td>
            <td class="style7">
                <asp:TextBox ID="txt_Ver_ID" runat="server" Font-Size="X-Small" Width="51px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_Quest_ID" runat="server" Font-Size="X-Small" Width="16px" 
                    Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Req_Ver_ID" runat="server" 
                        ControlToValidate="txt_Ver_ID" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                DOC Title</td>
            <td class="style7">
                <asp:TextBox ID="txt_DOC_Title" runat="server" Font-Size="X-Small" 
                    Height="30px" TextMode="MultiLine" Width="390px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_SelectAnyOne" runat="server" Font-Size="X-Small" 
                    Width="63px" Visible="False"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                IMAGE (IF ANY):</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txt_Act_Ans" runat="server" Font-Size="X-Small" 
                    Width="63px" Visible="False"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txt_Attempt" runat="server" Font-Size="X-Small" 
                    Width="63px" Visible="False"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Question:</td>
            <td class="style7">
                <asp:TextBox ID="txt_Questions" runat="server" Font-Size="X-Small" 
                    Height="58px" TextMode="MultiLine" Width="470px"></asp:TextBox>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_Quest" runat="server" 
                        ControlToValidate="txt_Questions" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">

    
    
                        <asp:GridView ID="Grd_Select_Ans" runat="server" 
                    AutoGenerateColumns="False" Font-Size="X-Small" 
                            Width="16px">
                            <Columns>
                                <asp:TemplateField HeaderText="Options">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Assess_Opt" runat="server" Enabled="False" Font-Size="X-Small" 
                                            Font-Strikeout="False" Text='<%# Bind("QuesID1") %>' Width="196px"></asp:TextBox>
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Answer:</td>
            <td class="style7">
                <asp:TextBox ID="txt_Answer" runat="server" Font-Size="X-Small" Height="58px" 
                    TextMode="MultiLine" Width="470px"></asp:TextBox>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="Req_Assesment" runat="server" 
                        ControlToValidate="txt_Answer" ErrorMessage="Required" Font-Size="X-Small" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
            <asp:Label ID="lblErrorMsg" runat="server" 
                    style="color: #FF0000; font-weight: 700;" Font-Size="X-Small"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:Button ID="Btn_Next" runat="server" Font-Size="X-Small" 
                    onclick="Btn_Next_Click" Text="Next" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
