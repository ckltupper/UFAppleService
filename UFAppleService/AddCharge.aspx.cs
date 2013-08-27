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
    public partial class AddCharge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlDataSource ds = new SqlDataSource(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString,
                    "Select Description From ChartofAccounts Where COAID LIKE '1%'");
                accountDropDown.DataTextField = "Description";
                accountDropDown.DataSource = ds;
                accountDropDown.DataBind();

                sROTextBox.Focus();
            }           
        }

        protected Boolean CheckSRO()
        {
            if (string.IsNullOrEmpty(sROTextBox.Text))
            {
                return false;

                sROTextBox.Focus();
            }
            else
            {
                SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                sqlconn.Open();
                SqlCommand cmd = new SqlCommand("SELECT SRONumber FROM SRO WHERE SRONumber = @SRONumber", sqlconn);
                SqlParameter param = new SqlParameter();
                cmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    return true;

                    accountDropDown.Focus();
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

                dateTextBox.Focus();
            }
            else
            {
                if (Page.IsValid)
                {
                    return true;

                    commentTextBox.Focus();
                }
                else
                {
                    return false;

                    dateTextBox.Focus();
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
                else
                {
                    sROTextBox.Focus();
                }
            }
            else
            {
                dateTextBox.Focus();
            }
        }

        protected void accountDropDownDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            accountDropDownDataSource.SelectParameters["AccountNumber"].DefaultValue = accountDropDown.SelectedValue;
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
                else
                {
                    dateTextBox.Focus();
                }
            }
            else
            {
                sROTextBox.Focus();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.StoredProcedure };
                sqlcmd.CommandText = "NewCharge";
                sqlcmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
                sqlcmd.Parameters.AddWithValue("@Description", accountDropDown.SelectedValue);
                sqlcmd.Parameters.AddWithValue("@Amount", amountTextBox.Text);
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

            sROTextBox.Focus();
        }
    }            
}