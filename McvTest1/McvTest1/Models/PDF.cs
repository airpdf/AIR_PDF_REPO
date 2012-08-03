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
    }

    public class PDFDbContext : DbContext
    {
        public DbSet<PDF> PDFs { get; set; }
        //public DbSet<PDF> dbe8a4fca9b69347d69e47a09701772bdd { get; set; }
    }
}