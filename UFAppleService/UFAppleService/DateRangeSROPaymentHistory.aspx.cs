using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFAppleService
{
    public partial class DateRangeSROPaymentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            beginningDateTextBox.Focus();   
        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            DateRangePaymentHistoryGridDataSource.SelectParameters["DateMin"].DefaultValue = beginningDateTextBox.Text;
            DateRangePaymentHistoryGridDataSource.SelectParameters["DateMax"].DefaultValue = endDateTextBox.Text;
        }
    }
}