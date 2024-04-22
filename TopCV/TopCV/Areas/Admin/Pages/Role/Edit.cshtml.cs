using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace TopCV.Areas.Admin.Pages.Role
{
    [Authorize(Roles = "Admin")]
    public class EditModel : RolePageModel
    {
        public EditModel(RoleManager<IdentityRole> roleManager) : base(roleManager)
        {
        }
        public class InputModel
        {
            [Display(Name = "Name of Role")]
            [Required(ErrorMessage = "You have to enter {0}")]
            [StringLength(256, MinimumLength = 3, ErrorMessage = "The length of {0} too short, at least 3 letter")]
            public string Name { get; set; }
        }
        [BindProperty]
        public InputModel Input { get; set; }
        public IdentityRole role { get; set; }
        public async Task<IActionResult> OnGet(string roleid)
        {
            if (roleid == null)  return NotFound("Not find role");
            role = await _roleManager.FindByIdAsync(roleid);      
            if (role != null)
            {
                Input = new InputModel()
                {
                    Name = role.Name
                };
                return Page();
            }
            return NotFound("Not find role");
        }
        public async Task<IActionResult> OnPostAsync(string roleid)
        {
            if (roleid == null) return NotFound("Not find role");
            var role = await _roleManager.FindByIdAsync(roleid);
            if (role == null) return NotFound("Not find role");
            if (!ModelState.IsValid)
            {
                return Page();
            }
            role.Name = Input.Name;
            var result= await _roleManager.UpdateAsync(role);
            if(result.Succeeded)
            {
                StatusMessage = $"You just changed your name: {Input.Name}";
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
