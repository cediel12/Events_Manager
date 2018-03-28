using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Connection;
using Events.Models;
namespace Events.Services
{
    public class Empresa_Service
    {
        private connection con = new connection();
        public string[] getParameter()
        {
            System.Data.DataTable temp = con.EjecutarConsulta("SELECT Icono, Nombre FROM Empresa WHERE id_Empresa=1");
            string[] ret = { temp.Rows[0].ToString(), temp.Rows[1].ToString() };
            return ret;
        }
    }
}