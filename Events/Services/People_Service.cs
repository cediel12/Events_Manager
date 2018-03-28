using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Events.Models;
using Connection;

namespace Events.Services
{
    public class People_Service
    {

        public bool CrearPersona(People_Model pm)
        {
            try
            {
                System.Data.DataRow dd = conn.EjecutarConsulta("SELECT id_Genero as t FROM Genero WHERE Tipo='" + pm.Genero + "';").Rows[0];
                int fk_genero = int.Parse(dd["t"].ToString());
                conn.EjecutarOperacion("CALL insert_Persona('" + pm.Fecha_Nacimiento + "'," + pm.Identificacion + ",'" + pm.Nombre1 + "','" + pm.Nombre2 + "','" + pm.Apellido1 + "','" + pm.Apellido2 + "'," + pm.Telefono + "," + fk_genero + ")");
                return conn.EjecutarOperacion("CALL insert_Usuario('" + pm.Email + "','" + pm.Password + "'," + fk_genero + ");");
            }
            catch (Exception)
            {
                return false;
            }
            //return pm.Fecha_Nacimiento;
        }
        public System.Data.DataTable queryGenero()
        {
            return conn.EjecutarConsulta("SELECT Tipo FROM Genero");
        }
        private connection conn = new connection();
    }
}
