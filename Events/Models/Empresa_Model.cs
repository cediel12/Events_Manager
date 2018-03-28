using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Events.Models
{
    public class Empresa_Model
    {
        private Services.Empresa_Service es = new Services.Empresa_Service();
        public string NIT { get; set; }
        public string Nombre { get; set; }
        public string Logo { get; set; }

        public bool Create()
        {
            return true;
        }

        public string[] GetEmpresa()
        {
            return es.getParameter();
        }

        public bool AlterEmpresa()
        {
            return true;
        }

        public bool DeleteEmpresa()
        {
            return true;
        }

    }
}