using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Connection;


namespace Events.Services
{
    public class Menu_Service
    {
        connection con = new connection();

        public System.Data.DataTable GetMenu(int rol)
        {
            return con.EjecutarConsulta("SELECT DISTINCT v.Url AS 'Url_Vista', v.Titulo AS 'Titulo_Vista', v.Fabicon AS 'Fabicon', sv.Url AS 'Url_SubVista', sv.Titulo AS 'Titulo_SubVista' FROM  Rol AS r INNER JOIN  Vistas_Roles AS vr ON vr.fk_Rol = r.id_Rol INNER JOIN Sub_Vistas AS sv ON vr.fk_SubVista = sv.id_SubVista INNER JOIN Vistas AS v ON sv.fk_Vista = v.id_Vista WHERE r.id_Rol = " + rol + "; ");
        }

        public int obtFk(string fk)
        {
            System.Data.DataRow dr = (con.EjecutarConsulta("Select fk_Rol as t from Usuario where Email='" + fk + "'").Rows[0]);
            return int.Parse(dr["t"].ToString());
        }

    }
}