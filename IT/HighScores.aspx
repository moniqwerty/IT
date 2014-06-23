<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighScores.aspx.cs" Inherits="IT.HighScores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
         body {
            background-image: url('parchment-30.jpg');
            background-color: #cccccc;
            font-family: Papyrus;
            font-size: 24px;
        }

        input[type=button], input[type=submit] {
            background-color:#CEC69F;  
        }

        input {
            font-family: Papyrus;
            font-weight: bold;
            color: #000000;
            text-decoration: none;
            height: 100%;
            margin: 10px 0px 10px 20px;
            padding: 5px 15px 5px 15px;
        }
        table {
            margin-left: 20px;
            border: 5px solid #552419; 
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
                <asp:Button ID="btnEasy" runat="server" Text="Easy" onClick="btnEasy_Click"/>
                <asp:Button ID="btnMedium" runat="server" Text="Medium" OnClick="btnMedium_Click"/>
                <asp:Button ID="btnHard" runat="server" Text="Hard" OnClick="btnHard_Click" />
            
            <br />
            <br />
          <asp:GridView ID="gvHighScores" runat="server" AutoGenerateColumns="False" DataKeyNames="ID">
                <Columns>                    
                    <asp:BoundField DataField="ID" Visible="false" HeaderText="ID"/>
                    <asp:BoundField DataField="Username" HeaderText="Player Name" />
                    <asp:BoundField DataField="Highscore" HeaderText="HighScore" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
