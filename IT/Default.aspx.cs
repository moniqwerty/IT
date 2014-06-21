using Sudoku;
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
            int xi = 0, yi = 0, xj = 0, yj = 0;
            if ((i >= 0) && (i <= 2))
            {
                xi = 0;
                yi = 2;
            }
            else if ((i >= 3) && (i <= 5))
            {
                xi = 3;
                yi = 5;
            }
            else if ((i >= 6) && (i <= 8))
            {
                xi = 6;
                yi = 8;
            }
            if ((j >= 0) && (j <= 2))
            {
                xj = 0;
                yj = 2;
            }
            else if ((j >= 3) && (j <= 5))
            {
                xj = 3;
                yj = 5;
            }
            else if ((j >= 6) && (j <= 8))
            {
                xj = 6;
                yj = 8;
            }

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
            TableCell td;
            TableCell last;
            Label lbl = (Label)FindControl(Request["__EVENTARGUMENT"]);
            if (ViewState["lastClicked"] != null)
            {
                lastClicked = (Label)FindControl((string)ViewState["lastClicked"]);
                last = (TableCell)lastClicked.Parent;
                last.BackColor = Color.Transparent;
                //lastClicked.BackColor = Color.White;
            }
            ViewState["lastClicked"] = lbl.ID;
            td = (TableCell)lbl.Parent;
            td.BackColor = Color.Beige;
            //  lbl.BackColor = Color.Yellow;
        }
        protected void keyPress(object sender, EventArgs e)
        {

            if (ViewState["lastClicked"] != null)
            {
                lastClicked = (Label)FindControl((string)ViewState["lastClicked"]);
                
                Grid game = (Grid)ViewState["game"];
                if (game.firstGenerated.Contains(int.Parse(((string)ViewState["lastClicked"]).Substring(5))-1))
                {
                    return;
                }

                lastClicked.Text = (Int32.Parse(Request["__EVENTARGUMENT"]) - 48).ToString();
                //int index = Int32.Parse(ViewState["lastClicked"].ToString().Substring(5));
                CheckAll();
                if (GameFinished())
                {
                    Response.Write("<SCRIPT>alert('Game finished')</SCRIPT>");

                }
            }

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
    }
}