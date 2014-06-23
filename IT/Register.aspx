<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="IT.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        body {
            background-image: url('parchment-30.jpg');
            background-color: #cccccc;
            font-family: Papyrus;
            font-size: 24px;
        }
        .auto-style2 {
            width: 361px;
        }
        .auto-style3 {
            width: 137px;
        }
        .auto-style4 {
            width: 438px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" align="right">
                    <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
&nbsp;&nbsp;
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtUsername" runat="server" BackColor="#FAF8C7"></asp:TextBox>
                </td>
                <td align="left" class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Input your username!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" BackColor="#CEC69F" Font-Bold="True" Font-Names="Papyrus" />
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
