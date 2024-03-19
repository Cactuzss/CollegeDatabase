using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;

namespace DatabasePractice
{
    class ApplicationContext : DbContext
    {
        public DbSet<Models.adresses> Adresses { get; set; } = null!;
        public DbSet<Models.departaments> Departaments { get; set; } = null!;
        public DbSet<Models.disciplines> Disciplines { get; set; } = null!;
        public DbSet<Models.faculties> Faculties { get; set; } = null!;
        public DbSet<Models.grades> Grades{ get; set; } = null!;
        public DbSet<Models.specialities> Specialities{ get; set; } = null!;
        public DbSet<Models.students> Students { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=kyserv;Database=_Institute_;Trusted_Connection=True;");
        }
    }
}
