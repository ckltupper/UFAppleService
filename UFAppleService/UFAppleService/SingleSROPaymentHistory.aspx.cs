using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace UFAppleService
{
    public partial class SingleSROPaymentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            PaymentHistoryGridDataSource.SelectParameters["SRONumber"].DefaultValue = sROTextBox.Text;
        }
    }
}