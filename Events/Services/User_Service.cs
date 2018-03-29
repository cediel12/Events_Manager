using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Events.Models;
using Connection;

namespace Events.Services
{
    public class User_Service
    {
        private connection conn = new connection();

        public bool Register(User_Model usr, int fk)
        {
            try
            {
                System.Data.DataRow c = conn.EjecutarConsulta("select id_Persona as t from Persona where Identificacion=" + fk).Rows[0];
                conn.EjecutarOperacion("call insert_Usuario('" + usr.Email + "','" + usr.Password + "'," + int.Parse(c["t"].ToString()) + ")");
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Login(User_Model usr)
        {
            return (conn.EjecutarConsulta("call logintemp('" + usr.Email + "','" + usr.Password + "');").Rows.Count > 0) ? true : false;
        }

        public System.Data.DataTable GetAllUsers()
        {
            return conn.EjecutarConsulta("SELECT * FROM Usuario as s inner join Persona as p on p.id_Persona = s.fk_Persona inner join Genero as g on g.id_Genero=p.fk_genero");
        }
    }
}