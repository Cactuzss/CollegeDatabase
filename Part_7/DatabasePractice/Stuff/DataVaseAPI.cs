using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace DatabasePractice.Stuff
{
    internal static class DataVaseAPI
    {
        public enum Account_types
        {
            None,
            Admin,
            User
        };

        public static Account_types Authorize(string login, string password)
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                var usrs = db.application_users.ToList();

                foreach (var u in usrs)
                {
                    if (u.logen == login)
                    {
                        if (u.passwodr == password)
                        {
                            if (u.is_admin == false) return Account_types.User;
                            else return Account_types.Admin;
                        }
                    }
                }

                return Account_types.None;
            }
        }
        public static List<Models.grades> GetGrades()
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                return db.grades.ToList();
            }
        }
        public static List<Models.students> GetStudents()
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                return db.students.ToList();
            }
        }
        public static List<Models.disciplines> GetDisciplines()
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                return db.disciplines.ToList();
            }
        }
        public static List<Models.adresses> GetAdresses()
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                return db.adresses.ToList();
            }
        }
        public static List<Models.faculties> GetFaculties()
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                return db.faculties.ToList();
            }
        }


        public static bool EditDisciplines(Models.disciplines disc)
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                var entity = db.disciplines.FirstOrDefault(item => item.id == disc.id);
                if (entity == null) return false;

                entity.title = disc.title;
                entity.hours_of_study = disc.hours_of_study;
                entity.descript = disc.descript;

                db.SaveChanges();

                return true;
            }
        }

        public static bool EditAdresses(Models.adresses disc)
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                var entity = db.adresses.FirstOrDefault(item => item.id == disc.id);
                if (entity == null) return false;

                entity.city = disc.city;
                entity.district = disc.district;
                entity.street = disc.street;
                entity.house_number = disc.house_number;

                db.SaveChanges();

                return true;
            }
        }


        public static bool DeleteAdresses(Models.adresses disc)
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                var itemToRemove = db.adresses.SingleOrDefault(x => x.id == disc.id); //returns a single item.

                if (itemToRemove != null)
                {
                    db.adresses.Remove(itemToRemove);
                    db.SaveChanges();
                }

                return true;
            }
        }
        public static bool DeleteGrades(Models.grades disc)
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                var itemToRemove = db.grades.SingleOrDefault(x => x.id == disc.id); //returns a single item.

                if (itemToRemove != null)
                {
                    db.grades.Remove(itemToRemove);
                    db.SaveChanges();
                }

                return true;
            }
        }
    }
}
