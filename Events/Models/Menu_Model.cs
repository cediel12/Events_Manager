using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Connection;

namespace Events.Models
{
    public class Menu_Model
    {
        connection con = new connection();

        private System.Data.DataTable GetMenu(int rol)
        {//modificarla inner join
            return con.EjecutarConsulta("SELECT DISTINCT  v.Url as 'Url_Vista', v.Titulo as 'Titulo_Vista', sv.Url as 'Url_SubVista', sv.Titulo as 'Titulo_SubVista' FROM Rol as r INNER JOIN Vistas_Roles as vr on vr.fk_Rol = r.id_Rol INNER JOIN Vistas as v on vr.fk_Vista = v.id_Vista INNER JOIN Sub_Vistas as sv on sv.fk_Vista = v.id_Vista WHERE r.id_Rol=" + rol + "; ");
        }




        public Dictionary<string[],string[]> MiMenu(int role)
        {
            System.Data.DataTable dt = GetMenu(role);
            Dictionary<string[],string[]> dic =new Dictionary<string[],string[]>();

            string temp = "";
            List<string> array = new List<string>();
            foreach (System.Data.DataRow dr in dt.Rows)
            {
                
                if(dr["Titulo_Vista"].ToString()!=temp){
                    string[] temporal = {dr["Url_Vista"].ToString(), dr["Titulo_Vista"].ToString() };
                    dic.Add(temporal,getter(array));
                    temp = dr["Titulo_Vista"].ToString();
                    array = new List<string>();
                }else{
                    array.Add(dr["Url_SubVista"].ToString());
                    array.Add(dr["Titulo_SubVista"].ToString()); 
                }

            }
            return dic;
        }

        public int obtFk(string fk)
        {
            System.Data.DataRow dr = (con.EjecutarConsulta("Select fk_Rol as t from Usuario where Email='" + fk + "'").Rows[0]);
            return int.Parse(dr["t"].ToString());
        }

        public string[] getParameter(){
            System.Data.DataTable temp = con.EjecutarConsulta("SELECT Icono, Nombre FROM Empresa WHERE id_Empresa=1");
             string []ret={temp.Rows[0].ToString(), temp.Rows[1].ToString()};
            return ret;
        }

        public string[] getter(List<string> t){
            int i = 0;
            string[] res = new string[t.Capacity];
            foreach (string iterator in t)
            {
                res[i] = iterator;
                i++;
            }
            return res;
        }

    }
}