<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assesment_Result.aspx.cs" Inherits="TMS.Assesment_Result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-family: Arial;
            font-size: small;
        }
        .style3
        {
            font-family: Arial;
            font-size: small;
            text-align: center;
        }
        .style4
        {
            font-family: Arial;
            font-size: small;
        }
        .style6
        {
            font-family: Arial;
            font-size: small;
            width: 218px;
        }
        .style7
        {
            font-family: Arial;
            font-size: small;
            width: 147px;
        }
        .style8
        {
            font-family: Arial;
            font-size: small;
            width: 158px;
        }
        .style9
        {
            font-family: Arial;
            font-size: small;
            width: 168px;
            height: 6px;
        }
        .style14
        {
            font-family: Arial;
            font-size: small;
            height: 20px;
        }
        .style15
        {
            font-family: Arial;
            font-size: small;
            width: 158px;
            height: 20px;
        }
        .style16
        {
            font-family: Arial;
            font-size: small;
            width: 218px;
            height: 20px;
        }
        .style17
        {
            font-family: Arial;
            font-size: small;
            width: 147px;
            height: 20px;
        }
        .style18
        {
            font-family: Arial;
            font-size: small;
            width: 158px;
            height: 6px;
        }
        .style19
        {
            font-family: Arial;
            font-size: small;
            width: 218px;
            height: 6px;
        }
        .style20
        {
            font-family: Arial;
            font-size: small;
            width: 147px;
            height: 6px;
        }
        .style21
        {
            font-family: Arial;
            font-size: small;
            height: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2" colspan="5" 
                    style="text-align: center; background-color: #6699FF">
                    Assessment Result</td>
            </tr>
            <tr>
                <td class="style3" colspan="5">
            <asp:Label ID="lbldisplaymsg" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small;" 
                    Font-Size="X-Small"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style9">
                </td>
                <td class="style18">
                </td>
                <td class="style19">
                </td>
                <td class="style20">
                </td>
                <td class="style21">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                </td>
                <td class="style15">
                </td>
                <td class="style16">
                    Total Questions:</td>
                <td class="style17">
            <asp:Label ID="lblTotQuestions" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small; text-align: left;" 
                    Font-Size="X-Small">0</asp:Label>
                </td>
                <td class="style14">
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    Correct Answer:</td>
                <td class="style7">
            <asp:Label ID="lblCorrectAns" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small; text-align: left;" 
                    Font-Size="X-Small">0</asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    Wrong Answer:</td>
                <td class="style7">
            <asp:Label ID="lblWrngAns" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small; text-align: left;" 
                    Font-Size="X-Small">0</asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    Answers yet to be Analysed:</td>
                <td class="style7">
            <asp:Label ID="lblYetTBAnalysed" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small; text-align: left;" 
                    Font-Size="X-Small">0</asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14" colspan="5">
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    Passing Percentage:</td>
                <td class="style7">
            <asp:Label ID="lbl_Tot_Per" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small; text-align: left;" 
                    Font-Size="X-Small">0</asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                </td>
                <td class="style15">
                </td>
                <td class="style16">
                    Percentage Scored:</td>
                <td class="style17">
            <asp:Label ID="lbl_User_Per" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small; text-align: left;" 
                    Font-Size="X-Small">0</asp:Label>
                </td>
                <td class="style14">
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                </td>
                <td class="style15">
                </td>
                <td class="style16">
            <asp:Label ID="lblErrorMsg" runat="server" 
                    style="color: #FF0000; font-weight: 700;" Font-Size="X-Small"></asp:Label>
                </td>
                <td class="style17">
                <asp:Button ID="Btn_Close" runat="server" Font-Size="X-Small" 
                    onclick="Btn_Close_Click" Text="Close" />
                </td>
                <td class="style14">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
