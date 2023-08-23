using System.Data;
using SalesSystem.Utilities;
using System.Data.SqlClient;


namespace SalesSystem.Data
{
    public class RepositoryVehicle
    {
        public bool InsertVehicle(Vehicle vehicle)
        {
            bool resolution;
            try
            {
                var conn = new DBContext();
                using (var connection = new SqlConnection(conn.GetConnectionString()))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("InsertVehicle", connection);
                    cmd.Parameters.AddWithValue("Code", vehicle.Code);
                    cmd.Parameters.AddWithValue("Model", vehicle.Model);
                    cmd.Parameters.AddWithValue("Mark", vehicle.Mark);
                    cmd.Parameters.AddWithValue("Year", vehicle.Year);
                    cmd.Parameters.AddWithValue("Color", vehicle.Color);
                    cmd.Parameters.AddWithValue("Passenger", vehicle.Passenger);
                    cmd.Parameters.AddWithValue("Tire", vehicle.Tire);
                    cmd.Parameters.AddWithValue("Engine", vehicle.Engine);
                    cmd.Parameters.AddWithValue("Fuel", vehicle.Fuel);
                    cmd.Parameters.AddWithValue("Tank", vehicle.Tank);
                    cmd.Parameters.AddWithValue("Type", vehicle.Type);
                    cmd.Parameters.AddWithValue("Count", vehicle.Count);
                    cmd.Parameters.AddWithValue("Price", vehicle.Price);
                    cmd.Parameters.AddWithValue("Entry", vehicle.Entry);
                    cmd.Parameters.AddWithValue("EntryBy", vehicle.EntryBy);
                    cmd.Parameters.AddWithValue("Status", vehicle.Status);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                resolution = true;
            }
            catch (Exception)
            {
                resolution = false;
            }
            return resolution;
        }

        public List<Vehicle> SelectAllActiveVehicles()
        {
            var listVehicle = new List<Vehicle>();
            var conn = new DBContext();

            using (var sqlconn = new SqlConnection(conn.GetConnectionString()))
            {
                sqlconn.Open();
                SqlCommand cmd = new("SelectAllActiveVehicle", sqlconn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                using var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    listVehicle.Add(FillVehicle(dr));
                }
            }
            return listVehicle;
        }

        private Vehicle FillVehicle(SqlDataReader dr) {
            //DateTime DateTimeClass = Convert.ToDateTime(dr["Birth"].ToString());
            Vehicle client = new()
            {
                Id = Convert.ToInt32(dr["Id"]),
                Code = Convert.ToInt32(dr["Code"]),
                Model = dr["Model"].ToString(),
                Mark = dr["Mark"].ToString(),
                Year = Convert.ToInt32(dr["Year"]),
                Color = dr["Color"].ToString(),
                Passenger = Convert.ToInt32(dr["Passenger"]),
                Tire = dr["Tire"].ToString(),
                Engine = dr["Engine"].ToString(),
                Fuel = dr["Fuel"].ToString(),
                Type = Convert.ToInt32(dr["Type"]),
                Tank = Convert.ToInt32(dr["Tank"]),
                Count = Convert.ToInt32(dr["Count"]),
                Price = Convert.ToDouble(dr["Price"]),
                Entry = Convert.ToDateTime(dr["Entry"]),
                EntryBy = Convert.ToInt32(dr["EntryBy"]),
                Status = Convert.ToInt32(dr["Status"])
            };
            return client;
        }
   
    }
}

