using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Connection;
using Events.Models;

namespace Events.Services
{
    public class Vistas_Service
    {
        private connection con = new connection();
        public System.Data.DataTable getVistas()
        {
            return con.EjecutarConsulta("SELECT * FROM Vistas");
        }

        public bool CreateVista(Vistas_Model vm)
        {
            try
            {
                return con.EjecutarOperacion("CALL insert_Vistas('" + vm.Url + "','" + vm.Titulo + "','" + vm.Fabicon + "')");
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool DeleteVista(string titulo)
        {
            return con.EjecutarOperacion("UPDATE  Vistas set Estado='Inactiva' WHERE Titulo='" + titulo + "';");
        }

        public bool UpdateVista(string titulo)
        {
            return con.EjecutarOperacion("UPDATE  Vistas set Estado='Activa' WHERE Titulo='" + titulo + "';");
        }
    }
}