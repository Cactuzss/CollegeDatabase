using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabasePractice.Models
{
    public class application_users
    {
        public int id { get; set; }
        public string username { get; set; }
        public string logen { get; set; }
        public string passwodr { get; set; }

        public bool is_admin {  get; set; }
    }
}
