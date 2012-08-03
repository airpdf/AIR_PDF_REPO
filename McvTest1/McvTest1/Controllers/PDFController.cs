using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using McvTest1.Models;

namespace McvTest1.Controllers
{
    public class PDFController : Controller
    {
        //
        // GET: /PDF/

        PDFDbContext db = new PDFDbContext();

        public ActionResult Index()
        {
            var pdfs = from p in db.PDFs
            //var pdfs = from p in db.dbe8a4fca9b69347d69e47a09701772bdd
                       where p.uploadTime > new DateTime(2007, 08, 30)
                       select p;
            return View(pdfs.ToList());
        }

    }
}
