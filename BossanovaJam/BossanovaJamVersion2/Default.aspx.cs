using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Collections;

namespace BossanovaJamVersion2
{
    public partial class _Default : Page
    {
        const string bazaConnString = "server=mysql.lrk.si;uid=at1614;pwd=sp;Persist Security Info=True;database=at1614_b3";
        public MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    bazaPovezava.Open();
                    MySqlCommand bazaUkaz = new MySqlCommand("SELECT DISTINCT leto FROM Izdelek", bazaPovezava);
                    MySqlDataReader reader = bazaUkaz.ExecuteReader();
                    leto.DataSource = reader;
                    leto.DataBind();
                    bazaPovezava.Close();

                    bazaPovezava.Open();
                    MySqlCommand avtorjiUkaz = new MySqlCommand("SELECT DISTINCT avtor FROM Izdelek", bazaPovezava);
                    avtor.DataSource = avtorjiUkaz.ExecuteReader();
                    avtor.DataBind();
                    bazaPovezava.Close();
                }

                bazaPovezava.Open();
                String izdelkiUkaz = "SELECT * FROM Izdelek";
                ArrayList filters = new ArrayList();
                if (leto.SelectedIndex > 0) filters.Add("leto = '" + leto.SelectedValue + "'");
                if (avtor.SelectedIndex > 0) filters.Add("avtor = '" + avtor.SelectedValue + "'");
                if (filters.Count > 0) izdelkiUkaz += " WHERE " + String.Join(" AND ", (string[])filters.ToArray(typeof(string)));
                izdelki.DataSource = new MySqlCommand(izdelkiUkaz, bazaPovezava).ExecuteReader();
                izdelki.DataBind();
                bazaPovezava.Close();
            }
            catch (Exception ex)
            {
                bazaPovezava.Close();
                Response.Write("Prišlo je do napake pri branju baze." + ex.StackTrace);
            }
        }

    }
}