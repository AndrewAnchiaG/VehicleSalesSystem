using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using SalesSystem.Models;
using SalesSystem.Utilities;

namespace SalesSystem.Controllers
{
    public class VehicleController : Controller
    {
        // GET: VehicleController
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListVehicles()
        {
            List<Vehicle> vehicles = new ServiceVehicle().SelectAllActiveVehicles();
            return View(vehicles);
        }

        // GET: VehicleController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: VehicleController/Create
        public ActionResult Create()
        {

            return View();

        }

        // POST: VehicleController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Vehicle vehicle)
        {
            vehicle.Entry = DateAndTime.Now;
            vehicle.Status = 1;
            bool respuesta = new ServiceVehicle().InsertVehicle(vehicle);
            if (respuesta)
            {
                return RedirectToAction("ListVehicles");
            }
            else
            {
                return RedirectToAction("Error", "Home");
            }
        }

        // GET: VehicleController/Edit/5
        public ActionResult Edit(int id)
        { 
            return View();
        }

        // POST: VehicleController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: VehicleController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: VehicleController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
