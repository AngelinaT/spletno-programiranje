<%@ Page Title="Bossanova Jam" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BossanovaJamVersion2._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<div>
    <br>
    <div class="my-search">
        <asp:DropDownList ID="leto" runat="server" AutoPostBack="true" CssClass="form-control my-input" DataValueField="leto" AppendDataBoundItems="True" OnSelectedIndexChanged="filter">
            <asp:ListItem Value="0" Text="-- Leto --"></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="avtor" runat="server" AutoPostBack="true" CssClass="form-control my-input" DataValueField="avtor" AppendDataBoundItems="True" OnSelectedIndexChanged="filter">
            <asp:ListItem Value="0" Text="-- Avtor --"></asp:ListItem>
        </asp:DropDownList>    
    </div>
    <br>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row my-grid">
                <asp:Repeater ID="izdelki" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-4 col-xs-6">
			                <div>
				                <img src="<%# Eval("slika") %>" alt="<%# Eval("avtor") %> <%# Eval("naslov") %>">
				                <div class="description">
                                    <div class="pull-right">
                                        <a href="Kosarica.aspx?izdelek=<%# Eval("id_izdelek") %>" class="buy btn btn-danger btn-sm">
                                            <%# Eval("cena") %>€
							                <i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a>
                                    </div>
					                <p>Leto: <%# Eval("leto") %></p>
					                <p>Avtor: <%# Eval("avtor") %></p>
					                <p>Naslov: <%# Eval("naslov") %></p>
				                </div>
			                </div>
		                </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="leto"/>
            <asp:AsyncPostBackTrigger ControlID="avtor"/>
        </Triggers>
    </asp:UpdatePanel>
    
</div>
</asp:Content>
