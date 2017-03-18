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
    public partial class transfer : Form
    {
        public transfer()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String res;
            home tr = new home();
            int a,b,c=0;
           
            a=Convert.ToInt32(tr.bal);
            b=Convert.ToInt32(textBox2.Text);
            c = a - b;
            res = c + " ";
            
            MessageBox.Show("success!"+"\n"+"account no. "+textBox1.Text+"\n amount:"+textBox2.Text+"\n Current balance :"+res);
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
