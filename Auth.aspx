<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="TMS.Auth" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Jquery1.12.4.js" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style type="text/css">
        .body
        {
            background-color: #CCC6;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        .span
        {
            color: #345053;
            font-family: 'Raleway' , sans-serif;
            font-size: 18px;
        }
        p
        {
            color: #fff;
            font-family: 'Raleway' , sans-serif;
            font-size: 12px;
        }
        .col-centered
        {
            float: none;
            margin: 0 auto;
            margin-top: 130px;
        }
        .wrath-content-box
        {
            padding: 15px;
        }
           .style1
        {
            width: 97%;
            font-family: Arial;
            font-size: x-small;
        }
        .style3
        {
            font-weight: 700;
            text-align: left;
        }
        .style11
        {
            width: 214px;
        }
        .style12
        {
            height: 23px;
            width: 214px;
        }
        .style13
        {
            width: 92px;
            height: 23px;
            font-weight: 700;
        }
        .style21
        {
            text-align: center;
        }
        .style23
        {
            width: 75px;
            height: 66px;
        }
        .style24
        {
            font-weight: 700;
            text-align: left;
            width: 92px;
        }
        .style25
        {
            width: 4px;
        }
        .style26
        {
            height: 23px;
            width: 4px;
        }
        .style28
        {
            width: 213px;
            height: 130px;
            float: right;
        }
        .style29
        {
            text-align: center;
            height: 57px;
        }
        .style30
        {
            height: 57px;
            width: 46px;
        }
        .style31
        {
            text-align: center;
            height: 5px;
        }
        .style32
        {
            height: 5px;
            width: 46px;
        }
        .style33
        {
            width: 345px;
        }
        .style36
        {
            width: 46px;
        }
        .style37
        {
            height: 23px;
            width: 46px;
        }
        .style38
        {
            width: 373px;
            text-align: center;
        }
        .style41
        {
            height: 23px;
        }
        .style42
        {
            width: 373px;
        }
        .style43
        {
            width: 350px;
            text-align: center;
        }
        .style44
        {
            width: 25px;
            text-align: center;
        }
    </style>
</head>
<body style="background-color: #CCC6;">
    <form id="Form1" runat="server">
        <div>
    
<%--        <table class="style1">
            <tr>
                <td class="style43">
                    &nbsp;</td>
                <td class="style33">
                    <img alt="" class="style28" src="Images/DS_mostTrustedCRO.gif" /></td>
                <td class="style44">
                    &nbsp;</td>
                <td class="style21">
                    &nbsp;</td>
            </tr>
            
            </table>
            <table class="style1">
            <tr>
                <td class="style31" colspan="5">
                    <asp:Literal ID="Rotator" runat="server"></asp:Literal></td>
                <td class="style32">
                    </td>
            </tr>
            <tr>
                <td class="style29" colspan="5">
                    <img alt="" class="style23" src="Images/DS%2075%20x%2066.jpg" /></td>
                <td class="style30">
                    </td>
            </tr>
            </table>--%>
    
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-centered" style="border: 2px solid #747a80;border-radius: 12px;" >

                <h4 style="font-style:italic;margin-left: 170px;color: #28a745;"><u> <b>N</b>light </u> </h4>
            <h4 style="font-style:italic;margin-left: 50px;"><u> <b>T</b>raining   <b>M</b>anagement <b>S</b>ystem</u> </h4>
                <div class="wrath-content-box">
                    <span>Sign In</span>
                </div>
                <div class="wrath-content-box">
                    <asp:Label ID="lblErrorMsg" runat="server" Style="color: #CC3300; font-size: small;"
                        ForeColor="Red"></asp:Label>
                    <asp:HiddenField runat="server" ID="hdn" Value="0" />
                    <div class="input-group">
                        <span class="input-group-addon btn-primary" id="basic-addon1"><span class="glyphicon glyphicon-user">
                        </span></span>
                        <asp:TextBox ID="txt_UserName" class="form-control" placeholder="Username" required="required"
                            runat="server">  </asp:TextBox>
                    </div>
                    <div class="clearfix">
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon btn-primary" id="basic-addon2"><span class="glyphicon glyphicon-lock">
                        </span></span>
                        <asp:TextBox ID="txt_Pwd" class="form-control" placeholder="Password" required="required"
                            TextMode="password" runat="server" />
                    </div>
                    <div class="clearfix">
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6 text-right">
                            <div class="form-group text-right">
                                <asp:Button ID="btnLogin" class="btn btn-success btn-sm form-control" runat="server"
                                    Text="Sign In" OnClick="Btn_Login_Click" />
                            </div>
                        </div>
                        <div class="col-sm-6 text-right">
                            <div class="form-group text-right">
                                <asp:Button ID="btnCancel" class="btn btn-danger btn-sm form-control" Text="Cancel"
                                    runat="server" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 text-left">
                            <div class="form-group text-left">
                                 Powered by DiagnoSearch Life Sciences Pvt Ltd.  
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
