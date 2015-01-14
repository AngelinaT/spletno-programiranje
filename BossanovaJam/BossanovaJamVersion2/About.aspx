<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BossanovaJamVersion2.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h4>O nas</h4>
	<hr>
	<p>
		Če vas zanima jazz, ampak se vam zdi, da je klasični premalo 
		dinamičen, ste na pravem mestu. Tu boste našli bossa nova ritme,
		ustvarjene s strani najbolj znanih glasbenikov na tem področju.
		Primerna je za vsako vzdušje: sproščeno popoldne ali majhno zabavo 
		s prijatelji.
		<br>
		<em>Bossanova jam</em> ponuja izbiro in spletni nakup zgoščenk 
		in vinilk. Poleg pošiljanja, dostavljamo tudi na dom.
		<br>
		Poštnina je vključena v ceni.
	</p>
	<p>	
		Za dodatne informacije ali težave z naročili, pokličite na:
		099/123-456 ali izpolnite spodnji obrazec.
	</p>

	<br>
	<h4>Kontakt</h4>

	<form>
		<div class="row">
			<p class="col-md-6 col-sm-8">
				<label hidden>E-mail:</label>
				<input type = "email" name = "email" placeholder="email@domena.com" class="form-control">
				<br>
				<label hidden>Komentar:</label>
				<textarea name="komentarji" class="form-control" rows="10" placeholder="Prostor za pripombe, pritožbe, komentarje..."></textarea>
				<br>
				<input type="submit" value="Oddaj komentar" class="btn btn-default">
			</p>
		</div>
	</form>
	<br>
	<br>
</asp:Content>