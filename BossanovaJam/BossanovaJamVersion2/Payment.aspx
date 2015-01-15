<%@ Page Title="Plačilo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="BossanovaJamVersion2.Payment" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form method="POST" action="Payment.aspx" autocomplete="on" class="row">
        <div class="col-sm-4 col-sm-offset-2">
            <fieldset>
                <legend>Oseba:</legend>
                <label hidden>Ime:</label>
                <input type="text" name="ime" placeholder="Ime" class="form-control" autofocus="autofocus" required />
                <br>
                <label hidden>Priimek:</label>
                <input type="text" name="priimek" placeholder="Priimek" class="form-control" required />
                <br>
                <div class="input-group">
                    <span class="input-group-addon">@</span>
                    <asp:TextBox id="email" runat="server" CssClass="form-control" />
                </div>
                <asp:RegularExpressionValidator ID="EmailVal" runat="server" ControlToValidate="email" ErrorMessage="Vnesi pravilen email naslov" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/>
                <br>
            </fieldset>
        </div>
        <div class="col-sm-4">
            <fieldset>
                <legend>Naslov:</legend>
                <label hidden>Ulica in hišna številka:</label>
                <input type="text" name="naslov" placeholder="Ulica in hišna številka" class="form-control" required />
                <br>
                <div>
                    <label hidden>Poštna številka:</label>
                    <input type="number" name="postna_stevilka" min="1000" max="9999" placeholder="Poštna številka" class="form-control" required />
                </div>
                <br>
                <label hidden>Mesto:</label>
                <input type="text" name="mesto" placeholder="Mesto" class="form-control" required />
                <br>
            </fieldset>
        </div>
        <div class="col-sm-6 col-sm-offset-3">
            <fieldset>
                <legend>Plačilo:</legend>
                <select name="nacini_placila" class="form-control">
                    <option value="upn">Univerzalni plačilni nalog</option>
                    <option value="kreditna_kartica">Kreditna kartica</option>
                    <option value="ob_prevzemu">Ob prevzemu</option>
                </select>
                <br>
            </fieldset>
            <fieldset>
                <legend>Komentar:</legend>
                <label hidden>Komentar:</label>
                <textarea name="komentar" rows="5" cols="22" placeholder="Vnesite dodatne podatke ali komentar." class="form-control"></textarea>
            </fieldset>
            <br>
            <br>
            <p class="text-center">
                <input type="submit" value="Naprej" class="btn btn-danger" />
            </p>
            <br>
            <br>
        </div>

        <input type="hidden" name="leto" value="<%= leto %>">
        <input type="hidden" name="avtor" value="<%= avtor %>">
        <input type="hidden" name="naslovIz" value="<%= naslov %>">
        <input type="hidden" name="cena" value="<%= cena %>">   
    </form>
</asp:Content>
