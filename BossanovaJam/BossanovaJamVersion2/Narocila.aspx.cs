using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BossanovaJamVersion2
{
    public partial class Narocila : _Default
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null)
            {
                Response.Redirect("/");
            }
        }

        protected void narocilaGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("send"))
            {
                int itemIx = narocilaGrid.Rows[Convert.ToInt32(e.CommandArgument)].DataItemIndex;
                Object rowId = narocilaGrid.DataKeys[itemIx]["id_narocila"];
                if(rowId == null) return;
                MySqlCommand bazaUkaz = new MySqlCommand("UPDATE `Narocila` SET `je_poslano` = 1 WHERE `id_narocila` = " + (int)rowId, bazaPovezava);
                bazaPovezava.Open();
                bazaUkaz.ExecuteNonQuery();
                bazaPovezava.Close();
                narocilaGrid.DataBind();
            }
        }
    }
}