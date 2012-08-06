using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using McvTest1.Models;
using System.Diagnostics;

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

        public ActionResult Upload()
        {
            Process pc = new Process();
            String currentPath = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
            //ProcessStartInfo psi = new ProcessStartInfo(currentPath + "/Flash/pdf2swf.exe", currentPath+"/Flash/testPDF.pdf" +" -o " +currentPath+"/Flash/testPDF.swf");
            //pc.StartInfo = psi;
            pc.StartInfo.FileName = currentPath + "\\Flash\\pdf2swf.exe";
            pc.StartInfo.Arguments = currentPath + "\\Flash\\testPDF.pdf" + " -o " + currentPath + "\\Flash\\testPDF.swf";
            pc.Start();
            pc.WaitForExit();
            pc.Close();
            return View();

        }
    }
}
