using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BossanovaJamVersion2.Account
{
    public partial class Login : _Default
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
            }
            
        }

        protected void validacija(object sender, ServerValidateEventArgs args)
        {
            bazaPovezava.Open();

            MySqlCommand primerjajPodatke = new MySqlCommand("SELECT uporabnisko_ime, geslo FROM Uporabnik WHERE uporabnisko_ime = @user", bazaPovezava);
            primerjajPodatke.Parameters.Add("@user", user.Text);
            //Dekriptiraj geslo - trenutno ni zakriptirano
            MySqlDataReader reader = primerjajPodatke.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                if (PasswordHash.PasswordHash.ValidatePassword(pass.Text, reader["geslo"].ToString()))
                {
                    Response.Write("Prijava je uspešna.");
                    args.IsValid = true;
                    Session["loggedIn"] = true;
                    Response.Redirect("/Narocila.aspx");
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }
               
            bazaPovezava.Close();
            
        }
    }
}