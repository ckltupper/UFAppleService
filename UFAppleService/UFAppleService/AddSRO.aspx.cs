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
        }
    }
}