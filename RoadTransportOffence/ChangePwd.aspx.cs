using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoadTransportOffence
{
    public partial class ChangePwd : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);

        public string Encrypt(string str)
        {
            byte[] encrt_byte = new byte[str.Length];
            encrt_byte = UTF8Encoding.UTF8.GetBytes(str);
            String s = Convert.ToBase64String(encrt_byte);
            return s;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnChangePass_Click(object sender, EventArgs e)
        {
            if (Username.Text == "" || Password.Text == "")
            {
                lblMsg.Text = "Please Enter Your Login Details.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (Password.Text.ToString() != ConfirmPass.Text.ToString())
            {
                lblMsg.Text = "Password does not match";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                {
                    if (con.State == ConnectionState.Closed)

                        con.Open();
                    {
                        string ePass = Encrypt(Password.Text);
                        SqlCommand cmd = new SqlCommand("SP_Users_Systems");
                        cmd.Parameters.AddWithValue("@ActionType", "ChangePw");

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserID", Username.Text);
                        cmd.Parameters.AddWithValue("@Password", ePass);
                        cmd.Connection = con;
                        cmd.ExecuteNonQuery();
                        con.Close();

                        lblMsg.Text = "Password has been change sucessfully! Please Login";
                        lblMsg.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("~/index.aspx");
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