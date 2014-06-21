<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT.Default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <style>
        .selected {
            background-color: beige;
        }

        .transparent {
            background-color: transparent;
        }

        body {
            background-image: url('parchment-30.jpg');
            background-color: #cccccc;
            font-family: Papyrus;
            font-size: 24px;
        }

        span {
            font-family: Papyrus;
            font-size: 24px;
        }

        .buttons {
            width: 100px;
            float: left;
            margin-left: 130px;
            margin-top: 200px;
        }

        .content {
            height: 715px;
            width: 998px;
            background-image: url('dragon.jpg');
            margin-top: -20px;
        }

        table {
            border-collapse: collapse;
            font-family: Calibri, sans-serif;
            margin-left: 100px;
            margin-top: 50px;
            background: rgba(245,245,220,0.68);
        }

        colgroup, tbody {
            border: solid medium;
        }

        td {
            border-color: rgba(75, 58, 30, 1);
            border: solid thin;
            height: 2.4em;
            width: 2.4em;
            text-align: center;
            padding: 0;
            vertical-align: central;
        }

        input[type=button], input[type=submit] {
            background-color: beige;
        }

        input {
            color: #000000;
            text-decoration: none;
            height: 100%;
            width: 100%;
        }

        td div {
            height: 100%;
            width: 100%;
        }

        td:nth-child(3n) {
            border-right: solid medium;
        }

        tr:nth-child(3n) {
            border-bottom: solid medium;
        }
    </style>
    <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

    <script>
        function callClick() {
            $('#btnHidden').text($(event.target).attr('data-name'));
            __doPostBack('btnHidden', $('#btnHidden').text());
        }

        function about() {
            alert("Created by Irena, Monika and Natasha");
        }

        function handleKeypress(event) {
            var key;

            if (document.layers) {
                key = event.which;
            }
            if (document.all) {
                event = window.event;
                key = event.keyCode;
            }
            if (event.keyCode >= 48 && event.keyCode <= 57) {
                __doPostBack('btnHidden2', event.keyCode);
            }
        }
        if (document.layers) {
            document.captureEvents(Event.KEYPRESS);
        }
        function handleKeyDown(event) {
            if (event.which >= 37 && event.which <= 40) {
                $('#btnHidden3').text(event.which);
                __doPostBack('btnHidden3', $('#btnHidden3').text());
            }
        }
        document.onkeydown = handleKeyDown;
        document.onkeypress = handleKeypress;
    </script>
    <title>Sudoku of the day</title>
