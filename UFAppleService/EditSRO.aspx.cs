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
            sROTextBox.Focus();
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

        protected void saveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.Text };
                sqlcmd.CommandText = "UPDATE SRO SET DateCreated='" + dateCreatedTextBox.Text + "'" + ",  PONumber='" + pONumberTextBox.Text + "'";
                sqlconn.Open();
                sqlcmd.ExecuteNonQuery();
                sqlconn.Close();
            }
        }
    }
}