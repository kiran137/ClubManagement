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
    public partial class EventEntries : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT [Event_Name] FROM [Event1];"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    eventsearch.DataTextField = ds.Tables[0].Columns["Event_Name"].ToString();
                    eventsearch.DataSource = ds.Tables[0];
                    eventsearch.DataBind();

                    conn.Close();
                }
            }
           eventsearch.Items.Insert(0, new ListItem("Select Event NAME", "0"));

        }
       protected void eventsearch_SelectedIndexChanged(object sender,EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.Enteries Where Event_Name='"+eventsearch.SelectedValue+"'", con);
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
        protected void ExportToExcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                gridView.AllowPaging = false;
               // this.eventsearch_SelectedIndexChanged();

                gridView.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in gridView.HeaderRow.Cells)
                {
                    cell.BackColor = gridView.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in gridView.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gridView.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gridView.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                gridView.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}