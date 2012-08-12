using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace McvTest1.Models
{
    public class PDF
    {
        public int ID { get; set; }
        public String Title{ get; set; }
        public String Author { get; set; }
        public DateTime uploadTime { get; set; }
        public String fileURL { get; set; }
    }

    public class PDFDbContext : DbContext
    {
        public DbSet<PDF> PDFs { get; set; }
    }
}