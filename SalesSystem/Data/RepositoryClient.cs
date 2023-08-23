using System.Data;
using SalesSystem.Utilities;
using System.Data.SqlClient;

namespace SalesSystem.Data
{
    public class RepositoryClient
    {
        public List<Client> GetAllActiveUsers()
        {
            var listUser = new List<Client>();
            var conn = new DBContext();

            using (var sqlconn = new SqlConnection(conn.GetConnectionString()))
            {
                sqlconn.Open();
                SqlCommand cmd = new("SelectAllActiveClient", sqlconn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                using var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    listUser.Add(FillClient(dr));
                }
            }
            return listUser;
        }

        internal bool DeleteClient(int id)
        {
            throw new NotImplementedException();
        }

        private Client FillClient(SqlDataReader dr) {
            DateTime DateTimeClass = Convert.ToDateTime(dr["Birth"].ToString());
            Client client = new() {
                Id = Convert.ToInt32(dr["Id"]),
                Code = Convert.ToInt32(dr["Code"]),
                DNI = dr["DNI"].ToString(),
                Name = dr["Name"].ToString(),
                FirstName = dr["FirstName"].ToString(),
                LastName = dr["LastName"].ToString(),
                Email = dr["Email"].ToString(),
                Birth = DateTimeClass,
                Mobile = dr["Mobile"].ToString(),
                Phone = dr["Phone"].ToString(),
                RegisterDate = Convert.ToDateTime(dr["RegisterDate"]),
                Status = Convert.ToInt32(dr["Status"])
            };
            return client;
        }


        public bool InsertClient(Client client) {




            return true;
        }
        
    

    }
}
