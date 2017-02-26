using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class BANK : Form
    {
        public String pass;
        public String user;
        public BANK()
        {
            InitializeComponent();
            pass = "pass";
            user = "admin";
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
           
            if (textBox1.Text == user && textBox2.Text == pass)
            {
                home frm = new home();
                
               //this.Close();
                frm.Show();
            }
            else
            {
                MessageBox.Show("Try again");
            }
        }
    }
}
