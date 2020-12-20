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

namespace RoadTransportOffence.Users
{
    public partial class Adduser : System.Web.UI.Page
    {

        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
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

            //if (Convert.ToString(Session["Role"]) != "Admin")
            //{
            //    Session.Clear();
            //    Session.Abandon();
            //    Session.RemoveAll();
            //    Response.Redirect("~/Login.aspx");
            //    return;
            //}

            //Event.Text = "Add Users with ID " + txtUserID.Text + "";


        }



        protected void txtRole_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            //String t1 = txtFname.Text;
            //String t2 = txtLName.Text;
            //name.Text = t1 + t2;


            String t5 = MobileCode.Text;
            String t6 = txtPhone.Text;
            phone.Text = t5 + t6;


            if (txtFname.Text.Trim() == "")
            {

                lblMsg.Text = "Please Enter First Name";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtFname.Focus();
                return;

            }



            if (txtLName.Text.Trim() == "")
            {

                lblMsg.Text = "Please Enter Last Name";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtLName.Focus();
                return;

            }

            if (txtEmailaddr.Text.Trim() == "")
            {

                lblMsg.Text = "Please Enter Email Address";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtEmailaddr.Focus();
                return;

            }



            if (txtRole.Text.Trim() == "Select")
            {

                lblMsg.Text = "Please Select Role to Proceed";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtRole.Focus();
                return;

            }



            //if (txtID.Text.Trim() == "")
            //{

            //    lblMsg.Text = "Please Enter User ID";
            //    lblMsg.ForeColor = System.Drawing.Color.Red;
            //    txtID.Focus();
            //    return;

            //}


            if (MobileCode.Text.Trim() == "Select")
            {

                lblMsg.Text = "Please Select Mobile Code";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                MobileCode.Focus();
                return;

            }


            if (txtPhone.Text.Trim() == "")
            {

                lblMsg.Text = "Please Enter Mobile No";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtPhone.Focus();
                return;

            }



            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select UserID from Users where UserID ='" + txtUserID.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();
            //while (sqlReader1.Read())
            if (sqlReader1.Read())
            {
                //lblMsg.Text = "User with username " + txtUserID.Text + " Already Exist";
                //lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "User with username " + txtUserID.Text + " Already Exist";
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();

            SqlConnection conn2 = new SqlConnection(connectionString);
            string query2 = "select Email from Users where Email ='" + txtEmailaddr.Text + "'";
            conn2.Open();
            SqlCommand sqlCommand2;
            SqlDataReader sqlReader2;
            sqlCommand2 = new SqlCommand();
            sqlCommand2 = new SqlCommand(query2, conn2);
            sqlReader2 = sqlCommand2.ExecuteReader();
            //while (sqlReader1.Read())
            if (sqlReader2.Read())
            {
                //lblMsg.Text = "User with email " + txtEmailaddr.Text + " Already Exist";
                //lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "User with email " + txtEmailaddr.Text + " Already Exist";
                return;
            }
            else
                sqlReader2.Close();
            conn2.Close();




            try
            {
                string fileName = Path.GetFileName(FUpimg.PostedFile.FileName);
                string extension = Path.GetExtension(FUpimg.PostedFile.FileName);
                // string extensionEX = Path.GetFileNameWithoutExtension(FUpimg.PostedFile.FileName);

                SqlConnection cn = new SqlConnection(ConnectionString);
                string s = Encrypt(txtPassword.Text);
                SqlCommand cmd = new SqlCommand("SP_Insert_Users", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                //cmd.Parameters.AddWithValue("@ID", txtID.Text);
                cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
                cmd.Parameters.AddWithValue("@LName", txtLName.Text);
                cmd.Parameters.AddWithValue("@UserPhone", phone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmailaddr.Text);
                cmd.Parameters.AddWithValue("@Department", txtDept.Text);
                cmd.Parameters.AddWithValue("@UserID", txtUserID.Text);
                cmd.Parameters.AddWithValue("@Password", s);
                cmd.Parameters.AddWithValue("@DateofBirth", txtDOB.Text);
                cmd.Parameters.AddWithValue("@UserAddress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Role", txtRole.Text);
                cmd.Parameters.AddWithValue("@Status", 0);
                //cmd.Parameters.AddWithValue("@LogBy", UserID);

                if (FUpimg.HasFile)
                {
                    if (extension == ".mp3" || extension == ".mp4" || extension == ".PNG" || extension == ".JPG")
                    {
                        cmd.Parameters.AddWithValue("@User_Photo", "~/User_Photo/" + txtUserID.Text + extension);

                        //  string strPath = MapPath("../User_Photo/") + txtUserID.Text + extension;

                        //  string fn = System.IO.Path.GetExtension(FUpimg.PostedFile.FileName);
                        string SaveLocation = Server.MapPath("../User_Photo/") + txtUserID.Text + extension;

                       /* string fileExtention = FUpimg.PostedFile.ContentType;
                        int fileLenght = FUpimg.PostedFile.ContentLength;
                        System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(FUpimg.PostedFile.InputStream);
                        System.Drawing.Image objImage = ScaleImage(bmpPostedImage, 128);
                        // Saving image in jpeg format
                        objImage.Save(SaveLocation, ImageFormat.Png);*/

                        // FUpimg.SaveAs(strPath);                       
                    }
                    else
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('.jpg and .Png Format can be support')", true);
                        lblMsg.Text = ".jpg and .Png Format can be support";
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@User_Photo", "~/User_Photo/man.png"); //DBNull.Value for Database NULL value
                }

                cmd.ExecuteNonQuery();
                cn.Close();

                //try
                //{
                //    string sub = "Account to MMCET Student eLearning System";
                //    string msg = "Dear " + txtFname.Text + ",\r\n\r\n Your Account to MMCET Student eLearning System has been successfully created.\r\n\r\n Kindly use below login credentials:\r\n\r\n Username  : " + txtUserID.Text + "\r\n\r\n Password: 12345" + " \r\n\r\n\r\n\r\n";

                //    MailMessage mail = new MailMessage();
                //    SmtpClient smtpc = new SmtpClient("mail.mmcet-lms.com");
                //    mail.From = new MailAddress("admin@mmcet-lms.com");
                //    string email = txtEmailaddr.Text;
                //    mail.To.Add(email);
                //    mail.Subject = sub;
                //    mail.Body = msg;


                //    //mail.Body = "Hi " + "\n" +
                //    //             "The file " + PaperTitle.Text.Trim() + " has been shared with you from the e-Cabinet system. Please use the passkey " + txtFileKey.Text.Trim() + "\n" +
                //    //             "to open this file and all attachments. If you have any difficulty accessing this file, please call Cabinet Secretariat on 10101 on GovNet® or send an e mail to support@ecabinet.gov.sl " + "\n" +
                //    //             " \n Thanks!";

                //    smtpc.Port = 8889;
                //    smtpc.Credentials = new NetworkCredential("admin@mmcet-lms.com", "default@123");
                //    smtpc.Send(mail);

                //}
                //catch (Exception ep)
                //{

                //}


                lblMsg.Text = "Thanks! User Successfully";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                Response.Redirect("~/Users/ManageUsers.aspx");



            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }




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
