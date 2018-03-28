using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Connection;
using Events.Models;
namespace Events.Services
{
    public class SubVista_Service
    {
        private connection con = new connection();
        public System.Data.DataTable getSubVistas()
        {
            return con.EjecutarConsulta("SELECT * FROM SubVistas");
        }

        public bool CreateSubVista(SubVista_Model svm)
        {
            return con.EjecutarOperacion("CALL insert_Vistas('" + svm.Url + "','" + svm.Titulo + "','" + svm.fk_Vistas + "')");
        }

        public bool DeleteSubVista(string titulo)
        {
            return con.EjecutarOperacion("UPDATE  SubVistas set Estado=0 WHERE Titulo='" + titulo + "';");
        }

        public bool UpdateSubVista(string titulo)
        {
            return con.EjecutarOperacion("UPDATE  SubVistas set Estado=1 WHERE Titulo='" + titulo + "';");
        }
    }
}