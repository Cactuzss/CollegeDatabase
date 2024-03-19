using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabasePractice.Models
{
    public class students
    {
        public int id { get; set; }
        public string full_name { get; set; }
        public int faculty_id { get; set; }
        public int speciality_id { get; set; }
        public DateTime birth_date { get; set; }
        public string contact_mail { get; set; }
        public string contact_phone { get; set; }
    }
}
