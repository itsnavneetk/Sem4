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

namespace driverUI
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
        public Form1()
        {
            InitializeComponent();
        }

        public void connect1()
        {
            String oradb ="Data Source=ictorcl;User ID=it1226;Password=student;";
            conn = new OracleConnection(oradb);
            conn.Open();
        }
        private void button3_Click(object sender, EventArgs e)
        {
            connect1();
            comm = new OracleCommand();
            comm.CommandText = "select * from person226";
            comm.CommandType = CommandType.Text;
            ds = new DataSet();
            da = new OracleDataAdapter(comm.CommandText, conn);
            da.Fill(ds, "person226");
            dt = ds.Tables["person226"];
            int t = dt.Rows.Count;
            MessageBox.Show(t.ToString());

            dr = dt.Rows[i];
            textBox1.Text = dr["driver_id"].ToString();
            textBox2.Text = dr["name"].ToString();
            textBox3.Text = dr["address"].ToString();
            conn.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            i++;
            if (i >= dt.Rows.Count)
                i = 0;
            dr = dt.Rows[i];
            textBox1.Text = dr["driver_id"].ToString();
            textBox2.Text = dr["name"].ToString();
            textBox3.Text = dr["address"].ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            i--;
            if (i<0)
            i = dt.Rows.Count-1;
            dr = dt.Rows[i];
            textBox1.Text = dr["driver_id"].ToString();
            textBox2.Text = dr["name"].ToString();
            textBox3.Text = dr["address"].ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            connect1();
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            cm.CommandText = "insert into person226 values('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "')";
            cm.CommandType = CommandType.Text;
            cm.ExecuteNonQuery();
            MessageBox.Show("INSERTED!!");
            conn.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            connect1();
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            cm.CommandText = "delete from person226 where driver_id ='" + textBox1.Text + "'";
            cm.CommandType = CommandType.Text;
            cm.ExecuteNonQuery();
            MessageBox.Show("Deleted!!");
            conn.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            connect1();
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            cm.CommandText = "udpate person226 set name='"+textBox2.Text+"' where driver_id ='" + textBox1.Text + "'";
            cm.CommandType = CommandType.Text;
            cm.ExecuteNonQuery();
            MessageBox.Show("Updated!!");
            conn.Close();
        }
    }
}
