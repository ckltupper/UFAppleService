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
    public partial class OpenInvoices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            BindData("Balance DESC");

        }

        private void BindData(string orderBy)
        {
            SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            string SQL_QUERY = "SELECT SRONumber, SUM(Amount) AS Balance FROM Transactions GROUP BY SRONumber HAVING SUM(Amount) != 0 ORDER BY " + orderBy;
                SqlCommand cmd = new SqlCommand(SQL_QUERY, sqlconn);

            sqlconn.Open();
            OpenInvoicesGrid.DataSource = cmd.ExecuteReader();
            OpenInvoicesGrid.DataBind();
            sqlconn.Close();
        }

       
        protected void OpenInvoicesGrid_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            BindData(e.SortExpression);
        }
    }
}