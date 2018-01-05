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

    public partial class Clubs : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection("Data Source=KIRAN\\SQLEXPRESS;Initial Catalog=mydatabase;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Bindrow();
            }

        }
        private void Bindrow()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from dbo.Clubs", con);
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

        protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridView.EditIndex = e.NewEditIndex;
            Bindrow();
        }
        protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Club_Id = gridView.DataKeys[e.RowIndex].Values["Club_Id"].ToString();
            TextBox Club_Name = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtname");

            con.Open();
            SqlCommand cmd = new SqlCommand("update dbo.Clubs set Club_Name='" + Club_Name.Text + "'where Club_Id=" + Club_Id, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.BackColor = Color.Blue;
            lblmsg.ForeColor = Color.White;
            lblmsg.Text = Club_Id + "        Updated successfully........    ";
            gridView.EditIndex = -1;
            Bindrow();
        }
        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridView.EditIndex = -1;
            Bindrow();
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
             String club_Id = gridView.DataKeys[e.RowIndex].Values["Club_Id"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from dbo.Clubs where Club_Id=" + club_Id, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                Bindrow();
                lblmsg.BackColor = Color.Red;
                lblmsg.ForeColor = Color.White;
                lblmsg.Text = club_Id + "      Deleted successfully.......    ";
            }
        }
        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Club_Id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Club_Id"));
                Button lnkbtnresult = (Button)e.Row.FindControl("ButtonDelete");
                if (lnkbtnresult != null)
                {
                    lnkbtnresult.Attributes.Add("onclick", "javascript:return deleteConfirm('" + Club_Id + "')");
                }
            }
        }
        protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                //TextBox instorid = (TextBox)gridView.FooterRow.FindControl("instorid");
                TextBox inname = ((TextBox)gridView.FooterRow.FindControl("inname"));
                string a = inname.Text.ToString().ToUpper();
                
                con.Open();
               

                SqlCommand cmd =
                    new SqlCommand(
                        "insert into dbo.Clubs(Club_Name) values('" + a + "')", con);
                try
                {
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result == 1)
                    {

                        Bindrow();
                        lblmsg.BackColor = Color.Green;
                        lblmsg.ForeColor = Color.White;
                        lblmsg.Text = "      Added successfully......    ";
                    }
                    else
                    {
                        lblmsg.BackColor = Color.Red;
                        lblmsg.ForeColor = Color.White;
                        lblmsg.Text = " Error while adding row.....";
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.BackColor = Color.Red;
                    lblmsg.ForeColor = Color.White;
                    lblmsg.Text = " same name club is added aready.....";
                }
            }

        }

        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}