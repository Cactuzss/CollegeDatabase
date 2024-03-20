using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabasePractice.Models
{
    public class specialities
    {
        public int id { get; set; }
        public string? title { get; set; }
        public int? faculty_id { get; set; }
        public int? qualification { get; set; }
    }
}
