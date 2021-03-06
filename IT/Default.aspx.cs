﻿using Sudoku;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace IT
{
    public partial class Default : System.Web.UI.Page
    {
        Grid game;

        public int time { get; set; } // TODO

        public List<Label> labels;

        public Label lastClicked;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["time"] == null)
            {
                Session["time"] = 0;
            }
            //insertIntoDatabase("user123", 15, 3);


            //Response.Write("<SCRIPT>alert('Game finished')</SCRIPT>");
            if (ViewState["game"] != null)
            {
                game = (Grid)ViewState["game"];
            }
            labels = new List<Label>();

            for (int i = 1; i < 82; i++)
            {
                Label label = (Label)FindControl("Label" + i);
                //label.EnableViewState = true;
                labels.Add(label);
            }


            // se izvrsuva pri prvo loadiranje. generira novo nivo na sudoku
            if (!IsPostBack)
            {
                new_Easy(null, null);
                ViewState["game"] = game;

            }
        }
        private void empty()
        {
            foreach (Label l in labels)
            {
                l.Text = "";
            }
        }
        private bool GameFinished()
        {
            bool finished = true;
            for (int i = 0; i < 81; i++)
            {
                if (labels[i].Text.Length == 0 || labels[i].ForeColor == Color.Red)
                    finished = false;
            }
            return finished;
        }
        bool isValid(int wat, string el) //
        {
            int i = ((wat - 1) / 9);
            int j = ((wat - 1) % 9);
            //dali e validno vo redica
            for (int k = 0; k < 9; k++)
            {
                if (k == j) continue;
                if (labels[i * 9 + k].Text == el)
                {
                    return false;
                }
            }
            //dali e validno vo kolona
            for (int k = 0; k < 9; k++)
            {
                if (k == i) continue;
                if (labels[k * 9 + j].Text == el)
                {
                    return false;
                }
            }
            int xi = (i / 3) * 3, yi = (xi + 2);
            int xj = (j / 3) * 3, yj = (xj + 2);

            for (int k = xi; k <= yi; k++)
            {
                for (int m = xj; m <= yj; m++)
                {
                    if (k == i) continue;
                    if (m == j) continue;
                    if (labels[k * 9 + m].Text == el)
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        protected void Grid_Click(object sender, EventArgs e)
        {
            updateCell(Request["__EVENTARGUMENT"]);

        }
        public void updateCell(String labelName)
        {
            TableCell td;
            TableCell last;
            Label lbl = (Label)FindControl(labelName);
            if (ViewState["lastClicked"] != null)
            {
                lastClicked = (Label)FindControl((string)ViewState["lastClicked"]);
                last = (TableCell)lastClicked.Parent;
                last.CssClass = "transparent";
                //last.BackColor = Color.Transparent;
                //lastClicked.BackColor = Color.White;
            }
            ViewState["lastClicked"] = lbl.ID;
            td = (TableCell)lbl.Parent;
            td.CssClass = "selected";

            //td.BackColor = Color.Beige;
            //  lbl.BackColor = Color.Yellow;
        }

        public void playMove(int index, int value)
        {
            // na labela so indeks index stava text = value
            // ako value == 0, ja brise sodrzinata na labelata

            lastClicked = (Label)FindControl("Label" + index);
            if (value == 0)
            {
                lastClicked.Text = "";
            }
            else
            {
                lastClicked.Text = value + "";
            }

            CheckAll();
            if (GameFinished())
            {
                //
                // generiranje na random username
                //string username = "user" + new Random().Next(100);
                //
                //
                int score = (int)Session["time"];
                int difficulty = game.gameDiff;
                Session["score"] = score;
                Response.Redirect("~/Register.aspx?diff=" + difficulty);
                //insertIntoDatabase(username, score, difficulty);

                //Response.Write("<SCRIPT>alert('Game finished, Your score is "+ secondsTotal + " !')</SCRIPT>");
            }
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
        protected void keyPress(object sender, EventArgs e)
        {

            if (ViewState["lastClicked"] != null)
            {
                int index = int.Parse(((string)ViewState["lastClicked"]).Substring(5)) - 1;
                Grid game = (Grid)ViewState["game"];
                if (game.firstGenerated.Contains(index))
                {
                    return;
                }

                int value = Int32.Parse(Request["__EVENTARGUMENT"]) - 48;

                playMove(index + 1, value);
                game.addToStack(index + 1, value);
            }

        }


        protected void new_Easy(object sender, EventArgs e)
        {
            empty();
            game = new Grid(3);


            int[,] set = game.game._numberSet;
            int[,] mset = game.game._problemSet;

            int k = 0;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {

                    if (mset[i, j] != 0)
                    {
                        game.values[k] = mset[i, j];

                        labels[k].Text = Convert.ToString(game.values[k]);
                        labels[k].Font.Bold = true;
                        game.firstGenerated.Add(k);
                    }
                    k++;
                }

            }
            ViewState["game"] = game;
            Session["time"] = 0;
            lblTezina.Text = "EASY";
        }
        protected void new_Medium(object sender, EventArgs e)
        {
            empty();
            game = new Grid(1);


            int[,] set = game.game._numberSet;
            int[,] mset = game.game._problemSet;

            int k = 0;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {

                    if (mset[i, j] != 0)
                    {
                        game.values[k] = mset[i, j];

                        labels[k].Text = Convert.ToString(game.values[k]);
                        labels[k].Font.Bold = true;
                        game.firstGenerated.Add(k);
                    }
                    k++;
                }

            }
            ViewState["game"] = game;
            Session["time"] = 0;
            lblTezina.Text = "MEDIUM";
        }
        protected void new_Hard(object sender, EventArgs e)
        {
            empty();
            game = new Grid(2);


            int[,] set = game.game._numberSet;
            int[,] mset = game.game._problemSet;

            int k = 0;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {

                    if (mset[i, j] != 0)
                    {
                        game.values[k] = mset[i, j];

                        labels[k].Text = Convert.ToString(game.values[k]);
                        labels[k].Font.Bold = true;
                        game.firstGenerated.Add(k);
                    }
                    k++;
                }

            }
            ViewState["game"] = game;
            Session["time"] = 0;
            lblTezina.Text = "HARD";
        }

        public void CheckAll()
        {
            int mom = 1;
            foreach (Label l in labels)
            {
                int n;
                bool isNumeric = int.TryParse(l.Text, out n);
                if (isNumeric)
                {

                    if (isValid(mom, l.Text))
                    {
                        l.ForeColor = Color.Black;

                        if (game.errorList.Contains(mom))
                        {
                            game.errorList.Remove(mom);
                        }
                    }
                    else
                    {
                        if (!game.firstGenerated.Contains(mom - 1))
                            l.ForeColor = Color.Red;
                        if (!game.errorList.Contains(mom))
                        {
                            game.errorList.Add(mom);
                        }
                    }
                }
                mom++;
            }
        }

        protected void btnUndo_Click(object sender, EventArgs e)
        {
            GameItem item = game.undo();
            if (item == null) return;
            playMove(item.index, 0);
        }

        protected void btnRedo_Click(object sender, EventArgs e)
        {
            GameItem item = game.redo();
            if (item == null) return;
            playMove(item.index, item.value);
        }

        protected void keyDown(object sender, EventArgs e)
        {
            int keyCode = int.Parse(Request["__EVENTARGUMENT"]);
            int index = int.Parse(((string)ViewState["lastClicked"]).Substring(5));
            int nextindex = -1;
            switch (keyCode)
            {
                case 37:
                    nextindex = index - 1;
                    break;
                case 38:
                    nextindex = index - 9;
                    break;
                case 39:
                    nextindex = index + 1;
                    break;
                case 40:
                    nextindex = index + 9;
                    break;
            }
            if (nextindex < 1 || nextindex > 81) return;
            updateCell("Label" + nextindex);
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int t = (int)Session["time"] + 1;
            Session["time"] = t;
            int h = t / 3600;
            int m = t % 3600 / 60;
            int s = t % 60;
            hours.Text = (h > 9 ? h + "" : "0" + h);
            minutes.Text = (m > 9 ? m + "" : "0" + m);
            seconds.Text = (s > 9 ? s + "" : "0" + s);
        }

        protected void btnHint_Click(object sender, EventArgs e)
        {
            Grid game = (Grid)ViewState["game"];

            while (true)
            {
                GameItem item = game.getHint();
                int position = item.index;
                int value = item.value;

                Label label = (Label)FindControl("Label" + position);

                if (label.Text.Length == 0)
                {
                    playMove(position, value);
                    game.addToStack(position, value);
                }
                else
                {
                    int currentValue = int.Parse(label.Text);
                    if (currentValue == value)
                    {
                        continue;
                    }
                    playMove(position, value);
                    game.addToStack(position, value);

                }
                label.ForeColor = Color.Red;
                break;
            }
            game.decreaseHints();
            btnHint.Text = "Hint " + game.numberOfHints;

            if (game.numberOfHints == 0)
            {
                btnHint.Enabled = false;
                btnHint.ForeColor = Color.Gray;
                btnHint.Text = "No hints";
            }

        }

        protected void btnHighScores_Click(object sender, EventArgs e)
        {
            int difficulty = game.gameDiff;
            Response.Redirect("~/HighScores.aspx?diff=" + difficulty);
        }
    }
}