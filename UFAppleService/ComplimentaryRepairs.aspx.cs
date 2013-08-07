using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFAppleService
{
    public partial class ComplimentaryRepairs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            beginningDateTextBox.Focus();
        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            ComplimentaryRepairGridDataSource.SelectParameters["DateMin"].DefaultValue = beginningDateTextBox.Text;
            ComplimentaryRepairGridDataSource.SelectParameters["DateMax"].DefaultValue = endDateTextBox.Text;
        }
    }
}