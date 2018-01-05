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
    public partial class UserEvents : System.Web.UI.Page
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
        private void bindrows()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Event_Name,Club_Name,fDate from dbo.Event1", con);
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
               
            }
        }

    }
}