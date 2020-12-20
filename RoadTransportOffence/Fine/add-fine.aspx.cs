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

namespace RoadTransportOffence.Fine
{
    public partial class add_fine : System.Web.UI.Page
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


            if (!IsPostBack)
            {
                string query = "select OffenceTitle,OffenceCode from offenceList";
                BindDropDownList1(OffenceTitle, query, "OffenceTitle", "OffenceTitle", "Select");




            }

        }


        private void BindDropDownList1(DropDownList ddl1, string query1, string text1, string value1, string defaultText1)
        {
            string conString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query1);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    ddl1.DataSource = cmd.ExecuteReader();
                    ddl1.DataTextField = text1;
                    ddl1.DataValueField = value1;
                    ddl1.DataBind();
                    con.Close();
                }
            }
            ddl1.Items.Insert(0, new ListItem(defaultText1, "0"));

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select OffenceTitle from fine where OffenceTitle ='" + OffenceTitle.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();

            if (sqlReader1.Read())
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Fine For Offence " + OffenceTitle.Text + " Already Added";
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();


            if (OffenceTitle.SelectedItem.Text.Trim() == "Select")
            {
                lblMsg.Text = "Select offenc";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                OffenceTitle.Focus();
                return;
            }



            try
            {

                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Fine", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@ActionType", "Insert");
                cmd.Parameters.AddWithValue("@OffenceTitle", OffenceTitle.SelectedValue);
                cmd.Parameters.AddWithValue("@Amount", amount.Text);



                cmd.ExecuteNonQuery();

                con.Close();

                //SMS

                lblMsg.ForeColor = System.Drawing.Color.Green;
             
                amount.Text = "";


                lblMsg.Text = "Thanks! Fine added  Successfully";



            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }

        protected void OffenceTitle_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}