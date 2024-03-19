using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DatabasePractice.Windows
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Tables : Window
    {
        DataGrid Current;

        DataGrid Grades;
        DataGrid Students;
        DataGrid Disciplines;
        DataGrid Lecturers;
        DataGrid Faculties;

        DataGrid ConstructWithColumns(String[] strings)
        {
            DataGrid res = new DataGrid();

            foreach(var str in strings)
            {
                res.Columns.Add(new DataGridTextColumn
                {
                    Header = str,
                    Binding = new Binding(str),
                    Width = DataGridLength.SizeToHeader
                });
            }

            return res;
        }

        public Tables()
        {
            InitializeComponent();

            Grades =        ConstructWithColumns(new String[] { "id", "student_id", "discipline_id", "result"});
            Students =      ConstructWithColumns(new String[] { "id", "full_name", "faculty_id", "speciality_id", "birth_date", "contact_mail", "contact_phone" });
            Disciplines =   ConstructWithColumns(new String[] { "id", "title", "departament_id", "hours", "description", "control_fofm_id"});
            Lecturers =     ConstructWithColumns(new String[] { "id", "full_name", "departament_id", "degree", "contact_mail", "contact_phone" });
            Faculties =     ConstructWithColumns(new String[] { "id", "title", "dean", "contact_mail", "contact_phone" });

            Current = Grades;

            MainTables.Children.Add(Current);
        }

        private void GetGrades(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Current = Grades;
            MainTables.Children.Add(Current);
        }

        private void GetStudents(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Current = Students;
            MainTables.Children.Add(Current);
        }

        private void GetDisciplines(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Current = Disciplines;
            MainTables.Children.Add(Current);
        }

        private void GetLecturers(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Current = Lecturers;
            MainTables.Children.Add(Current);
        }

        private void GetFaculties(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Current = Faculties;
            MainTables.Children.Add(Current);
        }
    }
}
