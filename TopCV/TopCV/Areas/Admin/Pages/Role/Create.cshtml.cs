using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace TopCV.Areas.Admin.Pages.Role
{
    [Authorize(Roles = "Admin")]
    public class CreateModel : RolePageModel
    {
        public CreateModel(RoleManager<IdentityRole> roleManager) : base(roleManager)
        {
        }
        public class InputModel
        {
            [Display(Name="Name of Role")]
            [Required(ErrorMessage ="You have to enter {0}")]
            [StringLength(256,MinimumLength =3,ErrorMessage ="The length of {0} too short, at least 3 letter")]
            public string Name { get; set; }
        }
        [BindProperty]
        public InputModel Input { get; set; }
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            var newRole = new IdentityRole(Input.Name);
            var result= await _roleManager.CreateAsync(newRole);
            if (result.Succeeded)
            {
                StatusMessage = $"Create role success: {Input.Name}";
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
