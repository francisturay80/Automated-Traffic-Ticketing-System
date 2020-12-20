using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;

namespace RoadTransportOffence.offence
{
    public partial class add_offence : System.Web.UI.Page
    {


        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["Role"]) != "Admin")
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("~/index.aspx");
                return;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {




            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select OffenceCode from offenceList where OffenceCode ='" + offenceCode.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();

            if (sqlReader1.Read())
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Offence with Code " + offenceCode.Text + " Already Exist";
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();


            try
            {


                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_OffenceList", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Insert");

                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                cmd.Parameters.AddWithValue("@OffenceCode", offenceCode.Text);
                cmd.Parameters.AddWithValue("@OffenceTitle", offenceTitle.Text);
                cmd.ExecuteNonQuery();
                cn.Close();



                lblMsg.Text = "Thanks! Offence Added Successfully";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("~/offence/manage-offence.aspx");



            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }

        }

    }
}
