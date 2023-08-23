using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;

namespace SalesSystem.Utilities
{
    public class Bill
    {

        public int? Id { get; set; }

        [Required]
        public int? Consecutive { get; set; }

        [Required]
        public string? NumericalKey { get; set; }

        [Required]
        public int? InternalCode { get; set; }

        [Required]
        public String? SalesPerson { get; set; }

        public int Client { get; set; }

        public List<Vehicle>? Vehicles { get; set; }

        public double? Price { get; set; }

        public double? IVA {get; set;}
        
        public double? Total {get; set; }

        public DateAndTime? Date { get; set; }
        public DateAndTime? Warranty { get; set;  }

        public int? Status { get; set; }
    }
}
