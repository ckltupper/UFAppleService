using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace UFAppleService
{
    public partial class AddSRO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                sROTextBox.Focus();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.Text };
                sqlcmd.CommandText = "Insert into SRO (SRONumber, DateCreated, PONumber) Values (@SRONumber, @DateCreated, @PONumber)";
                sqlcmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
                sqlcmd.Parameters.AddWithValue("@DateCreated", dateCreatedTextBox.Text);
                sqlcmd.Parameters.AddWithValue("@PONumber", pONumberTextBox.Text);
                sqlconn.Open();
                sqlcmd.ExecuteNonQuery();
                sqlconn.Close();
            }
            sROTextBox.Text = string.Empty;
            dateCreatedTextBox.Text = string.Empty;
            pONumberTextBox.Text = string.Empty;

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

                if (reader.HasRows)
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

            if (string.IsNullOrEmpty(dateCreatedTextBox.Text))
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

        protected void dateCreatedTextBox_TextChanged(object sender, EventArgs e)
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