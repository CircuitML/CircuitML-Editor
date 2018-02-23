using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DragADrop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)

    { 
    }
    protected void btn_xml_Click(object sender, EventArgs e)
    {
        Session.Add("XMLvalue", Hidden1.Value);
        Response.Redirect("XMLeditor.aspx");
    }
}