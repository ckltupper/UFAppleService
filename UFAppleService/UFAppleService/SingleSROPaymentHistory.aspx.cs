using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;


namespace UFAppleService
{
    public partial class SingleSROPaymentHistory : System.Web.UI.Page
    {
        decimal balanceAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["SRONumber"] != null)
            {
                PaymentHistoryGridDataSource.SelectParameters["SRONumber"].DefaultValue = Request.Params["SRONumber"];

                sROTextBox.Text = Request.Params["SRONumber"];

                balanceLabel.Visible = true;
            }
            else
            {
                sROTextBox.Focus();
            }

        }

        protected void PaymentHistoryGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {


            if (e.Item.ItemType != ListItemType.Header && e.Item.ItemType != ListItemType.Footer)
            {
                balanceAmount += decimal.Parse(e.Item.Cells[4].Text);
                amountBalanceLabel.Text = balanceAmount.ToString("c");
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                e.Item.Cells[0].Text = "Balance:";
                e.Item.Cells[4].Text = balanceAmount.ToString("c");
            }
        }


        protected void viewButton_Click(object sender, EventArgs e)
        {
            PaymentHistoryGridDataSource.SelectParameters["SRONumber"].DefaultValue = sROTextBox.Text;

            balanceLabel.Visible = true;
        }
    }
}