<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BossanovaJamVersion2.Account.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <br>
    <br>
    <form>
        <div>
            <div class="row">
			    <div class="col-md-4 col-sm-6">
				    <label>Uporabniško ime:</label>                   
                    <asp:TextBox AutoCompleteType="Enabled" ID="user" runat="server" CssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="u_ime" ControlToValidate="user" Text="Vnos je obvezen!" runat="server" />
                </div>
		    </div>
		    <div class="row">
			    <div class="col-md-4 col-sm-6">
				    <label>Geslo:</label>
                    <asp:TextBox AutoCompleteType="Enabled" ID="pass" runat="server" TextMode="password" CssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="geslo" ControlToValidate="pass" Text="Vnos je obvezen!" runat="server" />
			    </div>
		    </div>
        </div>
		<div class="row">
			<div class="col-md-4 col-sm-6">
                <asp:Button ID="prijava" Text="Prijavi se" CssClass="btn btn-danger" runat="server"/>
                <asp:CustomValidator ControlToValidate="pass" onServerValidate="validacija" Text="Vneseni podatki so napačni." runat="server" />
			</div>
		</div>
        <br>
        <br>
	</form>
</asp:Content>
