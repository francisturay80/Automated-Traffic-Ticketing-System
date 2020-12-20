using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace RoadTransportOffence.Admin
{
    public partial class Finance : System.Web.UI.MasterPage
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/index.aspx");
            }

            else if (Convert.ToString(Session["Role"]) != "Accountant")
            {
                Response.Redirect("~/index.aspx");
                return;
            }
            else
            {
                string cookiesValues;
                cookiesValues = Request.Cookies["InventMgtCookies"]["UserID"];
                ImgUser.ImageUrl = Request.Cookies["InventMgtCookies"]["User_Photo"];
                imgUser2.ImageUrl = Request.Cookies["InventMgtCookies"]["User_Photo"];
                imgUser3.ImageUrl = Request.Cookies["InventMgtCookies"]["User_Photo"];

                lblusername.Text = Request.Cookies["InventMgtCookies"]["UserID"];
                lblusername2.Text = Request.Cookies["InventMgtCookies"]["UserID"];
                lblemail.Text = Request.Cookies["InventMgtCookies"]["Email"];





            }

        }


        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("~/index.aspx");
        }
    }
}