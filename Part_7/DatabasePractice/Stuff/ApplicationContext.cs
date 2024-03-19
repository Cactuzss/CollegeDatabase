using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;

namespace DatabasePractice.Stuff
{
    static class ContextData
    {
        static public DataVaseAPI.Account_types CurrentAccount = DataVaseAPI.Account_types.None;
    }

    class ApplicationContext : DbContext
    {
        public DbSet<Models.adresses> adresses { get; set; } = null!;
        public DbSet<Models.departaments> departaments { get; set; } = null!;
        public DbSet<Models.disciplines> disciplines { get; set; } = null!;
        public DbSet<Models.faculties> faculties { get; set; } = null!;
        public DbSet<Models.grades> grades { get; set; } = null!;
        public DbSet<Models.specialities> specialities { get; set; } = null!;
        public DbSet<Models.students> students { get; set; } = null!;
        public DbSet<Models.application_users> application_users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(@"Server=kyserv;Database=_Institute_;Trusted_Connection=True;");
        }
    }
}
