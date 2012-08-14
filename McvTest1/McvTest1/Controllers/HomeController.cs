using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using McvTest1.Models;
using TallComponents.Web.PDF;

namespace McvTest1.Controllers
{
    public class HomeController : Controller
    {

        PDFDbContext db = new PDFDbContext();
        public ActionResult Index()
        {
            var pdfs = from p in db.PDFs
                       //where p.uploadTime>
                       select p;
            return View(pdfs.ToList());
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
