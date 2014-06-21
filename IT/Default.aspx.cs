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

        public TextBox textBox1;

        public int time { get; set; }

        public List<Label> labels;

        public Label lastClicked;

        protected void Page_Load(object sender, EventArgs e)
        {
            

                if (!IsPostBack)
                {
                    game = new Grid(1);

                    textBox1 = new TextBox();

                    //textBox1.TextChanged += new EventHandler(textBox1_TextChanged);
                    textBox1.Style["text-align"] = "center";
                    textBox1.Visible = false;
                    textBox1.BorderStyle = BorderStyle.None;
                    this.Controls.Add(textBox1);

                    labels = new List<Label>();

                    for (int i = 1; i < 82; i++)
                    {
                        labels.Add((Label)FindControl("Label" + i));

                    }
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
                                //  Label l = (Label)FindControl("Label" + k);
                                labels[k].Text = Convert.ToString(game.values[k]);
                                game.firstGenerated.Add(k);
                            }
                            k++;
                        }

                    }

                }
        }
        private bool GameFinished()
        {
            bool finished = true;
            for (int i = 0; i < 81; i++)
            {
               // Label l = (Label)FindControl("Label" + i);
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
           
            Label lbl = (Label)FindControl(Request["__EVENTARGUMENT"]);
            if (ViewState["lastClicked"] != null)
            {
                lastClicked = (Label)FindControl((string)ViewState["lastClicked"]);
                lastClicked.BackColor = Color.White;
            }
            ViewState["lastClicked"] = lbl.ID;
            lbl.BackColor = Color.Yellow;
        }
        protected void keyPress(object sender, EventArgs e)
        {

            if (ViewState["lastClicked"] != null)
            {
                lastClicked = (Label)FindControl((string)ViewState["lastClicked"]);
                lastClicked.Text = (Int32.Parse(Request["__EVENTARGUMENT"])-48).ToString();
            }
            
        }


    }
}