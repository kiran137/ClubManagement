using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace cseclubs
{
    public partial class Results_History : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection("Data Source=KIRAN\\SQLEXPRESS;Initial Catalog=mydatabase;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindrows();
                // BindRow();
            }
        }
        public void bindrows()
        {

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [Club_Name] FROM [Clubs];"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    clubsearch.DataTextField = ds.Tables[0].Columns["Club_Name"].ToString();
                    clubsearch.DataSource = ds.Tables[0];
                    clubsearch.DataBind();

                    conn.Close();
                }
            }
            clubsearch.Items.Insert(0, new ListItem("Select Club NAME", "0"));

        }
        protected void clubsearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.Result_Audit Where Club_Name='" + clubsearch.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gridView.DataSource = ds;
                gridView.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gridView.DataSource = ds;
                gridView.DataBind();
                int columncount = gridView.Rows[0].Cells.Count;
                lblmsg.Text = " No data found !!!";
            }
        }
    }
}