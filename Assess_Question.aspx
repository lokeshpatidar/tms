<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assess_Question.aspx.cs" Inherits="TMS.Assess_Question" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
        <title>DiagnoSearch</title>
     <link rel="icon" href="img/favicon.ico" type="image/x-icon" />
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Jquery1.12.4.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="Styles/datatables/dataTables.bootstrap.css" />
    <script src="Scripts/TMS.js" type="text/javascript"></script>
    
    <style type="text/css">
        .style6
        {
            font-size: x-small;
            font-family: Arial;
            width: 113px;
        }
        .style7
        {
            font-family: Arial;
        }
        .style8
        {
            font-family: Arial;
            width: 578px;
            text-align: left;
        }
        .style9
        {
            width: 51px;
        }
        .style10
        {
            width: 4px;
        }
          .Background
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        
        .Popup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 400px;
            height: 350px;
        }
        
        .lbl
        {
            font-size: 16px;
            font-style: italic;
            font-weight: bold;
        }
        
        
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
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
    <div runat="server" id="DivQuestion" >
       <table class="style5">
        <tr>
            <td colspan="5" 
                
                style="text-align: center; color: #000000; background-color: #6699FF; font-size: small;" 
                class="style7">
                User Assessment</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
            <asp:Label ID="lbldisplaymsg" runat="server" 
                    style="color: #00CC00; font-weight: 700; font-size: small;" 
                    Font-Size="X-Small"></asp:Label>
            </td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Doc ID</td>
            <td class="style8">
                <asp:TextBox ID="txt_DOC_ID" runat="server"  CssClass="form-control" Width="138px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:TextBox ID="txt_CA_ID" runat="server" Font-Size="X-Small" Width="16px" 
                    Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Version ID</td>
            <td class="style8">
                <asp:TextBox ID="txt_Ver_ID" runat="server" CssClass="form-control" Width="51px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:TextBox ID="txt_Quest_ID" runat="server" Font-Size="X-Small" Width="16px" 
                    Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                DOC Title</td>
            <td class="style8">
                <asp:TextBox ID="txt_DOC_Title" runat="server" CssClass="form-control"
                    Height="30px" TextMode="MultiLine" Width="479px" 
                  ></asp:TextBox>
            </td>
            <td class="style9">
                <asp:TextBox ID="txt_SelectAnyOne" runat="server" Font-Size="X-Small" 
                    Width="63px" Visible="False"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                IMAGE (IF ANY):</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:TextBox ID="txt_Act_Ans" runat="server" Font-Size="X-Small" 
                    Width="63px" Visible="False"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:TextBox ID="txt_Attempt" runat="server" CssClass="form-control"
                    Width="63px" Visible="False"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="label">
                Question:</td>
            <td class="style8">
                <asp:TextBox ID="txt_Questions" runat="server" CssClass="form-control"
                    Height="58px" TextMode="MultiLine" Width="566px" 
                  ></asp:TextBox>
            </td>
            <td class="style9">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                        <asp:GridView ID="Grd_Select_Ans" runat="server" 
                    AutoGenerateColumns="False" Font-Size="X-Small" 
                            Width="122px">
                            <Columns>
                                <asp:TemplateField HeaderText="Options">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Assess_Opt" runat="server" Enabled="False"
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
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Answer:</td>
            <td class="style8">
                <asp:TextBox ID="txt_Answer" runat="server" CssClass="form-control" Height="58px" 
                    TextMode="MultiLine" Width="566px" style="font-family: Arial"></asp:TextBox>
            </td>
            <td class="style9">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
            <asp:Label ID="lblErrorMsg" runat="server" 
                    style="color: #FF0000; font-weight: 700;" Font-Size="X-Small"></asp:Label>
            </td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Button ID="Btn_Skip" runat="server"  CssClass="btn btn-primary btn-sm" 
                    onclick="Btn_Skip_Click" Text="Skip" />
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:Button ID="Btn_Next" runat="server"  CssClass="btn btn-primary btn-sm"  
                    onclick="Btn_Next_Click" Text="Next" />
            </td>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
    </table>
    </div>

    <div runat="server" id="DivResult" class ="lokesh" visible="false">    
       <table class="style1">
            <tr>
                <td class="style2" colspan="5" 
                    style="text-align: center; background-color: #6699FF">
                    Assessment Result</td>
            </tr>
            <tr>
                <td class="style3" colspan="5">
            <asp:Label ID="Label1" runat="server" 
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
            <asp:Label ID="Label2" runat="server" 
                    style="color: #FF0000; font-weight: 700;" Font-Size="X-Small"></asp:Label>
                </td>
                <td class="style17">
                <input   type="button" id="btnClose" onclick ="return CloseExam()"  text="Close" />
                </td>
                <td class="style14">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
