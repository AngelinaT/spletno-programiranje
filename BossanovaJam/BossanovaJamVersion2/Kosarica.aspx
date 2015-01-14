<%@ Page Title="Košarica" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kosarica.aspx.cs" Inherits="BossanovaJamVersion2.Kosarica" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <div>
		<h4>Vsebina košarice</h4>
		<hr>
        <asp:Repeater ID="izdelki" runat="server">
            <ItemTemplate>
			    
			    <img src="<%# Eval("slika") %>" alt="<%# Eval("avtor") %> <%# Eval("naslov") %>" class="pull-left thumbnail" width="100">
				<p> &nbsp; Leto: <%# Eval("leto") %></p>
				<p> &nbsp; Avtor: <%# Eval("avtor") %></p>
				<p> &nbsp; Naslov: <%# Eval("naslov") %></p>
                <p> &nbsp; Cena: <%# Eval("cena") %>€</p>
			    
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
