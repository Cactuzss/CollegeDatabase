using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;

namespace DatabasePractice.Models
{
    public class adresses
    {
        public int id { get; set; }
        public string? city { get; set; }
        public string? district { get; set; }
        public string? street { get; set; }
        public string? house_number { get; set; }
    }
}
