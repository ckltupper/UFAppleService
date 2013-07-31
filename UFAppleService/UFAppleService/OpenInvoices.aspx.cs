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
        decimal TotalAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindData("Balance DESC");
        }

        private void BindData(string orderBy)
        {
            SqlConnection sqlconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            string SQL_QUERY = "SELECT Transactions.SRONumber, SUM(Amount) AS Balance, DateCreated FROM Transactions LEFT JOIN SRO ON Transactions.SRONumber =                      SRO.SRONumber GROUP BY Transactions.SRONumber, DateCreated HAVING SUM(Amount) != 0 ORDER BY " + orderBy;
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

        protected void OpenInvoicesGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Header && e.Item.ItemType != ListItemType.Footer)
            {
                TotalAmount += decimal.Parse(e.Item.Cells[2].Text);
                amountTotalLabel.Text = TotalAmount.ToString("c");
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                e.Item.Cells[0].Text = "Total:";
                e.Item.Cells[2].Text = TotalAmount.ToString("c");
            }
        }
    }
}