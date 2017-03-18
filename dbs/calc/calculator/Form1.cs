using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace calculator
{
    public partial class Form1 : Form
    {

        public string no1, operation;
        public Form1()
        {
            InitializeComponent();
            no1 = "";

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string s = "1";
            no1 = s;
            box1.Text = box1.Text + s;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string s = "2";
            box1.Text = box1.Text+s;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string s = "3";
            box1.Text = box1.Text + s;

        }

        private void button4_Click(object sender, EventArgs e)
        {
            string s = "4";
            box1.Text = box1.Text + s;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string s = "5";
            box1.Text = box1.Text + s;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string s = "6";
            box1.Text = box1.Text + s;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            string s = "7";
            box1.Text = box1.Text + s;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            string s = "8";
            box1.Text = box1.Text + s;
        }

        private void button9_Click(object sender, EventArgs e)
        {
            string s = "9";
            box1.Text = box1.Text + s;
        }

        private void button10_Click(object sender, EventArgs e)
        {
            string s = "0";
            box1.Text = box1.Text + s;
        }

        //operations
      

        private void button12_Click(object sender, EventArgs e)
        {
            string s = "+";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";
            operation = "+";
        }

        private void button13_Click(object sender, EventArgs e)
        {
            string s = "-";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";
            operation = "-";
        }

        private void button14_Click(object sender, EventArgs e)
        {
            string s = "*";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";
            operation = "*";
        }

        private void button15_Click(object sender, EventArgs e)
        {
            string s = "/";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";
            operation = "/";
        }

        private void button16_Click(object sender, EventArgs e)
        {
            string s = "%";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";
            operation = "%";
        }

        private void button18_Click(object sender, EventArgs e)
        {
            string s = ")";
            box1.Text = box1.Text + s;
        }

        private void button19_Click(object sender, EventArgs e)
        {

            box1.Text = " ";
        }


        private void button20_Click(object sender, EventArgs e)
        {
            string s = "cos(";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            operation = "cos";
        }
     

        private void button21_Click(object sender, EventArgs e)
        {

            string s = "sin(";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";

            operation = "sin";
        }
 

        private void button22_Click(object sender, EventArgs e)
        {
            string s = "tan(";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            operation = "tan";
        }


        private void button23_Click(object sender, EventArgs e)
        {
            string s = "sqrt(";
            no1 = box1.Text;
            box1.Text = box1.Text + s;
            box1.Text = "";
            operation = "sqrt";
        }

        public void fun()
        {
            switch (operation)
            {
                case "+":
                    box1.Text = Convert.ToString(Convert.ToInt32(no1)+ Convert.ToInt32(box1.Text));
                    no1 = box1.Text;
                    break;
                case "-":
                    box1.Text = Convert.ToString(Convert.ToInt32(no1) - Convert.ToInt32(box1.Text));
                    no1 = box1.Text;
                    break;
                case "*":
                    box1.Text = Convert.ToString(Convert.ToInt32(no1) * Convert.ToInt32(box1.Text));
                    no1 = box1.Text;
                    break;
                case "/":
                    box1.Text = Convert.ToString(Convert.ToInt32(no1) / Convert.ToInt32(box1.Text));
                    no1 = box1.Text;
                    break;
                case "sin":
                    double res;
                    res = Convert.ToDouble(no1);
                     box1.Text = Convert.ToString( Math.Sin(res));
                     no1 = box1.Text;
                    break;
                case "tan":
                    double res1;
                    res1 = Convert.ToDouble(no1);
                    box1.Text = Convert.ToString(Math.Tan(res1));
                    no1 = box1.Text;
                    break;

                case "cos":
                    double res2;
                    res2 = Convert.ToDouble(no1);
                    box1.Text = Convert.ToString(Math.Cos(res2));
                    no1 = box1.Text;
                    break;
                case "sqrt":
                    double res4;
                    res4 = Convert.ToDouble(no1);
                    box1.Text = Convert.ToString(Math.Pow(res4,0.5));
                    no1 = box1.Text;
                    break;


            }
        }


        private void button11_Click(object sender, EventArgs e)
        {
            string op = box1.Text;
            fun(); //calling of function
            
            //box1.Text = " ";
            
                
        }
    }
}
