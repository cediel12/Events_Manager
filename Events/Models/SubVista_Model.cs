using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Events.Models
{
    public class SubVista_Model
    {
        private Services.SubVista_Service svs = new Services.SubVista_Service();
        public string Url { get; set; }
        public string Titulo { get; set; }
        public int fk_Vistas { get; set; }

        public System.Data.DataTable getSubVistas()
        {
            return svs.getSubVistas();
        }

        public bool CreateVista()
        {
            return svs.CreateSubVista(this);
        }

        public bool DesativeVista()
        {
            return svs.DeleteSubVista(this.Titulo);
        }

        public bool ActiveVista()
        {
            return svs.UpdateSubVista(this.Titulo);
        }
    }
}