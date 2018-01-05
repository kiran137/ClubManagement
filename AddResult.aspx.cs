using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.IO;
using System.Web.Security;


namespace cseclubs
{
    public partial class AddResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                bindrow();
                

            }
        }
        public void bindrow()
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
                    DropDownList1.DataTextField = ds.Tables[0].Columns["Event_Name"].ToString();
                    DropDownList1.DataSource = ds.Tables[0];
                    DropDownList1.DataBind();

                    conn.Close();
                }
            }
            DropDownList1.Items.Insert(0, new ListItem("Select Event NAME", "0"));

        }
      
        [WebMethod]
        public static string AddData(string Ename, string cname, string Sid, string SName, string Sbn,string edate)
        {


            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "dbo.InsertResult";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;

                    cmd.Parameters.AddWithValue("@Event_Name", Ename);
                    cmd.Parameters.AddWithValue("@Club_Name", cname);
                    cmd.Parameters.AddWithValue("@Student_Id", Sid);
                    
                    cmd.Parameters.AddWithValue("@Student_Name", SName);
                    
                    cmd.Parameters.AddWithValue("@Student_Branch", Sbn);
                    cmd.Parameters.AddWithValue("@fDate", edate);
                   


                    conn.Open();

                   

                    cmd.ExecuteNonQuery();


                }
                conn.Close();

            }
            return "success";

        }



        protected void Button1_Click1(object sender, EventArgs e)
        {

            HttpFileCollection files = Request.Files;
            foreach (string fileTagName in files)
            {
                HttpPostedFile file = Request.Files[fileTagName];
                if (file.ContentLength > 0)
                {

                    int size = file.ContentLength;
                    string name = file.FileName;
                    int position = name.LastIndexOf("\\");
                    name = name.Substring(position + 1);
                    string contentType = file.ContentType;
                    byte[] fileData = new byte[size];
                    file.InputStream.Read(fileData, 0, size);



                }
            }
        }
        protected void eventsearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            string enam = DropDownList1.SelectedValue.ToString();
            if (enam != null)
            {

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    string dr = null;
                    using (SqlCommand cmd = new SqlCommand("SELECT Club_Name from dbo.Event1 WHERE Event_Name = @Event_Name"))
                    {
                        cmd.Parameters.AddWithValue("@Event_Name", enam);
                        cmd.Connection = conn;
                        conn.Open();

                        dr = (string)cmd.ExecuteScalar();
                        conn.Close();
                        ClubsList.Text = dr.ToString();

                    }
                    dr = null;
                    using (SqlCommand cmd = new SqlCommand("SELECT RegistrationDate from dbo.Event1 WHERE Event_Name = @Event_Name"))
                    {
                        cmd.Parameters.AddWithValue("@Event_Name", enam);
                        cmd.Connection = conn;
                        conn.Open();

                        dr = (string)cmd.ExecuteScalar();
                        conn.Close();
                        datepicker.Text = dr.ToString();

                    }

                }

            }
            else
            {
                ClubsList.Text = null;
            }

        }
    }
}