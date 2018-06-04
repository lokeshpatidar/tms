<%@ Page Title="" Language="C#"  AutoEventWireup="true"
    CodeBehind="GetDocPdf.aspx.cs" Inherits="TMS.GetDocPdf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>DiagnoSearch</title>
</head>
<body>
    <form id="Form1" runat="server">
    <div>
        <asp:Label ID="lblErrorMsg" runat="server" Style="color: #CC3300; font-weight: 700;
            font-size: small;"></asp:Label>
        <%-- <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://docs.google.com/viewer?url=   " Style="z-index: 101;
            left: 24px; position: absolute; top: 96px">Open PDF into New Page</asp:HyperLink>
        <cc1:ShowPdf ID="ShowPdf1" runat="server" BorderStyle="Inset" BorderWidth="2px" FilePath="fw9.pdf"
            Height="352px" Style="z-index: 103; left: 24px; position: absolute; top: 128px"
            Width="856px" />--%>
        <asp:Literal ID="ltEmbed" runat="server" />
    </div>
    </form>
</body>
</html>
