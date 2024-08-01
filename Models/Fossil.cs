using System.ComponentModel.DataAnnotations;

namespace BlazorServerCorr.Models;

//this is a comment

public class Fossil
{
        [Key]
        public int Id { get; set; }
        
        [Required]
        public string Name { get; set; }
        [Required]
        [AllowedSpecies(new string[] {"Tyrannosaurus", "Triceratops", "Velociraptor"})]
        public string Species { get; set; }
        [Required]
        [Range(1, 70, ErrorMessage = "Age must be greater than 0 and less than or equal to 70")]
        public int Age { get; set; }
        [Required]
        public string Location { get; set; }
        [Required]
        public string Description { get; set; }
}
