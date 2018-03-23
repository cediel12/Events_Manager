using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Events.Services;

namespace Events.Models
{
    public class User_Model
    {
        //string User_Name { get => User_Name; set => User_Name = value; }

        public string Email { get; set; }
        public string Password { get; set; }


        private User_Service user = new User_Service();
        public bool register(int fk)
        {
            return user.Register(this, fk);
        }
    

        public bool login()
        {
            return user.Login(this);
        }


        public System.Data.DataTable GetAllUsers()
        {
            return user.GetAllUsers();
        }
        public System.Data.DataTable GetAllPeople()
        {
            return user.GetAllPeople();
        }
    }
}