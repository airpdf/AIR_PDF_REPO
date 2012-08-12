using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace McvTest1.Controllers
{
    public class HelloWorldController : Controller
    {
        //
        // GET: /HelloWorld/

        /*
        public String  Index()
        {
            return "Hello World! <br />";
        }
        */

        public ActionResult Index()
        {
            return View();
        }
    }
}
