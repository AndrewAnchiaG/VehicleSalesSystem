using SalesSystem.Data;
using SalesSystem.Utilities;

namespace SalesSystem.Models
{
    public class ServiceClient
    {
        public List<Client> GetAllActiveUsers()
        {
            return new RepositoryClient().GetAllActiveUsers();
        }

        public bool DeleteClient(int Id)
        {
            return new RepositoryClient().DeleteClient(Id);
        }

    }
}
