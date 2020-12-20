using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace RoadTransportOffence.Mobile
{
    public partial class create_ticket : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);
        SqlConnection conReg = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);


        public String characters = "0123456789";

        public string TicketNumber()
        {
            Random unique1 = new Random();
            string s = "TICKET-";
            int unique;
            int n = 0;
            while (n < 10)
            {
                if (n % 2 == 0)
                {
                    s += unique1.Next(10).ToString();

                }
                else
                {
                    unique = unique1.Next(52);
                    if (unique < this.characters.Length)
                        s = String.Concat(s, this.characters[unique]);
                }
                TicketNo.Text = s.ToString();
                n++;
            }
            return s;
        }

        public string Encrypt(string str)
        {
            byte[] encrt_byte = new byte[str.Length];
            encrt_byte = UTF8Encoding.UTF8.GetBytes(str);
            String s = Convert.ToBase64String(encrt_byte);
            return s;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
             TicketNumber();

            if (Convert.ToString(Session["Role"]) != "Officer")
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("~/Login.aspx");
                return;
            }
            else
            {
                string cookiesValues;
                cookiesValues = Request.Cookies["InventMgtCookies"]["Username"];
               
               
                wname.Text = Request.Cookies["InventMgtCookies"]["Username"];
            }
           

            if (!IsPostBack)
            {
                string query = "select OffenceTitle,OffenceCode from offenceList";
                BindDropDownList1(offence, query, "OffenceTitle", "OffenceTitle", "Select");

            }

            texApi.Text = "pflamS+R8mI-1RTSgmnLDVzfqR0guwIfNaotr5KuoX";
            texSender.Text = "SLRSA";
            txtPassword.Text = "12345";
           

           String date = DateTime.Now.ToString("dd/MM/yyyy");
            lbldate.Text = date;
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

        public void SendSMS()
        {

            String result;
            string apiKey = texApi.Text;
            string numbers = phone.Text; 
            string message = txtMessage.Text;
            string send = texSender.Text;

            String url = "https://api.txtlocal.com/send/?apikey=" + apiKey + "&numbers=" + numbers + "&message=" + message + "&sender=" + send;
            //refer to parameters to complete correct url string

            StreamWriter myWriter = null;
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);

            objRequest.Method = "POST";
            objRequest.ContentLength = Encoding.UTF8.GetByteCount(url);
            objRequest.ContentType = "application/x-www-form-urlencoded";
            try
            {
                myWriter = new StreamWriter(objRequest.GetRequestStream());
                myWriter.Write(url);
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Message Not Sent";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            finally
            {
                myWriter.Close();
            }

            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
            {
                result = sr.ReadToEnd();
                sr.Close();
            }
        }


      




        public void getNumber()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select OwnerPhoneNo from Transport where VehicleNumber ='" + vehno.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();
           
            if (sqlReader1.Read())
            {
                phone.Text = sqlReader1["OwnerPhoneNo"].ToString();
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();
        }



        public void getName()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select OwnerName from Transport where VehicleNumber ='" + vehno.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();
         
            if (sqlReader1.Read())
            {
                name.Text = sqlReader1["OwnerName"].ToString();
               
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();
        }



        public void getFine()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            string query1 = "select Amount from fine where OffenceTitle ='" + offence.Text + " '";
            conn.Open();
            SqlCommand sqlCommand1;
            SqlDataReader sqlReader1;
            sqlCommand1 = new SqlCommand();
            sqlCommand1 = new SqlCommand(query1, conn);
            sqlReader1 = sqlCommand1.ExecuteReader();
          
            if (sqlReader1.Read())
            {
                amount.Text = sqlReader1["Amount"].ToString();
              
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
                sqlReader1.Close();
            conn.Close();
        }


       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //getDate();
            getFine();
            getName();
            getNumber();

            if (vehno.Text.Trim() == "")
            {
                lblMsg.Text = "Vehicle No Required";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                vehno.Focus();
                return;

            }

            if(offence.SelectedItem.Text.Trim() == "Select")
            {
                lblMsg.Text = "Select offence Committed";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                offence.Focus();
                return;
            }



            try
            {
                  
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Offence", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@ActionType", "Insert");
                cmd.Parameters.AddWithValue("@OffenceTitle", offence.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@VehicleNumber", vehno.Text);
                cmd.Parameters.AddWithValue("@DriverLicenseNo", licenceNo.Text);
                cmd.Parameters.AddWithValue("@WardenName", wname.Text);
                cmd.Parameters.AddWithValue("@Fine", amount.Text);
                cmd.Parameters.AddWithValue("@TicketNo", TicketNo.Text);
                cmd.Parameters.AddWithValue("@DateCommitted", lbldate.Text);

              
                cmd.ExecuteNonQuery();
              
                con.Close();

                txtMessage.Text = "Dear "  + name.Text.Trim() + " \n" +
                           "\n" +
                          "You have been fined for: " + offence.Text + " " + "with Ticket No " + TicketNo.Text + " .  " + "\n" +
                          "\n" +
                          "In accordance with the penalty therefore in the above mentioned enactment of the offence you are hereby fined the sum of  Le "+ amount.Text + " to be paid within 72 hours from today's date " + lbldate.Text + "\n" +
                          "\n" +
                          "Thanks! ";

                //SMS
                SendSMS();
                lblMsg.ForeColor = System.Drawing.Color.Green;
              
                vehno.Text = "";
                licenceNo.Text = "";
               
                lblMsg.Text = "Thanks! offence Sent  Successfully";




            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }
       
    }
}