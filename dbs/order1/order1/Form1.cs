using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace order1
{
    public partial class Form1 : Form
    {
        OracleConnection conn;
        OracleCommand comm;
        OracleDataAdapter da;
        DataSet ds;
        DataTable dt;
        DataRow dr;
        int i = 0;
        String itemID = null;

        public Form1()
        {    
            InitializeComponent();
        }
        public void connect1()
        {
            String oradb = "Data Source=ictorcl;User ID=it1226;Password=student;";
            conn = new OracleConnection(oradb);
            conn.Open();

        }
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            i++;
            if (i >= dt.Rows.Count)
                i = 0;
            dr = dt.Rows[i];
            textBox2.Text = dr["order1"].ToString();
            textBox3.Text = dr["qty"].ToString();
            textBox4.Text = dr["ordamnt"].ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            i--;
            if (i < 0)
                i = dt.Rows.Count - 1;
            dr = dt.Rows[i];
            textBox2.Text = dr["order1"].ToString();
            textBox3.Text = dr["qty"].ToString();
            textBox4.Text = dr["ordamnt"].ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            connect1();
            comm = new OracleCommand();
            comm.CommandText = "select order1, qty, ordamnt from orders1226 join order_items1226 using(order1) where order_items1226.item ="+comboBox1.Text+" and extract (month from orders1226.odate) ="+textBox1.Text+"";
            comm.CommandType = CommandType.Text;
            ds = new DataSet();
            da = new OracleDataAdapter(comm.CommandText, conn);
            da.Fill(ds, "orders1226");
            dt = ds.Tables["orders1226"];
            int t = dt.Rows.Count;
            MessageBox.Show(t.ToString());

            dr = dt.Rows[i];
            textBox2.Text = dr["order1"].ToString();
            textBox3.Text = dr["qty"].ToString();
            textBox4.Text = dr["ordamnt"].ToString();
            conn.Close();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
        
        }
    }
}
