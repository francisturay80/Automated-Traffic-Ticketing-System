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

namespace RoadTransportOffence.Vehicle
{
    public partial class register_vehicle : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String t5 = MobileCode.Text;
            String t6 = txtPhone.Text;
            phone.Text = t5 + t6;
            String t7 = txtFname.Text;
            String t8 = txtLName.Text;
            name.Text = t7 + t8;

            if (txtNo.Text.Trim() == "")
            {

                lblMsg.Text = "Please Enter Vehicle No";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtNo.Focus();
                return;

            }

            if (MobileCode.Text.Trim() == "")
            {

                lblMsg.Text = "Mobile Code Required";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                MobileCode.Focus();
                return;

            }

            if (txtPhone.Text.Trim() == "")
            {

                lblMsg.Text = "Please Phone No";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtPhone.Focus();
                return;

            }

            if (address.Text.Trim() == "")
            {

                lblMsg.Text = "Owner Adress Required";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                address.Focus();
                return;

            }


            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select VehicleNumber from Transport where VehicleNumber ='" + txtNo.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();

            if (sqlReader1.Read())
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Vehicle with No " + txtNo.Text + " Already Registered";
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();



            try
            {


                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Transport", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Insert");

                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                //cmd.Parameters.AddWithValue("@ID", txtID.Text);
                cmd.Parameters.AddWithValue("@VehicleNumber", txtNo.Text);
                cmd.Parameters.AddWithValue("@OwnerName", name.Text);
                cmd.Parameters.AddWithValue("@OwnerPhoneNo", phone.Text);
                cmd.Parameters.AddWithValue("@OwnerAddress", address.Text);
                cmd.Parameters.AddWithValue("@VehicleModel", txtModel.Text);
                cmd.Parameters.AddWithValue("@VehicleColor", color.Text);
                cmd.Parameters.AddWithValue("@Capacity", capacity.Text);
                cmd.ExecuteNonQuery();
                cn.Close();



                lblMsg.Text = "Thanks! Vehicle Registered Successfully";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Response.Redirect("~/offence/manage-offence.aspx");



            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }
    }
}