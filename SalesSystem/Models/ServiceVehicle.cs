using SalesSystem.Data;
using SalesSystem.Utilities;

namespace SalesSystem.Models
{
    public class ServiceVehicle
    {
        public bool InsertVehicle(Vehicle vehicle)
        {
            return new RepositoryVehicle().InsertVehicle(vehicle);
        }


        public List<Vehicle> SelectAllActiveVehicles()
        {
            return new RepositoryVehicle().SelectAllActiveVehicles();
        }
    }
}
