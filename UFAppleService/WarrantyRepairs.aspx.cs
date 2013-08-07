using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFAppleService
{
    public partial class WarrantyRepairs : System.Web.UI.Page
    {
        decimal TotalAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            beginningDateTextBox.Focus();
        }

        protected void WarrantyRepairsGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Header && e.Item.ItemType != ListItemType.Footer)
            {
                TotalAmount += decimal.Parse(e.Item.Cells[4].Text);
                amountTotalLabel.Text = TotalAmount.ToString("c");
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                e.Item.Cells[0].Text = "Total:";
                e.Item.Cells[4].Text = TotalAmount.ToString("c");
            }
        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            WarrantyRepairGridDataSource.SelectParameters["DateMin"].DefaultValue = beginningDateTextBox.Text;
            WarrantyRepairGridDataSource.SelectParameters["DateMax"].DefaultValue = endDateTextBox.Text;
            totalLabel.Visible = true;
        }
    }
}