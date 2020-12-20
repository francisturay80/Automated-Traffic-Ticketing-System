using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.Configuration;
namespace RoadTransportOffence
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        public string Encrypt(string str)
        {
            byte[] encrt_byte = new byte[str.Length];
            encrt_byte = UTF8Encoding.UTF8.GetBytes(str);
            String s = Convert.ToBase64String(encrt_byte);
            return s;
        }

        public string Decrypt(string str)
        {
            UTF8Encoding objutfencoding = new UTF8Encoding();
            Decoder utfdecode = objutfencoding.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(str);
            int countchar = utfdecode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[countchar];
            utfdecode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string epass = new string(decoded_char);
            return epass;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginTime.Text = DateTime.Now.ToLongTimeString();
            lblDate.Text = DateTime.Now.ToShortDateString();
        }


        private void UserLogin()
        {
            if (Username.Text == "" || Password.Text == "")
            {
                lblMsg.Text = "Please Enter Your Login Details.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                {

                    string epass1 = Encrypt(Password.Text.Trim());
                    string epass = Decrypt(epass1);

                    string UserID = Username.Text.Trim();
                    //

                    SqlConnection con = new SqlConnection(connectionString);
                    SqlCommand cmd = new SqlCommand("SP_Officer");
                    cmd.Parameters.AddWithValue("@ActionType", "LOGING");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@Username", Username.Text.Trim());
                    //
                    if (con.State == ConnectionState.Closed)

                        con.Open();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        string userstaffid = dt.Rows[0]["ID"].ToString();
                        string userlog = dt.Rows[0]["Fname"].ToString();
                        string useLastName = dt.Rows[0]["LName"].ToString();
                       
                        //string department = dt.Rows[0]["Department"].ToString();
                        string Email = dt.Rows[0]["Email"].ToString();
                        string userid = dt.Rows[0]["Username"].ToString();
                        string password = dt.Rows[0]["Password"].ToString();
                        string RoleType = dt.Rows[0]["Role"].ToString();
                        string userPhoto = dt.Rows[0]["User_Photo"].ToString();
                        int status = Convert.ToInt32(dt.Rows[0]["Status"].ToString());
                        if (epass1 != password)
                        {
                            lblMsg.Text = "Wrong Password.";
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                            return;
                        }


                        if (status == 0)
                        {

                            Response.Redirect("~/ChangePwd.aspx");

                        }
                        else


                            if (userid == Username.Text.Trim() && RoleType == "Officer")
                        {
                            Session["Fname"] = userlog;
                            Session["Username"] = userid;
                            Session["LName"] = useLastName;
                            //Session["Designation"] = userdesignation;
                            Session["Email"] = Email;
                            Session["Time"] = LoginTime.Text.ToString();
                            Session["Date"] = lblDate.Text.ToString();
                            Session["Role"] = RoleType;
                            Session["User_Photo"] = userPhoto;
                            Session.Add("Session", userid);

                            lblMsg.Text = "Login successful.";

                            Response.Cookies["InventMgtCookies"]["Username"] = UserID;
                            Response.Cookies["InventMgtCookies"]["User_Photo"] = userPhoto;
                            //Response.Cookies["InventMgtCookies"]["User_Photo"] = userPhoto;

                            //hitcounter();
                            Response.Redirect("Mobile/create-ticket.aspx", false);
                            Response.Redirect("~/Mobile/create-ticket.aspx");


                        }





                    }
                    else
                    {
                        lblMsg.Text = "Invalid Username or Password";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                    }
                    Password.Text = string.Empty;
                    Username.Text = string.Empty;
                }

            }
            catch (Exception ex)
            {
                lblMsg.Text = "Invalid Data. Try Again.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }

        }


        protected void login_Click(object sender, EventArgs e)
        {
            UserLogin();
        }

        //protected void BtnNew_Account_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/SignUp_Page.aspx");
        //}
    }
}