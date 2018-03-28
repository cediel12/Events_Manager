using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Events.Models
{
    public class People_Model
    {
        Services.People_Service ps = new Services.People_Service();
        public string Fecha_Nacimiento { get; set; }
        public int Identificacion { get; set; }
        public string Nombre1 { get; set; }
        public int Telefono { get; set; }
        public string Nombre2 { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public string Genero { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public System.Data.DataTable queryGenero()
        {
            return ps.queryGenero();
        }



        public bool createPeople()
        {
            return ps.CrearPersona(this);
        }
    }
}