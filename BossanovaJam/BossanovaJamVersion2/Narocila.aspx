<%@ Page Title="Naročila" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Narocila.aspx.cs" Inherits="BossanovaJamVersion2.Narocila" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br>
        <asp:GridView ID="narocilaGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="id_narocila" DataSourceID="SqlDataSource1" OnRowCommand="narocilaGrid_RowCommand" CssClass="table" BorderColor="#eeeeee" EnableSortingAndPagingCallbacks="True" AllowSorting="True" RowStyle-VerticalAlign="Middle" RowStyle-CssClass="table-bordered">
            <Columns>
                <asp:BoundField DataField="id_narocila" HeaderText="id_narocila" InsertVisible="False" ReadOnly="True" SortExpression="id_narocila" Visible="False" />
                <asp:BoundField DataField="ime" HeaderText="Ime" SortExpression="ime" />
                <asp:BoundField DataField="priimek" HeaderText="Priimek" SortExpression="priimek" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="naslov" HeaderText="Naslov" SortExpression="naslov" />
                <asp:BoundField DataField="postna_stevilka" HeaderText="Pošta" SortExpression="postna_stevilka" />
                <asp:BoundField DataField="mesto" HeaderText="Mesto" SortExpression="mesto" />
                <asp:BoundField DataField="nacini_placila" HeaderText="Plačilo" SortExpression="nacini_placila" />
                <asp:BoundField DataField="naslovIz" HeaderText="Izdelek" SortExpression="naslovIz" />
                <asp:BoundField DataField="avtor" HeaderText="Avtor" SortExpression="avtor" />
                <asp:BoundField DataField="leto" HeaderText="Leto" SortExpression="leto" />
                <asp:BoundField DataField="cena" HeaderText="Cena" SortExpression="cena" DataFormatString="{0:c}€" />
                <asp:BoundField DataField="komentar" HeaderText="Komentar" SortExpression="komentar" />
                <asp:ButtonField ButtonType="Button" CommandName="send" Text="Pošlji" ControlStyle-CssClass="btn btn-default" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:at1614_b3ConnectionString %>" ProviderName="<%$ ConnectionStrings:at1614_b3ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM Narocila WHERE (je_poslano = 0)"></asp:SqlDataSource>
        <br>
    </div>
</asp:Content>
