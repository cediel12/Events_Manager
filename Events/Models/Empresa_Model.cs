using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Connection;

namespace Events.Models
{
    public class Empresa_Model
    {
        private  connection con = new connection();
        string NIT { get; set; }
        string Nombre { get; set; }
        string Logo { get; set; }

        public bool Create() {
            return true;
        }

        public System.Data.DataTable GetEmpresa() {
            return new System.Data.DataTable();
        }

        public bool AlterEmpresa() {
            return true;
        }

        public bool DeleteEmpresa() {
            return true;
        }

    }
}