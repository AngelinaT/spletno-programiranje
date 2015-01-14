using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BossanovaJamVersion2
{
    public partial class Payment : _Default
    {
        protected String naslov, avtor, cena, leto;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String idIzdelka = Request.QueryString["izdelek"];
                if (idIzdelka != null)
                {
                    try
                    {
                        bazaPovezava.Open();
                        MySqlCommand iz = new MySqlCommand("SELECT * FROM Izdelek WHERE id_izdelek = " + idIzdelka, bazaPovezava);
                        MySqlDataReader r = iz.ExecuteReader();
                        while (r.Read())
                        {
                            naslov = r["naslov"].ToString();
                            avtor = r["avtor"].ToString();
                            cena = r["cena"].ToString();
                            leto = r["leto"].ToString();
                        }
                        bazaPovezava.Close();
                    }
                    catch (Exception ex)
                    {
                        bazaPovezava.Close();
                        Response.Write("Prišlo je do napake pri branju baze." + ex.StackTrace);
                    }
                }
                else
                {
                    Response.Redirect("/");
                }
            }
            else
            {
                bazaPovezava.Open();
                MySqlCommand iz = new MySqlCommand("INSERT INTO Narocila (ime, priimek, email, naslov, postna_stevilka, mesto, nacini_placila, komentar, je_poslano, avtor, naslovIz, leto, cena) VALUES (@ime, @priimek, @email, @naslov, @postna_stevilka, @mesto, @nacini_placila, @komentar, 0, @avtor, @naslovIz, @leto, @cena)", bazaPovezava);
                iz.Parameters.Add("@ime", Request.Form["ime"]);
                iz.Parameters.Add("@priimek", Request.Form["priimek"]);
                iz.Parameters.Add("@email", Request.Form["email"]);
                iz.Parameters.Add("@naslov", Request.Form["naslov"]);
                iz.Parameters.Add("@postna_stevilka", Request.Form["postna_stevilka"]);
                iz.Parameters.Add("@mesto", Request.Form["mesto"]);
                iz.Parameters.Add("@nacini_placila", Request.Form["nacini_placila"]);
                iz.Parameters.Add("@komentar", Request.Form["komentar"]);

                iz.Parameters.Add("@avtor", Request.Form["avtor"]);
                iz.Parameters.Add("@leto", Request.Form["leto"]);
                iz.Parameters.Add("@cena", Request.Form["cena"]);
                iz.Parameters.Add("@naslovIz", Request.Form["naslovIz"]);

                iz.ExecuteNonQuery();
                bazaPovezava.Close();

                Response.Redirect("/");
            }
        }
    }
}