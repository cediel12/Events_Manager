using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Events.Models;

namespace Events.Controllers
{
    public class HomeController : Controller
    {
        
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Sign_up() {
            People_Model people = new People_Model();
            ViewBag.genero = people.queryGenero();
            return View();
        }

        [HttpPost]
        public ActionResult Sign_up(People_Model pm) {
            //ViewBag.test=Request["Email"];
           
            if(pm.createPeople()){
                return RedirectToAction("../Home/Login");
            }else{
                ViewBag.genero = pm.queryGenero();
                return View();
            }  
        }
        [HttpGet]
        public ActionResult Login()
        {
            Session["Email"] = "";
            Session["control"] = "Logout";
            return View();
        }

        [HttpPost]
        public ActionResult Login(User_Model usr)
        {
            if (usr.login())
            {
                Session["Email"] = usr.Email;
                Session["control"] = "Login";
                return RedirectToAction("../account/Index");
            }
            else {
                return View();
            }
       
        }
        public ActionResult About() {
            return View();
        }
    }
}