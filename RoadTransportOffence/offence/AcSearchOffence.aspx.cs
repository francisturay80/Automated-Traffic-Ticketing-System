using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.Configuration;

namespace RoadTransportOffence.offence
{
    public partial class AcSearchOffence : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               

            }

            String Date = DateTime.Now.ToString("dd/MM/yyyy");
            date.Text = Date;

        }



        public void LoadDetailsData(string ID)
        {

            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_OffenceList", cn);
            cmd.Parameters.AddWithValue("@ActionType", "offence");
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            cmd.Parameters.AddWithValue("@TicketNo", ID);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                txtStatus.Text = rd["Status"].ToString();
                ticket.Text = rd["TicketNo"].ToString();

            }


            cn.Close();
        }



        public void ItemsListDataBind()
        {
            try
            {
                grdItemList.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_OffenceList", con);
                cmd.Parameters.AddWithValue("@ActionType", "View_offence");
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                grdItemList.DataSource = ds;
                grdItemList.EmptyDataText = "No Records Found";
                grdItemList.DataBind();
                con.Close();

            }
            catch
            {
                lbtotalRow.Text = "No Records Found";
            }
        }





        protected void btnTicket_Click(object sender, EventArgs e)
        {




            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_ViewDays", con);
            cmd.Parameters.AddWithValue("@TicketNo", Ticketnumber.Text);
            cmd.Parameters.AddWithValue("@VehicleNumber", Ticketnumber.Text);


            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            grdItemList.DataSource = ds;
            grdItemList.EmptyDataText = "No Records Found";
            grdItemList.DataBind();
            grdItemList.FooterRow.Cells[0].Text = "TOTAL";




            con.Close();



        }

        public void btnCalculate_Click(object sender, EventArgs e)
        {


            LinkButton sumA = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)sumA.NamingContainer;
            sum.Text = gvrow.Cells[2].Text;


            //Declear values
            int day = Convert.ToInt32(gvrow.Cells[1].Text);
            int val = Convert.ToInt32(gvrow.Cells[2].Text);
            double cal = 0.5;
            int per = Convert.ToInt32(1);

            int percentage = Convert.ToInt32(100);


            // Calculate Values
            double total = cal / percentage + per * day * val;

            percent.Text = Convert.ToString(total);
            grdItemList.FooterRow.Cells[2].Text = percent.Text;
        }

        protected void grdItemList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[12].Visible = true;
        }


        protected void grdItemList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdItemList.PageIndex = e.NewPageIndex;
        }





        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_OffenceList", cn);
                cmd.Parameters.AddWithValue("@ActionType", "UpdateOffence");
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                cmd.Parameters.AddWithValue("@TicketNo", ticket.Text);

                cmd.Parameters.AddWithValue("@Status", Status.Text);
                cmd.ExecuteNonQuery();
                cn.Close();
                lblMsg.Text = "Thanks! Offence  Updated Successfully";


            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = ex.Message;
                this.MpeEditItemShow.Show();
            }


        }

        protected void LinkItemsDelete_Click(object sender, EventArgs e)
        {

            LinkButton Linkdetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)Linkdetails.NamingContainer;

            lblCodeDeleteItem.Text = gvrow.Cells[6].Text;
            lblDeleteItem_CustName.Text = gvrow.Cells[7].Text;
            ticketno.Text = gvrow.Cells[4].Text;
            this.ModalPopupDeleteItem.Show();
        }

        protected void LinkEdit_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            LinkButton Linkdetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)Linkdetails.NamingContainer;

            lblItemID.Text = gvrow.Cells[6].Text;
            lblitemName.Text = gvrow.Cells[7].Text;

            LoadDetailsData(gvrow.Cells[4].Text);

            this.MpeEditItemShow.Show();


        }


        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_OffenceList", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Delete");

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TicketNo", ticketno.Text);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                lblMsg.Text = "Thanks! Offence  Deleted Successfully";

                ItemsListDataBind();
            }
            catch //(Exception ex)
            {
                this.ModalPopupDeleteItem.Show();
            }

        }


    }
}