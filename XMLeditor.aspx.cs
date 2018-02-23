using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XMLeditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["XMLvalue"] != null)
            {
                txtDraw.Value = Session["XMLvalue"].ToString();
            }
    }
}