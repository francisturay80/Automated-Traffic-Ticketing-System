using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoadTransportOffence.Mobile
{
    public partial class master : System.Web.UI.MasterPage
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            else if (Convert.ToString(Session["Role"]) != "Officer")
            {
                Response.Redirect("~/Login");
                return;
            }
            else
            {
                string cookiesValues;
                cookiesValues = Request.Cookies["InventMgtCookies"]["Username"];
                image.ImageUrl = Request.Cookies["InventMgtCookies"]["User_Photo"];
                //image2.ImageUrl = Request.Cookies["InventMgtCookies"]["User_Photo"];
                //username.Text = Request.Cookies["InventMgtCookies"]["Username"];
                username2.Text = Request.Cookies["InventMgtCookies"]["Username"];
            }

        }


        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }
    }
}