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
    public partial class WebForm4 : System.Web.UI.Page
    {
        public byte[] data { get; set; }
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
                using (SqlCommand cmd = new SqlCommand("SELECT [Club_Name] FROM [Clubs];"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    ClubsList.DataTextField = ds.Tables[0].Columns["Club_Name"].ToString();
                    ClubsList.DataSource = ds.Tables[0];
                    ClubsList.DataBind();

                    conn.Close();
                }
            }
           ClubsList.Items.Insert(0, new ListItem("Select CLUB NAME", "0"));

        }

      
        [WebMethod]
        public static string AddData(string ename, string cname, string edate, string rdate)
        {


            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "dbo.InsertEvent";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;

                    cmd.Parameters.AddWithValue("@Event_Name", ename);
                    cmd.Parameters.AddWithValue("@Club_Name", cname);
                    cmd.Parameters.AddWithValue("@fDate", edate);
                    cmd.Parameters.AddWithValue("@RegistrationDate", rdate);
                  
                   
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
       


    }
}