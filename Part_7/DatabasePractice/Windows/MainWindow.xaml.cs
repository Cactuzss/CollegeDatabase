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
using System.Windows.Navigation;
using System.Windows.Shapes;
using DatabasePractice.Stuff;
using DatabasePractice.Windows;
using Microsoft.EntityFrameworkCore;

namespace DatabasePractice
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string login = Loginbox.Text;
            string password = Passwordbox.Password;

            switch(DataVaseAPI.Authorize(login, password))
            {
                case DataVaseAPI.Account_types.User:
                    ContextData.CurrentAccount = DataVaseAPI.Account_types.User;
                    // MessageBox.Show("User");
                    break;
                case DataVaseAPI.Account_types.Admin:
                    ContextData.CurrentAccount = DataVaseAPI.Account_types.Admin;
                    //MessageBox.Show("Admin");
                    break;
                case DataVaseAPI.Account_types.None:
                    MessageBox.Show("There is no accounts like this");
                    break;

                default:
                    break;
            }

            if (ContextData.CurrentAccount != DataVaseAPI.Account_types.None)
            {
                Tables window = new Tables();
                this.Hide();
                window.Show();
            }
        }
    }
}
