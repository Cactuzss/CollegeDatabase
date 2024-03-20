using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabasePractice.Models
{
    public class grades
    {
        public int id { get; set; }
        public int? student_id { get; set; }
        public int? discipline_id { get; set; }
        public string? result { get; set; }
    }
}
