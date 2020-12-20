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

namespace RoadTransportOffence.Fine
{
    public partial class manage_fine : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("SP_Fine", cn);
            cmd.Parameters.AddWithValue("@ActionType", "Fine_Details");
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            cmd.Parameters.AddWithValue("@ID", ID);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                title.Text = rd["OffenceTitle"].ToString();
                amount.Text = rd["Amount"].ToString();

            }


            cn.Close();
        }



        public void ItemsListDataBind()
        {
            try
            {
                grdItemList.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Users_Systems", con);
                cmd.Parameters.AddWithValue("@ActionType", "fine");
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {


            //if (txtsearch.Text.Trim() == "")
            //{
            //    lblMsg.Text = "Please Enter Search Parameter";
            //    txtsearch.Focus();
            //    return;

            //}

            //string query = "Select ID As 'S.N.',OffenceCode as 'Offence Code',OffenceTitle as 'Offence Title' from offenceList  where OffenceCode  ='" + txtsearch.Text + "' or  ((ID  ='" + txtsearch.Text + "') or ((OffenceTitle  ='" + txtsearch.Text + "') ";
            //string conString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(conString))
            //{
            //    using (SqlCommand cmd = new SqlCommand(query))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                grdItemList.DataSource = dt;
            //                grdItemList.DataBind();
            //            }
            //        }
            //    }
            //}

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
                SqlCommand cmd = new SqlCommand("SP_Fine", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Update");
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                cmd.Parameters.AddWithValue("@ID",lblItemID.Text);

                cmd.Parameters.AddWithValue("@Amount", amount.Text);
                cmd.Parameters.AddWithValue("@OffenceTitle", title.Text);


                cmd.ExecuteNonQuery();
                cn.Close();
                Response.Redirect("manage-fine.aspx");
                lblMsg.Text = "Thanks! Fine  Updated Successfully";
                
                amount.Text = "";
              

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

            lblCodeDeleteItem.Text = gvrow.Cells[1].Text;
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

            LoadDetailsData(gvrow.Cells[1].Text);

            this.MpeEditItemShow.Show();


        }


        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Fine", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Delete");

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", lblCodeDeleteItem.Text);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                lblMsg.Text = "Thanks! Fine  Deleted Successfully";

                ItemsListDataBind();
            }
            catch //(Exception ex)
            {
                this.ModalPopupDeleteItem.Show();
            }

        }

    }

}
