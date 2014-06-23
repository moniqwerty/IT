using Sudoku;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            int score = (int)Session["score"];
            int diff = int.Parse(Request.QueryString["diff"]);
            insertIntoDatabase(username,score,diff);
        }
        private void insertIntoDatabase(string username, int score, int difficulty)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["Sudoku"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);

            string table = "";
            Grid game = (Grid)ViewState["game"];
            if (difficulty == 3) //TEST
            {
                table = "EasyHighScores";
            }
            if (difficulty == 0) //SIMPLE
            {
                table = "EasyHighScores";
            }
            if (difficulty == 1) // MEDIUM
            {
                table = "MediumHighScores";
            }
            if (difficulty == 2) //COMPLEX
            {
                table = "HardHighScores";
            }
            string statement = "INSERT INTO " + table + " (Username, Highscore) VALUES ( '" + username + "' , " + score + " )";
            con.Open();
            SqlCommand cmd = new SqlCommand(statement, con);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/HighScores.aspx?diff=" + difficulty);
        }
    }
}