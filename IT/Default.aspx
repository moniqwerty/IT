<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
<style>
table { border-collapse: collapse; font-family: Calibri, sans-serif; }
colgroup, tbody { border: solid medium; }
td { border: solid thin; height: 1.4em; width: 1.4em; text-align: center; padding: 0; }
</style>
<table>
  <caption>Sudoku of the day</caption>
  <colgroup><col><col><col>
  <colgroup><col><col><col>
  <colgroup><col><col><col>
  <tbody>
   <tr> <td>&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label2" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label4" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label5" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label6" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label7" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label8" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label9" runat="server"></asp:Label>
   <tr> <td>  
       <asp:Label ID="Label10" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label11" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label12" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label13" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label14" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label15" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label16" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label17" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label18" runat="server"></asp:Label>
   <tr> <td>&nbsp;<asp:Label ID="Label19" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label20" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label21" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label22" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label23" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label24" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label25" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label26" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label27" runat="server"></asp:Label>
  <tbody>
   <tr> <td>&nbsp;<asp:Label ID="Label28" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label29" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label31" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label32" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label33" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label34" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label35" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label36" runat="server"></asp:Label>
   <tr> <td>  
       <asp:Label ID="Label37" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label38" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label39" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label40" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label41" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label42" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label43" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label44" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label45" runat="server"></asp:Label>
   <tr> <td>&nbsp;<asp:Label ID="Label46" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label47" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label48" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label49" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label50" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label51" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label52" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label53" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label54" runat="server"></asp:Label>
  <tbody>
   <tr> <td>&nbsp;<asp:Label ID="Label55" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label56" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label57" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label58" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label59" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label60" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label61" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label62" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label63" runat="server"></asp:Label>
   <tr> <td>  
       <asp:Label ID="Label64" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label65" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label66" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label67" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label68" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label69" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label70" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label71" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label72" runat="server"></asp:Label>
   <tr> <td>&nbsp;<asp:Label ID="Label73" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label74" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label75" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label76" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label77" runat="server"></asp:Label>
       <td>
           <asp:Label ID="Label78" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label79" runat="server"></asp:Label>
       <td>  
           <asp:Label ID="Label80" runat="server"></asp:Label>
       <td>&nbsp;<asp:Label ID="Label81" runat="server"></asp:Label>
</table>
    </form>
</body>
</html>
