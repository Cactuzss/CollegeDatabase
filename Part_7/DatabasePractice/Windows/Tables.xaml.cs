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

        DataGrid Grades = new DataGrid();
        DataGrid Students = new DataGrid();
        DataGrid Disciplines = new DataGrid();
        DataGrid Adresses = new DataGrid();
        DataGrid Faculties = new DataGrid();


        enum GridState
        {
            GRADES,
            STUDENTS,
            DISCIPLINES,
            ADRESSES,
            FACULTIES
        }

        GridState CurrentState;

        Button CreateButon(string text, RoutedEventHandler func)
        {
            Button res = new Button();

            res.Width = 150;
            res.Height = 25;
            res.Content = text;
            res.Click += func;

            return res;
        }

        Grid CreateButtons()
        {
            Grid res = new Grid();

            for (int i = 0; i < 5; i++)
                res.RowDefinitions.Add(new RowDefinition());

            res.ColumnDefinitions.Add(new ColumnDefinition());
            res.ColumnDefinitions.Add(new ColumnDefinition());

            var tmp = CreateButon("Grades", GetGrades);
            tmp.SetValue(Grid.RowProperty, 0);
            tmp.SetValue(Grid.ColumnSpanProperty, 2);
            res.Children.Add(tmp);

            tmp = CreateButon("Students", GetStudents);
            tmp.SetValue(Grid.RowProperty, 1);
            tmp.SetValue(Grid.ColumnSpanProperty, 2);
            res.Children.Add(tmp);

            tmp = CreateButon("Disciplines", GetDisciplines);
            tmp.SetValue(Grid.RowProperty, 2);
            tmp.SetValue(Grid.ColumnSpanProperty, 2);
            res.Children.Add(tmp);

            tmp = CreateButon("Adresses", GetAdresses);
            tmp.SetValue(Grid.RowProperty, 3);
            tmp.SetValue(Grid.ColumnSpanProperty, 2);
            res.Children.Add(tmp);

            tmp = CreateButon("Faculties", GetFaculties);
            tmp.SetValue(Grid.RowProperty, 4);
            tmp.SetValue(Grid.ColumnSpanProperty, 2);
            res.Children.Add(tmp);


            if (Stuff.ContextData.CurrentAccount == Stuff.DataVaseAPI.Account_types.Admin)
            {
                res.RowDefinitions.Add(new RowDefinition());
                tmp = CreateButon("Edit", EditButton);
                tmp.Width = 75;
                tmp.SetValue(Grid.RowProperty, 5);
                res.Children.Add(tmp);

                res.RowDefinitions.Add(new RowDefinition());
                tmp = CreateButon("Delete", DeleteButton);
                tmp.Width = 75;
                tmp.SetValue(Grid.RowProperty, 5);
                tmp.SetValue(Grid.ColumnProperty, 1);
                res.Children.Add(tmp);
            }

            return res;
        }

        public Tables()
        {
            InitializeComponent();

            Grades.ItemsSource = Stuff.DataVaseAPI.GetGrades();
            Current = Grades;
            CurrentState = GridState.GRADES;
            Buttons.Children.Add(CreateButtons());
            MainTables.Children.Add(Current);
        }

        private void GetGrades(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Grades.ItemsSource = Stuff.DataVaseAPI.GetGrades();
            Current = Grades;
            CurrentState = GridState.GRADES;
            MainTables.Children.Add(Current);
        }

        private void GetStudents(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Students.ItemsSource = Stuff.DataVaseAPI.GetStudents();
            Current = Students;
            CurrentState = GridState.STUDENTS;
            MainTables.Children.Add(Current);
        }

        private void GetDisciplines(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Disciplines.ItemsSource = Stuff.DataVaseAPI.GetDisciplines();
            Current = Disciplines;
            CurrentState = GridState.DISCIPLINES;
            MainTables.Children.Add(Current);
        }

        private void GetAdresses(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Adresses.ItemsSource = Stuff.DataVaseAPI.GetAdresses();
            Current = Adresses;
            CurrentState = GridState.ADRESSES;
            MainTables.Children.Add(Current);
        }

        private void GetFaculties(object sender, RoutedEventArgs e)
        {
            MainTables.Children.Clear();
            Faculties.ItemsSource = Stuff.DataVaseAPI.GetFaculties();
            Current = Faculties;
            CurrentState = GridState.FACULTIES;
            MainTables.Children.Add(Current);
        }

        private void EditButton(object sender, RoutedEventArgs e)
        {
            switch (CurrentState)
            {
                case GridState.GRADES:
                    MessageBox.Show("Cant edit the table");
                    break;
                case GridState.ADRESSES:
                    Models.adresses adresses = (Models.adresses)Current.SelectedItem;
                    Stuff.DataVaseAPI.EditAdresses(adresses);
                    break;
                case GridState.DISCIPLINES:
                    Models.disciplines disciplines = (Models.disciplines)Current.SelectedItem;
                    Stuff.DataVaseAPI.EditDisciplines(disciplines);
                    break;
                case GridState.FACULTIES:
                    MessageBox.Show("Cant edit the table");
                    break;
                case GridState.STUDENTS:
                    MessageBox.Show("Cant edit the table");
                    break;

                default: break;
            }
        }

        private void DeleteButton(object sender, RoutedEventArgs e)
        {
            switch (CurrentState)
            {
                case GridState.GRADES:
                    Models.grades grades = (Models.grades)Current.SelectedItem;
                    Stuff.DataVaseAPI.DeleteGrades(grades);
                    break;
                case GridState.ADRESSES:
                    Models.adresses adresses = (Models.adresses)Current.SelectedItem;
                    Stuff.DataVaseAPI.DeleteAdresses(adresses);
                    break;
                case GridState.DISCIPLINES:
                    MessageBox.Show("Cant edit the table");
                    break;
                case GridState.FACULTIES:
                    MessageBox.Show("Cant edit the table");
                    break;
                case GridState.STUDENTS:
                    MessageBox.Show("Cant edit the table");
                    break;

                default: break;
            }
        }


        
    }
}
