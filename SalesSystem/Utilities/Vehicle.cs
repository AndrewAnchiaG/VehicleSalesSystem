using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Text.RegularExpressions;

namespace SalesSystem.Utilities
{
    public class Vehicle
    {

        public int? Id { get; set; }

        [Required]
        public int? Code { get; set; }

        [Required]
        public string? Model { get; set; }

        [Required]
        public string? Mark { get; set; }

        [Required]
        public int? Year { get; set; }

        [Required]
        public string? Color { get; set; }

        [Required]
        public int? Passenger { get; set; }

        [Required]
        public string? Tire { get; set; }

        [Required]
        public string? Engine { get; set; }

        [Required]
        public string? Fuel { get; set; }

        [Required]
        public int? Tank { get; set; }

        [Required]
        public int? Type { get; set; }

        [Required]
        public int? Count { get; set; }

        [Required]
        public double? Price { get; set; }

        [Required]
        public DateTime? Entry { get; set; }

        [Required]
        public int? EntryBy { get; set; }

        public int? Status { get; set; }

    }
}
