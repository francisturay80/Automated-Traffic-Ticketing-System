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

namespace RoadTransportOffence.Users
{
    public partial class ManageUsers1 : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("SP_Users_Systems", cn);
            cmd.Parameters.AddWithValue("@ActionType", "Users_Details");
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            cmd.Parameters.AddWithValue("@ID", ID);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                imgUser.ImageUrl = rd["User_Photo"].ToString();
                lblIDView.Text = rd["ID"].ToString();
                txtFName.Text = rd["Fname"].ToString();
                txtLName.Text = rd["LName"].ToString();
                txtContact.Text = rd["UserPhone"].ToString();
                txtAddress.Text = rd["UserAddress"].ToString();
                txtPassword.Text = rd["Password"].ToString();
                txtDept.Text = rd["Department"].ToString();
                txtEmail.Text = rd["Email"].ToString();
                string DOB = rd["DateofBirth"].ToString();
                txtDOB.Text = DOB;// DOB.Substring(0, 10);    
                txtStatus.Text = rd["Status"].ToString();

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
                cmd.Parameters.AddWithValue("@ActionType", "Users");
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


            if (txtsearch.Text.Trim() == "")
            {
                lblMsg.Text = "Please Enter Search Parameter";
                txtsearch.Focus();
                return;

            }

            string query = "Select ID As 'S.N.',OffenceCode as 'Offence Code',OffenceTitle as 'Offence Title' from offenceList  where OffenceCode  ='" + txtsearch.Text + "' or  ((ID  ='" + txtsearch.Text + "') or ((OffenceTitle  ='" + txtsearch.Text + "') ";
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
                SqlCommand cmd = new SqlCommand("SP_Users_Systems", cn);
                cmd.Parameters.AddWithValue("@ActionType", "update");
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                cmd.Parameters.AddWithValue("@ID", lblIDView.Text);
                cmd.Parameters.AddWithValue("@Fname", txtFName.Text);
                cmd.Parameters.AddWithValue("@LName", txtLName.Text);
                cmd.Parameters.AddWithValue("@UserPhone", txtContact.Text);
                cmd.Parameters.AddWithValue("@Department", txtDept.Text);
                cmd.Parameters.AddWithValue("@UserAddress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@DateofBirth", Convert.ToString(txtDOB.Text));
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Status", txtStatus.Text);
                cmd.ExecuteNonQuery();
                cn.Close();
                lblMsg.Text = "Thanks! User  Updated Successfully";
                Response.Redirect("ManageUsers.aspx");
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
            lblitemName.Text = gvrow.Cells[3].Text;
            //lblBarCode.Text = gvrow.Cells[2].Text;

            LoadDetailsData(gvrow.Cells[1].Text);

            this.MpeEditItemShow.Show();


        }


        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection cn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_Users_Systems", cn);
                cmd.Parameters.AddWithValue("@ActionType", "Delete");

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", lblCodeDeleteItem.Text);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                lblMsg.Text = "Thanks! User  Deleted Successfully";

                ItemsListDataBind();
            }
            catch //(Exception ex)
            {
                this.ModalPopupDeleteItem.Show();
            }

        }

    }
}