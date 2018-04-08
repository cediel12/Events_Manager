﻿using System;
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
            ViewBag.respuesta = 1;
            return View();
        }

        [HttpPost]
        public ActionResult Sign_up(People_Model pm) {
            //ViewBag.test=Request["Email"]; 
            if(pm.createPeople()){
                ViewBag.respuesta = 1;
                return RedirectToAction("../Home/Login");
            }else{
                ViewBag.genero = pm.queryGenero();
                ViewBag.respuesta = 0;
                return View();
            }  
        }
        [HttpGet]
        public ActionResult Login()
        {
            Session["Email"] = "";
            Session["control"] = "Logout";
            ViewBag.respuesta = 1;
            return View();
        }

        [HttpPost]
        public ActionResult Login(User_Model usr)
        {
            if (usr.login())
            {
                Session["Email"] = usr.Email;
                Session["control"] = "Login";
                ViewBag.respuesta = 1;
                return RedirectToAction("../account/Index");
            }
            else {
                ViewBag.respuesta = 0;
                return View();
            }
       
        }
        public ActionResult About() {
            return View();
        }
    }
}