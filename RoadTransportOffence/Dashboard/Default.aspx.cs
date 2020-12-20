using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoadTransportOffence.Dashboard
{
    public partial class Default : System.Web.UI.Page
    {
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

            if (!Page.IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connectionString);
                using (conn)
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM vwAdminUsers", conn);
                    ad.Fill(dt);
                }
                rptSystemAdmin.DataSource = dt;
                rptSystemAdmin.DataBind();
            }



            if (!Page.IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connectionString);
                using (conn)
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM vwOffenceList", conn);
                    ad.Fill(dt);
                }
                RptOffenceList.DataSource = dt;
                RptOffenceList.DataBind();
            }


            if (!Page.IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connectionString);
                using (conn)
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM vwVehicles", conn);
                    ad.Fill(dt);
                }
                RptVehicle.DataSource = dt;
                RptVehicle.DataBind();
            }

            if (!Page.IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connectionString);
                using (conn)
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM vwOfficers", conn);
                    ad.Fill(dt);
                }
                RptOfficers.DataSource = dt;
                RptOfficers.DataBind();
            }




           


        }
        [WebMethod]
        public static List<SalesDetails> GetChartData()
        {
            String ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT TOP (5) OffenceTitle, COUNT(OffenceTitle) AS 'Total' FROM dbo.offence GROUP BY OffenceTitle ORDER BY 'Total' DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            List<SalesDetails> dataList = new List<SalesDetails>();
            foreach (DataRow dtrow in dt.Rows)
            {
                SalesDetails details = new SalesDetails();
                details.DATE = dtrow[0].ToString();
                details.Total = Convert.ToInt32(dtrow[1]);
                dataList.Add(details);
            }
            return dataList;
        }

        public class SalesDetails
        {
            public string DATE { get; set; }
            public int Total { get; set; }
        }
    }
}