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
                    "Select COAID From ChartofAccounts Where COAID LIKE '1%'");
                accountDropDown.DataTextField = "COAID";
                accountDropDown.DataSource = ds;
                accountDropDown.DataBind();
            }
            
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.StoredProcedure };
                sqlcmd.CommandText = "NewCharge";
                sqlcmd.Parameters.AddWithValue("@SRONumber", sROTextBox.Text);
                sqlcmd.Parameters.AddWithValue("@COAID", accountDropDown.SelectedValue);
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
        }

        protected void accountDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            sqlconn.Open();
            SqlCommand sqlcmd = new SqlCommand() { Connection = sqlconn, CommandType = CommandType.Text };
            sqlcmd.CommandText = "Select * From ChartofAccounts Where COAID = @COAID";
            SqlDataAdapter sqlda = new SqlDataAdapter(sqlcmd);

            sqlcmd.Parameters.AddWithValue("@COAID", accountDropDown.SelectedValue);
            sqlda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                accountDescriptionLabel.Text = dt.Rows[0]["Description"].ToString();
                
            }

            sqlconn.Close();
        }

        protected void accountDropDownDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            accountDropDownDataSource.SelectParameters["AccountNumber"].DefaultValue = accountDropDown.SelectedValue;
        }

       
    }
}