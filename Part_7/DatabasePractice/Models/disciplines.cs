using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabasePractice.Models
{
    public class disciplines
    {
        public int id { get; set; }
        public int? departament_id { get; set; }
        public int? control_fofm_id { get; set; }
        public string? title { get; set; }
        public int? hours_of_study { get; set; }
        public String? descript { get; set; }
    }
}
