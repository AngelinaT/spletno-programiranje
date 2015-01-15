using BossanovaJamVersion2.net.webservicex.www;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BossanovaJamVersion2
{
    public partial class Kosarica : _Default
    {
        protected double eurToElse;
        protected string c;
        protected void Page_Load(object sender, EventArgs e)
        {

            CurrencyConvertor conver = new CurrencyConvertor();            
            switch(valuta.SelectedValue)
            {
                case "0":
                    eurToElse = conver.ConversionRate(Currency.EUR, Currency.USD);
                    c = "$";
                break;
                case "1":
                    eurToElse = conver.ConversionRate(Currency.EUR, Currency.AUD);
                    c = "A$";
                break;
                case "2":
                    eurToElse = conver.ConversionRate(Currency.EUR, Currency.GBP);
                    c = "£";
                break;
                case "3":
                    eurToElse = conver.ConversionRate(Currency.EUR, Currency.JPY);
                    c = "¥";
                break;
                case "4":
                    eurToElse = conver.ConversionRate(Currency.EUR, Currency.SEK);
                    c = "kr";
                break;
                case "5":
                    eurToElse = conver.ConversionRate(Currency.EUR, Currency.USD);
                    c = "$";
                break;
            }
            valuta.DataBind();
            

            String idIzdelka = Request.QueryString["izdelek"];
            if (idIzdelka != null)
            {
                bazaPovezava.Open();
                MySqlCommand iz = new MySqlCommand("SELECT * FROM Izdelek WHERE id_izdelek = " + idIzdelka, bazaPovezava);
                izdelki1.DataSource = iz.ExecuteReader();
                izdelki1.DataBind();
                bazaPovezava.Close();
            }

            
        }

        
    }
}