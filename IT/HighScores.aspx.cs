using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace IT
{
    public partial class HighScores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int diff = 0;
            if (Request.QueryString["diff"] != null)
            {
                diff = int.Parse(Request.QueryString["diff"]);
            }
            if (diff == 0 || diff == 3)
            {
                btnEasy_Click(null, null);
            }
            if (diff == 2)
            {
                btnMedium_Click(null, null);
            }
            if (diff == 3)
            {
                btnHard_Click(null, null);
            }

        }

        protected void btnEasy_Click(object sender, EventArgs e)
        {

            string connectionstring = WebConfigurationManager.ConnectionStrings["Sudoku"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);

            string statement = "SELECT ID, Username, Highscore FROM EasyHighScores";
            SqlCommand cmd = new SqlCommand(statement, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "EasyHighScores");

            gvHighScores.DataSource = ds;
            gvHighScores.DataBind();

            gvHighScores.Visible = true;
        }

        protected void btnMedium_Click(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["Sudoku"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);

            string statement = "SELECT ID, Username, Highscore FROM MediumHighScores";
            SqlCommand cmd = new SqlCommand(statement, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "MediumHighScores");

            gvHighScores.DataSource = ds;
            gvHighScores.DataBind();

            gvHighScores.Visible = true;
        }

        protected void btnHard_Click(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["Sudoku"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);

            string statement = "SELECT ID, Username, Highscore FROM HardHighScores";
            SqlCommand cmd = new SqlCommand(statement, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "HardHighScores");

            gvHighScores.DataSource = ds;
            gvHighScores.DataBind();

            gvHighScores.Visible = true;
        }
    }
}