</head>
<body>
    <div align="center">

        <div class="content">
            <form id="form1" runat="server" onkeypress="Test()">
                <asp:ScriptManager ID="ScriptManager1"
                    EnablePageMethods="true"
                    EnablePartialRendering="true" runat="server" />
                <asp:Timer ID="timer" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:UpdatePanel ID="updatePanel" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="timer" />

                    </Triggers>
                    <ContentTemplate>
                        <p>
                            <asp:Label Visible="false" runat="server" ID="ticks" Text="0" />
                            <asp:Label ID="hours" runat="server" Text="00" />:
                            <asp:Label ID="minutes" runat="server" Text="00" />:
                            <asp:Label ID="seconds" runat="server" Text="00" />
                        </p>
                    </ContentTemplate>

                </asp:UpdatePanel>

                <asp:Button Style="display: none;" runat="server" ID="btnHidden" OnClick="Grid_Click" />
                <asp:Button Style="display: none;" runat="server" ID="btnHidden2" OnClick="keyPress" />
                <asp:Button Style="display: none;" runat="server" ID="btnHidden3" OnClick="keyDown" />

                <p>&nbsp;</p>
                <div class="buttons">
                    <asp:Button runat="server" ID="easy" OnClick="new_Easy" Text="Easy Game" />

                    <br />
                    <asp:Button runat="server" ID="medium" OnClick="new_Medium" Text="Medium Game" />

                    <br />
                    <asp:Button runat="server" ID="hard" OnClick="new_Hard" Text="Hard Game" />

                    <br />
                    <input type="button" value="About" onclick="about()" />
                    <br />
                    <asp:Button runat="server" ID="btnHighScores" Text="High Scores" />
                    <br />
                    <br />
                    <br />
                    <asp:Button runat="server" ID="btnUndo" Text="Undo" OnClick="btnUndo_Click" />
                    <asp:Button runat="server" ID="btnRedo" Text="Redo" OnClick="btnRedo_Click" />
                </div>
                <asp:Table ID="Table1" runat="server">

                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label1">
                                <asp:Label onclick="callClick()" data-name="Label1" ID="Label1" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label2">
                                <asp:Label onclick="callClick()" data-name="Label2" ID="Label2" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label3">
                                <asp:Label onclick="callClick()" data-name="Label3" ID="Label3" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label4">
                                <asp:Label onclick="callClick()" data-name="Label4" ID="Label4" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label5">
                                <asp:Label onclick="callClick()" data-name="Label5" ID="Label5" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label6">
                                <asp:Label onclick="callClick()" data-name="Label6" ID="Label6" runat="server">
                            
                                </asp:Label>
                            </div>

                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label7">
                                <asp:Label onclick="callClick()" data-name="Label7" ID="Label7" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label8">
                                <asp:Label onclick="callClick()" data-name="Label8" ID="Label8" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label9">
                                <asp:Label onclick="callClick()" data-name="Label9" ID="Label9" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label10">
                                <asp:Label onclick="callClick()" data-name="Label10" ID="Label10" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label11">
                                <asp:Label onclick="callClick()" data-name="Label11" ID="Label11" runat="server"></asp:Label>
                            </div>

                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label12">
                                <asp:Label onclick="callClick()" data-name="Label12" ID="Label12" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label13">
                                <asp:Label onclick="callClick()" data-name="Label13" ID="Label13" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label14">
                                <asp:Label onclick="callClick()" data-name="Label14" ID="Label14" runat="server"></asp:Label>
                            </div>

                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label15">
                                <asp:Label onclick="callClick()" data-name="Label15" ID="Label15" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label16">
                                <asp:Label onclick="callClick()" data-name="Label16" ID="Label16" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label17">
                                <asp:Label onclick="callClick()" data-name="Label17" ID="Label17" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label18">
                                <asp:Label onclick="callClick()" data-name="Label18" ID="Label18" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label19">
                                <asp:Label onclick="callClick()" data-name="Label19" ID="Label19" runat="server"></asp:Label>
                            </div>

                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label20">
                                <asp:Label onclick="callClick()" data-name="Label20" ID="Label20" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label21">
                                <asp:Label onclick="callClick()" data-name="Label21" ID="Label21" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label22">
                                <asp:Label onclick="callClick()" data-name="Label22" ID="Label22" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label23">
                                <asp:Label onclick="callClick()" data-name="Label23" ID="Label23" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label24">
                                <asp:Label onclick="callClick()" data-name="Label24" ID="Label24" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label25">
                                <asp:Label onclick="callClick()" data-name="Label25" ID="Label25" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label26">
                                <asp:Label onclick="callClick()" data-name="Label26" ID="Label26" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label27">
                                <asp:Label onclick="callClick()" data-name="Label27" ID="Label27" runat="server"></asp:Label>
                            </div>

                        </asp:TableCell>

                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label28">
                                <asp:Label onclick="callClick()" data-name="Label28" ID="Label28" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label29">
                                <asp:Label onclick="callClick()" data-name="Label29" ID="Label29" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label30">
                                <asp:Label onclick="callClick()" data-name="Label30" ID="Label30" runat="server"></asp:Label>
                            </div>

                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label31">
                                <asp:Label onclick="callClick()" data-name="Label31" ID="Label31" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label32">
                                <asp:Label onclick="callClick()" data-name="Label32" ID="Label32" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label33">
                                <asp:Label onclick="callClick()" data-name="Label33" ID="Label33" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label34">
                                <asp:Label onclick="callClick()" data-name="Label34" ID="Label34" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label35">
                                <asp:Label onclick="callClick()" data-name="Label35" ID="Label35" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label36">
                                <asp:Label onclick="callClick()" data-name="Label36" ID="Label36" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label37">
                                <asp:Label onclick="callClick()" data-name="Label37" ID="Label37" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label38">
                                <asp:Label onclick="callClick()" data-name="Label38" ID="Label38" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label39">
                                <asp:Label onclick="callClick()" data-name="Label39" ID="Label39" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label40">
                                <asp:Label onclick="callClick()" data-name="Label40" ID="Label40" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label41">
                                <asp:Label onclick="callClick()" data-name="Label41" ID="Label41" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label42">
                                <asp:Label onclick="callClick()" data-name="Label42" ID="Label42" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label43">
                                <asp:Label onclick="callClick()" data-name="Label43" ID="Label43" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label44">
                                <asp:Label onclick="callClick()" data-name="Label44" ID="Label44" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label45">
                                <asp:Label onclick="callClick()" data-name="Label45" ID="Label45" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label46">
                                <asp:Label onclick="callClick()" data-name="Label46" ID="Label46" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label47">
                                <asp:Label onclick="callClick()" data-name="Label47" ID="Label47" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label48">
                                <asp:Label onclick="callClick()" data-name="Label48" ID="Label48" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label49">
                                <asp:Label onclick="callClick()" data-name="Label49" ID="Label49" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label50">
                                <asp:Label onclick="callClick()" data-name="Label50" ID="Label50" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label51">
                                <asp:Label onclick="callClick()" data-name="Label51" ID="Label51" runat="server"></asp:Label>
                            </div>

                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label52">
                                <asp:Label onclick="callClick()" data-name="Label52" ID="Label52" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label53">
                                <asp:Label onclick="callClick()" data-name="Label53" ID="Label53" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label54">
                                <asp:Label onclick="callClick()" data-name="Label54" ID="Label54" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label55">
                                <asp:Label onclick="callClick()" data-name="Label55" ID="Label55" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label56">
                                <asp:Label onclick="callClick()" data-name="Label56" ID="Label56" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label57">
                                <asp:Label onclick="callClick()" data-name="Label57" ID="Label57" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label58">
                                <asp:Label onclick="callClick()" data-name="Label58" ID="Label58" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label59">
                                <asp:Label onclick="callClick()" data-name="Label59" ID="Label59" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label60">
                                <asp:Label onclick="callClick()" data-name="Label60" ID="Label60" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label61">
                                <asp:Label onclick="callClick()" data-name="Label61" ID="Label61" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label62">
                                <asp:Label onclick="callClick()" data-name="Label62" ID="Label62" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>

                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label63">
                                <asp:Label onclick="callClick()" data-name="Label63" ID="Label63" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label64">
                                <asp:Label onclick="callClick()" data-name="Label64" ID="Label64" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label65">
                                <asp:Label onclick="callClick()" data-name="Label65" ID="Label65" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label66">
                                <asp:Label onclick="callClick()" data-name="Label66" ID="Label66" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label67">
                                <asp:Label onclick="callClick()" data-name="Label67" ID="Label67" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label68">
                                <asp:Label onclick="callClick()" data-name="Label68" ID="Label68" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label69">
                                <asp:Label onclick="callClick()" data-name="Label69" ID="Label69" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label70">
                                <asp:Label onclick="callClick()" data-name="Label70" ID="Label70" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label71">
                                <asp:Label onclick="callClick()" data-name="Label71" ID="Label71" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label72">
                                <asp:Label onclick="callClick()" data-name="Label72" ID="Label72" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label73">
                                <asp:Label onclick="callClick()" data-name="Label73" ID="Label73" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label74">
                                <asp:Label onclick="callClick()" data-name="Label74" ID="Label74" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label75">
                                <asp:Label onclick="callClick()" data-name="Label75" ID="Label75" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label76">
                                <asp:Label onclick="callClick()" data-name="Label76" ID="Label76" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label77">
                                <asp:Label onclick="callClick()" data-name="Label77" ID="Label77" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label78">
                                <asp:Label onclick="callClick()" data-name="Label78" ID="Label78" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label79">
                                <asp:Label onclick="callClick()" data-name="Label79" ID="Label79" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label80">
                                <asp:Label onclick="callClick()" data-name="Label80" ID="Label80" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div onclick="callClick()" data-name="Label81">
                                <asp:Label onclick="callClick()" data-name="Label81" ID="Label81" runat="server"></asp:Label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </form>
        </div>
    </div>
</body>
</html>
