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
using System.Web.Configuration;
using System.Text;
namespace RoadTransportOffence.setting
{
    public partial class profile : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
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

            if (Convert.ToString(Session["Role"]) != "Admin")
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("~/index.aspx");
                return;
            }

            string UserID = Session["Role"].ToString();
            txtRole.Text = UserID;

            Event.Text = "Upadte Users with ID " + txtUsername.Text + "";

            if (!IsPostBack)
            {

                if (Request.Cookies["InventMgtCookies"] != null)
                {
                    LoadDetailsData(Request.Cookies["InventMgtCookies"]["UserID"].ToString());
                    txtFname.Focus();

                }
                else
                {
                    Response.Redirect("~/index.aspx", true);
                }
            }
        }

        public void LoadDetailsData(string UserID)
        {


            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_Users_Systems", cn);
            cmd.Parameters.AddWithValue("@ActionType", "UserProfiledDetails");
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            cmd.Parameters.AddWithValue("@UserID", UserID);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();

                imgUser.ImageUrl = rd["User_Photo"].ToString();
                lblUID.Text = rd["ID"].ToString();
                txtFname.Text = rd["Fname"].ToString();
                txtLName.Text = rd["LName"].ToString();
                txtPhone.Text = rd["UserPhone"].ToString();
                txtEmailaddr.Text = rd["Email"].ToString();
                txtAddress.Text = rd["UserAddress"].ToString();
                txtUsername.Text = rd["UserID"].ToString();
                //ePass = rd["Password"].ToString();
                txtDept.Text = rd["Department"].ToString();
                string DOB = rd["DateofBirth"].ToString();
                txtDOB.Text = DOB;// DOB.Substring(0, 10);    
            }
            cn.Close();

        }

        // /// Update user Profile | Change password
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                string fileName = Path.GetFileName(FUpimg.PostedFile.FileName);
                string extension = Path.GetExtension(FUpimg.PostedFile.FileName);
                string UserID = txtRole.Text;


                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Users_Systems", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Update");
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
                cmd.Parameters.AddWithValue("@LName", txtLName.Text);
                cmd.Parameters.AddWithValue("@UserPhone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Department", txtDept.Text);
                cmd.Parameters.AddWithValue("@UserAddress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@DateofBirth", Convert.ToString(txtDOB.Text));
                cmd.Parameters.AddWithValue("@Email", txtEmailaddr.Text);
                cmd.Parameters.AddWithValue("@Lastupdateby", UserID);

                if (FUpimg.HasFile)
                {
                    if (extension == ".png" || extension == ".jpg" || extension == ".PNG" || extension == ".JPG")
                    {
                        cmd.Parameters.AddWithValue("@User_Photo", "~/User_Photo/" + txtUsername.Text + extension);

                       
                        string SaveLocation = Server.MapPath("../User_Photo/") + txtUsername.Text + extension;

                        string fileExtention = FUpimg.PostedFile.ContentType;
                        int fileLenght = FUpimg.PostedFile.ContentLength;
                        System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(FUpimg.PostedFile.InputStream);
                        System.Drawing.Image objImage = ScaleImage(bmpPostedImage, 128);
                        // Saving image in jpeg format
                        objImage.Save(SaveLocation, ImageFormat.Png);
                        //   FUpimg.SaveAs(strPath);
                        imgUser.ImageUrl = "~/User_Photo/" + txtUsername.Text + extension;
                    }
                    else
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = ".jpg and .Png Format can be support";
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@User_Photo", imgUser.ImageUrl);
                }

                cmd.ExecuteNonQuery();
                cn.Close();


                lblmsg.Visible = true;
              
               
                lblmsg.Text = "Thanks! Profile Updated Successfully";
                lblmsg.ForeColor = System.Drawing.Color.Green;
               

                SqlConnection conn1 = new SqlConnection(connectionString);

                Session["Event"] = Event.Text.Trim();

                string logTime = Session["Time"].ToString();
                string logSentBy = Session["Fname"].ToString();
                string loguserID = Session["UserID"].ToString();
                string logDate = Session["Date"].ToString();
                string logEvent = Session["Event"].ToString();
                string logRole = Session["Role"].ToString();

                SqlCommand cmdl = new SqlCommand();
                cmdl.Connection = conn1;
                cmdl.CommandType = CommandType.StoredProcedure;
                cmdl.CommandText = "LogUser";
                cmdl.Parameters.AddWithValue("@Sentby", logSentBy);
                cmdl.Parameters.AddWithValue("@UserID", loguserID);
                cmdl.Parameters.AddWithValue("@Event", logEvent);
                cmdl.Parameters.AddWithValue("@Role", logRole);
                cmdl.Connection = conn1;
                conn1.Open();
                cmdl.ExecuteNonQuery();

               
                LoadDetailsData(UserID);

            }
            catch (Exception ex)
            {
                lblmsg.Visible = true;
                lblmsg.Text = ex.Message;

            }


        }

        /// Image resizing
        public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxHeight)
        {
            var ratio = (double)maxHeight / image.Height;
            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);
            var newImage = new Bitmap(newWidth, newHeight);
            using (var g = Graphics.FromImage(newImage))
            {
                g.DrawImage(image, 0, 0, newWidth, newHeight);
            }
            return newImage;
        }

    }
}