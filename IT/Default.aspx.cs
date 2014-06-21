using Sudoku;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT
{
    public partial class Default : System.Web.UI.Page
    {
        Grid game;

        public TextBox textBox1;

        public int time { get; set; }

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
                            Label l = (Label)FindControl("Label" + k);
                            l.Text = Convert.ToString(game.values[k]);
                            game.firstGenerated.Add(k);
                        }
                        k++;
                    }

                }
            }
        }
    }
}