using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Events.Models
{
    public class Vistas_Model
    {
        private Services.Vistas_Service vs = new Services.Vistas_Service();
        public string Url { get; set; }
        public string Titulo { get; set; }
        public string Fabicon { get; set; }

        public System.Data.DataTable getVistas()
        {
            return vs.getVistas();
        }

        public bool CreateVista()
        {
            return vs.CreateVista(this);
        }

        public bool DesativeVista()
        {
            return vs.DeleteVista(this.Titulo);
        }

        public bool ActiveVista()
        {
            return vs.UpdateVista(this.Titulo);
        }
    }
}