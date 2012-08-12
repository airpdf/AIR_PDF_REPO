using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using McvTest1.Models;
using System.Diagnostics;
using System.IO;
using System.Runtime.Remoting.Contexts;
using System.Data.SqlClient;
using Amazon;   // these are part of the AWSSDK.dll that you add to the project
using Amazon.S3;
using Amazon.S3.Model;

namespace McvTest1.Controllers
{
    public class PDFController : Controller
    {
        //
        // GET: /PDF/

        PDFDbContext db = new PDFDbContext();
        const string connect = @"Data Source=49075d28-6279-4710-bebd-a0a201672914.sqlserver.sequelizer.com;
         Initial Catalog=db49075d2862794710bebda0a201672914; Persist Security Info=True;
         User ID=bfuzdzysumjqjlgr; Password=2TcCQkkMgUGLjYGx7TVVBs6HkB6Ah7VhwQz38kzZciWvwuG748PJNBoHWAsnnSEi";


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
            //Convert pdf to swf
            /*
            Process pc = new Process();
            String currentPath = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
            //ProcessStartInfo psi = new ProcessStartInfo(currentPath + "/Flash/pdf2swf.exe", currentPath+"/Flash/testPDF.pdf" +" -o " +currentPath+"/Flash/testPDF.swf");
            //pc.StartInfo = psi;
            pc.StartInfo.FileName = currentPath + "\\Flash\\pdf2swf.exe";
            pc.StartInfo.Arguments = currentPath + "\\Flash\\testPDF2.pdf" + " -o " + currentPath + "\\Flash\\testPDF2.swf";
            pc.Start();
            pc.WaitForExit();
            pc.Close();
             * */

            //Upload pdf file to the server and database 
            
            foreach (string upload in Request.Files)
            {
                if (!helperClass.HasFile(Request.Files[upload])) continue;
                string path = "https://s3-us-west-1.amazonaws.com/airpdfstorage/";
                string filename = Path.GetFileName(Request.Files[upload].FileName);
                DateTime nowTime = DateTime.Now;
                string user = User.Identity.Name.ToString();

                //upload to amazon s3
                string accessKey = "AKIAIO4BEQ2UGFAMHRFQ";
                string secretAccessKey = "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";
                string bucketName = "airpdfstorage";
                string keyName = filename;
                AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKey, secretAccessKey);
                PutObjectRequest request = new PutObjectRequest();

                request.WithInputStream(Request.Files[upload].InputStream);
                request.CannedACL = S3CannedACL.PublicRead;

                request.WithBucketName(bucketName);
                request.WithKey(keyName);
                request.StorageClass = S3StorageClass.ReducedRedundancy; //set storage to reduced redundancy
                client.PutObject(request);
                client.Dispose();

                using (var conn = new SqlConnection(connect))
                {
                    var qry = "INSERT INTO PDFs (Title, Author, uploadTime,fileURL) VALUES (@Title, @Author, @uploadTime, @fileURL)";
                    var cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@Title", filename);
                    cmd.Parameters.AddWithValue("@Author", user);
                    cmd.Parameters.AddWithValue("@uploadTime", nowTime);
                    cmd.Parameters.AddWithValue("@fileURL", Path.Combine(path, filename));
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            
            return View();
        }

        public ActionResult Delete(int id)
        {
            using (var conn = new SqlConnection(connect))
            {
                var qry = "DELETE FROM PDFs WHERE ID = @ID";
                var cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@ID", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }

        
    }

    public static class helperClass
    {
        public static bool HasFile(this HttpPostedFileBase file)
        {
            return (file != null && file.ContentLength > 0) ? true : false;
        }
    }
}
