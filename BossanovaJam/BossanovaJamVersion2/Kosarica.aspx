<%@ Page Title="Košarica" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kosarica.aspx.cs" Inherits="BossanovaJamVersion2.Kosarica" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
    <div>
        <div class="my-search pull-right">
        <asp:DropDownList ID="valuta" runat="server" AutoPostBack="True" CssClass="form-control my-input" DataValueField="valuta" AppendDataBoundItems="True">
            <asp:ListItem Value="0" Text="-- Valuta --"></asp:ListItem>
            <asp:ListItem Value="1" >AUD</asp:ListItem>
            <asp:ListItem Value="2" >GBP</asp:ListItem>
            <asp:ListItem Value="3" >JPY</asp:ListItem>
            <asp:ListItem Value="4" >SEK</asp:ListItem>
            <asp:ListItem Value="5" >USD</asp:ListItem>
        </asp:DropDownList>
        </div>

		<h4>Vsebina košarice</h4>
		<hr>
        <asp:Repeater ID="izdelki1" runat="server">
            <ItemTemplate>
			    <img src="<%# Eval("slika") %>" alt="<%# Eval("avtor") %> <%# Eval("naslov") %>" class="pull-left thumbnail" width="100">
				<p> &nbsp; Leto: <%# Eval("leto") %></p>
				<p> &nbsp; Avtor: <%# Eval("avtor") %></p>
				<p> &nbsp; Naslov: <%# Eval("naslov") %></p>
                <p> &nbsp; Cena: <%# Eval("cena") %>€ (<%# Math.Round(Convert.ToDouble(Eval("cena"))*eurToElse, 2)%><%# c%>)</p>
            </ItemTemplate>
        </asp:Repeater>
        <br>
		<br>
		<a href="Payment.aspx?izdelek=<%= Request.QueryString["izdelek"] %>" class="btn btn-danger">
			Naprej
		</a>
		<br>
		<br>
		<br>
	</div>

</asp:Content>
