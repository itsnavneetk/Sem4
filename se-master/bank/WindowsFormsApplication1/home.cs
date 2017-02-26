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
   
    public partial class home : Form
    {
        public String bal="10000";
        public home()
        {
            InitializeComponent();
            label2.Text = "admin";
            label5.Text = bal;
            label18.Text = label5.Text;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void home_Load(object sender, EventArgs e)
        {

        }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {
            
        
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

     

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
        
        private void button1_Click(object sender, EventArgs e)
        {
           
            BANK fr = new BANK();
            fr.pass = textBox1.Text;
            
            fr.Show();

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            transfer frm = new transfer();

            //this.Close();
            frm.Show();
        }
    }
}
