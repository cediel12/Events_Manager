using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Events.Models;

namespace Events.Controllers
{
    public class AccountController : Controller
    {
        Menu_Model mi = new Menu_Model();
        // GET: acoount
        public ActionResult Index()
        {
            @ViewBag.menu= mi.GetMenu(mi.obtFk(Session["Email"].ToString()));
           // @ViewBag.hola = aux.getParameter()[0];
            if(Convert.ToString(Session["control"])=="Login"){
                return View(); 
            }else{
                return RedirectToAction("../Home/Login");
            }

        }
    }
}