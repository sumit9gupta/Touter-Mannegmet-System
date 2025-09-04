﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace TMS_Project
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition(
       "jquery",
       new ScriptResourceDefinition
       {
           Path = "~/Scripts/jquery-3.7.1.min.js",   // your local path
           DebugPath = "~/Scripts/jquery-3.7.1.js", // optional
           CdnPath = "https://code.jquery.com/jquery-3.7.1.min.js",
           CdnDebugPath = "https://code.jquery.com/jquery-3.7.1.js"
       });
        }
    }
}