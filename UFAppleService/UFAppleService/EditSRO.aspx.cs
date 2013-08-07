using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace UFAppleService
{
    public partial class EditSRO : System.Web.UI.Page
    {
        string datecreated;
        DateTime TrueDateCreated;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                sROTextBox.Focus();
            }
        }

        protected void findButton_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            sqlconn.Open();
            SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.Text };
            sqlcmd.CommandText = "Select DateCreated, PONumber From SRO Where SRONumber = @SRONumber";
            SqlDataAdapter sqlda = new SqlDataAdapter(sqlcmd);

            sqlcmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
            sqlda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                datecreated = dt.Rows[0]["DateCreated"].ToString();
                TrueDateCreated = DateTime.Parse(datecreated);
                
                dateCreatedTextBox.Text = TrueDateCreated.ToString("d");
                pONumberTextBox.Text = dt.Rows[0]["PONumber"].ToString();
            }

            sqlconn.Close();
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            updateButton.Visible = false;

            if (CheckDate())
            {
                using (SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.Text };
                    sqlcmd.CommandText = "UPDATE SRO SET DateCreated='" + dateCreatedTextBox.Text + "'" + ",  PONumber='" + pONumberTextBox.Text + "'";
                    sqlconn.Open();
                    sqlcmd.ExecuteNonQuery();
                    sqlconn.Close();
                }

                sROTextBox.Text = string.Empty;
                dateCreatedTextBox.Text = string.Empty;
                pONumberTextBox.Text = string.Empty;
            }
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
            CheckDate();
        }
    }
}