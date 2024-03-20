using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabasePractice.Models
{
    public class departaments
    {
        public int id { get; set; }
        public int? faculty_id { get; set; }
        public string? title { get; set; }
        public string? director { get; set; }
        public string? contact_mail { get; set; }
        public string? contact_phone { get; set; }
    }
}
