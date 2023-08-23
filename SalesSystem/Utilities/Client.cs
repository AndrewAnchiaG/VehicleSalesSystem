using System.ComponentModel.DataAnnotations;

namespace SalesSystem.Utilities
{
    public class Client
    {

        public int? Id { get; set; }

        [Required]
        [Range(1000, 999999)]
        public int? Code { get; set; }

        [Required(ErrorMessage = "Documento de Identidad Nacional es Requerido")]
        [DataType(DataType.Text)]
        [StringLength(27, ErrorMessage = "El formato recomendado es 801230456", MinimumLength = 8)]
        public string? DNI { get; set; }

        [StringLength(50, MinimumLength = 2)]
        [Required(ErrorMessage = "Nombre de Usuario Requerido")]
        [DataType(DataType.Text)]
        public string? Name { get; set; }

        [Required(ErrorMessage = "I Apellido de Usuario Requerido")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Apellido de Usuario Requerido")]
        [DataType(DataType.Text)]
        public string? FirstName { get; set; }

        [Required(ErrorMessage = "II Apellido de Usuario Requerido")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "II Apellido de Usuario Requerido")]
        [DataType(DataType.Text)]
        public string? LastName { get; set; }

        [StringLength(150, ErrorMessage = "El texto no corresponde a una direccion de correo electrónico", MinimumLength = 6)]
        [EmailAddress(ErrorMessage = "La dirección proporcionada no corresponde a un correo electrónico")]
        [Required(ErrorMessage = "La dirección de correo electrónico es requerida")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "El Nacimiento del usuario es requerido")]
        [DataType(DataType.DateTime)]
        public DateTime Birth { get; set; }

        [Phone(ErrorMessage = "El número debe ser válido mínimo 8 dígitos")]
        [Required(ErrorMessage = "El móvil del usuario es requerido")]
        public string? Mobile { get; set; }

        [Phone(ErrorMessage = "El número debe ser válido mínimo 8 dígitos")]
        public string? Phone { get; set; }

        [DataType(DataType.DateTime)]
        public DateTime RegisterDate { get; set; }

        public int? Status { get; set; }

    }
}
