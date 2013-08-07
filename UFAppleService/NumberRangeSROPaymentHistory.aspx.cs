using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFAppleService
{
    public partial class NumberRangeSROPaymentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            beginningSROTextBox.Focus();
        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            NumberRangePaymentHistoryGridDataSource.SelectParameters["SROMin"].DefaultValue = beginningSROTextBox.Text;
            NumberRangePaymentHistoryGridDataSource.SelectParameters["SROMax"].DefaultValue = endSROTextBox.Text;
        }
    }
}