using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;

namespace UFAppleService
{
    public partial class AddPayment : System.Web.UI.Page
    {
        decimal Amount;
        decimal TrueAmount;
                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlDataSource ds = new SqlDataSource(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString,
                    "Select Description From ChartofAccounts Where COAID LIKE '2%'");
                accountDropDown.DataTextField = "Description";
                accountDropDown.DataSource = ds;
                accountDropDown.DataBind();
                accountDropDown.SelectedIndex = -1;
            }
            sROTextBox.Focus();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                Amount = decimal.Parse(amountTextBox.Text);
                TrueAmount = Amount * -1;
   
                SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.StoredProcedure };
                sqlcmd.CommandText = "NewCharge";
                sqlcmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
                sqlcmd.Parameters.AddWithValue("@Description", accountDropDown.SelectedValue);
                sqlcmd.Parameters.AddWithValue("@Amount" , TrueAmount);
                sqlcmd.Parameters.AddWithValue("@Date", dateTextBox.Text);
                sqlcmd.Parameters.AddWithValue("@Comment", commentTextBox.Text);
                sqlconn.Open();
                sqlcmd.ExecuteNonQuery();
                sqlconn.Close();
            }
            sROTextBox.Text = string.Empty;
            accountDropDown.SelectedIndex = -1;
            amountTextBox.Text = string.Empty;
            dateTextBox.Text = string.Empty;
            commentTextBox.Text = string.Empty;
        }

        protected void accountDropDownDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            accountDropDownDataSource.SelectParameters["AccountNumber"].DefaultValue = accountDropDown.SelectedValue;
        }

      protected Boolean CheckSRO()
        {
            if (string.IsNullOrEmpty(sROTextBox.Text))
            {
                return false;
            }
            else
            {
                SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                sqlconn.Open();
                SqlCommand cmd = new SqlCommand("SELECT SRONumber FROM SRO WHERE SRONumber = @SRONumber", sqlconn);
                SqlParameter param = new SqlParameter();
                cmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
                SqlDataReader reader = cmd.ExecuteReader();

                if (!reader.HasRows)
                {
                    return false;
                }
                sqlconn.Close();
            }
            return true;
        }

        protected Boolean CheckDate()
        {
            Page.Validate();

            if (string.IsNullOrEmpty(dateTextBox.Text))
            {
                return false;
            }
            else
            {
                if (Page.IsValid)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        protected void dateTextBox_TextChanged(object sender, EventArgs e)
        {
            saveButton.Visible = false;

            if (CheckSRO())
            {
                if (CheckDate())
                {
                    saveButton.Visible = true;
                }
            }
        }

        protected void sROTextBox_TextChanged(object sender, EventArgs e)
        {
            saveButton.Visible = false;

            if (CheckDate())
            {
                if (CheckSRO())
                {
                    saveButton.Visible = true;
                }
            }
        } 
    }
}