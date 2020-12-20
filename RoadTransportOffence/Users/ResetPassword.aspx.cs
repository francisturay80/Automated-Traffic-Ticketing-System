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

namespace RoadTransportOffence.Users
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;

        public string Encrypt(string str)
        {
            byte[] encrt_byte = new byte[str.Length];
            encrt_byte = UTF8Encoding.UTF8.GetBytes(str);
            String s = Convert.ToBase64String(encrt_byte);
            return s;
        }
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

            Event.Text = "Reset Users Password Username " + txtUsername.Text + "";
        }

        protected void BtnResetPass_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "" || txtPassword.Text == "")
            {
                //lblMsg.Text = "Please Enter Your Login Details.";
               lblMsg.Text = "Please Please Enter Login Details.";
                return;
            }
            if (txtPassword.Text.ToString() != txtComfirmPassword.Text.ToString())
            {
                //lblMsg.Text = "Password does not match";
                //lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Password does not match";
                return;
            }

            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                {
                    if (con.State == ConnectionState.Closed)

                        con.Open();
                    {
                        string ePass = Encrypt(txtPassword.Text);
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "SP_Users_Systems";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ActionType", "ResetPassword");
                        cmd.Parameters.AddWithValue("@UserID", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Password", ePass);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                        con.Close();
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                        //lblMsg.Text = "Password Reset Sucessfully";
                        lblMsg.Text = "Thanks! Password Reset Successfully";


                        SqlConnection conn1 = new SqlConnection(connectionString);

                        Session["Event"] = Event.Text.Trim();

                        string logTime = Session["Time"].ToString();
                        string logSentBy = Session["Fname"].ToString();
                        string loguserID = Session["UserID"].ToString();
                        string logDate = Session["Date"].ToString();
                        string logEvent = Session["Event"].ToString();
                        string userdesignation = Session["Department"].ToString();
                        string logRole = Session["Role"].ToString();

                        SqlCommand cmdl = new SqlCommand();
                        cmdl.Connection = conn1;
                        cmdl.CommandType = CommandType.StoredProcedure;
                        cmdl.CommandText = "LogUser";
                        //cmdl.Parameters.AddWithValue("@LoginTime", logTime);
                        cmdl.Parameters.AddWithValue("@Sentby", logSentBy);
                        cmdl.Parameters.AddWithValue("@UserID", loguserID);
                        //cmdl.Parameters.AddWithValue("@Date", logDate);
                        cmdl.Parameters.AddWithValue("@Event", logEvent);
                        cmdl.Parameters.AddWithValue("@Designation", userdesignation);
                        cmdl.Parameters.AddWithValue("@Role", logRole);
                        cmdl.Connection = conn1;
                        conn1.Open();
                        cmdl.ExecuteNonQuery();
                    }
                }


            }
            catch (Exception ex)
            {
                lblMsg.Text += ex.Message;
                return;

            }
        }
    }
}