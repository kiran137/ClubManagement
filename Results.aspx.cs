using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
namespace cseclubs
{
    public partial class Results : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection("Data Source=KIRAN\\SQLEXPRESS;Initial Catalog=mydatabase;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRow();
            }
        }
        protected void BindRow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.Results ", con);
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
        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridView.EditIndex = -1;
            BindRow();
        }
        protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridView.EditIndex = e.NewEditIndex;
            BindRow();
        }
        protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Result_Id = gridView.DataKeys[e.RowIndex].Values["Result_Id"].ToString();
            //TextBox Event_Name = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtc");
             //DropDownList Club_Name = (DropDownList)gridView.Rows[e.RowIndex].FindControl("DropDown");
            TextBox Student_Id = (TextBox)gridView.Rows[e.RowIndex].FindControl("txts");
            TextBox Student_Name = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtn");
            TextBox Student_Branch = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtname");
            //TextBox fDate = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtdate");
            con.Open();
            SqlCommand cmd = new SqlCommand("update dbo.Results set Student_Id='" + Student_Id.Text + "',Student_Name='" + Student_Name.Text + "',Student_Branch='" + Student_Branch.Text + "' where Result_id=" + Result_Id, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.BackColor = Color.Blue;
            lblmsg.ForeColor = Color.White;
            lblmsg.Text = Result_Id + "        Updated successfully........    ";
            gridView.EditIndex = -1;
            BindRow();
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string Result_Id = gridView.DataKeys[e.RowIndex].Values["Result_Id"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from dbo.Results where Result_Id=" + Result_Id, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                BindRow();
                lblmsg.BackColor = Color.Red;
                lblmsg.ForeColor = Color.White;
                lblmsg.Text = Result_Id + "      Deleted successfully.......    ";
            }
        }
        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Result_Id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Result_Id"));
                Button lnktnresult = (Button)e.Row.FindControl("ButtonDelete");
                if (lnktnresult != null)
                {
                    lnktnresult.Attributes.Add("onclick", "javascript:return deleteConfirm('" + Result_Id + "')");
                }
            }
        }

        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {






        }
    }
}