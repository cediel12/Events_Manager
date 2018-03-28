using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Events.Models
{
    public class Menu_Model
    {
        private Services.Menu_Service ms = new Services.Menu_Service();

        public System.Data.DataTable GetMenu(int rol)
        {
            return ms.GetMenu(rol);
        }

        public int obtFk(string fk)
        {
            return ms.obtFk(fk);
        }
    }

}