using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace IT
{
    public partial class HighScores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEasy_Click(object sender, EventArgs e)
        {
            gvHighScores.DataSourceID = "sourceEasyHighScores";
            gvHighScores.DataBind();
        }

        protected void btnMedium_Click(object sender, EventArgs e)
        {
            gvHighScores.DataSourceID = "sourceMediumHighScores";
            gvHighScores.DataBind();
        }

        protected void btnHard_Click(object sender, EventArgs e)
        {
            gvHighScores.DataSourceID = "sourceHardHighScores";
            gvHighScores.DataBind();
        }
    }
}