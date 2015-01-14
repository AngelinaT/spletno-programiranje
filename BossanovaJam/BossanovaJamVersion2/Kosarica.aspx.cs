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
        protected void Page_Load(object sender, EventArgs e)
        {
            String idIzdelka = Request.QueryString["izdelek"];
            if (idIzdelka != null)
            {
                bazaPovezava.Open();
                MySqlCommand iz = new MySqlCommand("SELECT * FROM Izdelek WHERE id_izdelek = " + idIzdelka, bazaPovezava);
                izdelki.DataSource = iz.ExecuteReader();
                izdelki.DataBind();
                bazaPovezava.Close();
            }
        }

        
    }
}