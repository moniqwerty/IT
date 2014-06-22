<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighScores.aspx.cs" Inherits="IT.HighScores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
