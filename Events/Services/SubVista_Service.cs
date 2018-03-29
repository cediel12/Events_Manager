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
            try
            {
                return con.EjecutarOperacion("CALL insert_SubVistas('" + svm.Url + "','" + svm.Titulo + "','" + svm.fk_Vistas + "')");
            }
            catch (Exception) {
                return false;
            }
        }

        public bool DeleteSubVista(string titulo)
        {
            return con.EjecutarOperacion("UPDATE  SubVistas set Estado='Inactiva' WHERE Titulo='" + titulo + "';");
        }

        public bool UpdateSubVista(string titulo)
        {
            return con.EjecutarOperacion("UPDATE  SubVistas set Estado='Activa' WHERE Titulo='" + titulo + "';");
        }
    }
}