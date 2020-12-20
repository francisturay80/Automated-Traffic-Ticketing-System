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

namespace RoadTransportOffence.Vehicle
{
    public partial class manage_transport : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        string connectionString = WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ItemsListDataBind();
                txtsearch.Focus();
            }

        }



        public void LoadDetailsData(string ID)
        {

            SqlConnection cn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_Transport", cn);
            cmd.Parameters.AddWithValue("@ActionType", "Transport_Details");
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            cmd.Parameters.AddWithValue("@VehicleNumber", ID);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                Name.Text = rd["OwnerName"].ToString();
                phone.Text = rd["OwnerPhoneNo"].ToString();
                address.Text = rd["OwnerAddress"].ToString();
               

            }


            cn.Close();
        }



        public void ItemsListDataBind()
        {
            try
            {
                grdItemList.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Transport", con);
                cmd.Parameters.AddWithValue("@ActionType", "View_Transport");
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


        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Transport", con);
                cmd.Parameters.AddWithValue("@ActionType", "Search_Vehicles");
                cmd.Parameters.AddWithValue("@value", txtsearch.Text);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                grdItemList.DataSource = ds;
                grdItemList.EmptyDataText = "No Records Found";
                grdItemList.DataBind();
                con.Close();
                lbtotalRow.Text = txtsearch.Text + "  Report | Total : " + Convert.ToString(grdItemList.Rows.Count) + " Records Found" + "<br />";

            }
            catch
            {
                lbtotalRow.Text = "No Records Found";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {


            if (txtsearch.Text.Trim() == "")
            {
                lblMsg.Text = "Please Enter Search Parameter";
                txtsearch.Focus();
                return;

            }

            string query = "Select ID As 'S.N.',VehicleNumber as 'Vehicle No',OwnerName as 'Owner Name' from Transport  where VehicleNumber  ='" + txtsearch.Text + "' or  ((ID  ='" + txtsearch.Text + "') or ((OwnerPhoneNo  ='" + txtsearch.Text + "') ";
            string conString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grdItemList.DataSource = dt;
                            grdItemList.DataBind();
                        }
                    }
                }
            }

        }

        protected void grdItemList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[12].Visible = true;
        }


        protected void grdItemList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdItemList.PageIndex = e.NewPageIndex;
            ItemsListDataBind();
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtsearch.Text = string.Empty;
            ItemsListDataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Transport", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Update");
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                cmd.Parameters.AddWithValue("@VehicleNumber", lblitemName.Text);
                cmd.Parameters.AddWithValue("@OwnerName", Name.Text);
                cmd.Parameters.AddWithValue("@OwnerPhoneNo", phone.Text);
                cmd.Parameters.AddWithValue("@OwnerAddress", address.Text);
                cmd.ExecuteNonQuery();
                cn.Close();
               
                Response.Redirect("~/Vehicle/manage-transport.aspx");
                lblMsg.Text = "Thanks! Vehicle info  Updated Successfully";


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

            lblCodeDeleteItem.Text = gvrow.Cells[2].Text;
            lblDeleteItem_CustName.Text = gvrow.Cells[3].Text;

            this.ModalPopupDeleteItem.Show();
        }

        protected void LinkEdit_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            LinkButton Linkdetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)Linkdetails.NamingContainer;

            lblItemID.Text = gvrow.Cells[1].Text;
            lblitemName.Text = gvrow.Cells[2].Text;
            //lblBarCode.Text = gvrow.Cells[2].Text;

            LoadDetailsData(gvrow.Cells[2].Text);

            this.MpeEditItemShow.Show();


        }


        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Transport", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Delete");

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VehicleNumber", lblCodeDeleteItem.Text);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                lblMsg.Text = "Thanks! Transport  Deleted Successfully";

                ItemsListDataBind();
            }
            catch //(Exception ex)
            {
                this.ModalPopupDeleteItem.Show();
            }

        }

    }
}