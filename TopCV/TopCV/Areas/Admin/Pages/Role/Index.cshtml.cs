using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace TopCV.Areas.Admin.Pages.Role
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : RolePageModel
    {
        public IndexModel(RoleManager<IdentityRole> roleManager) : base(roleManager)
        {
        }
        public List<IdentityRole> roles { set; get; }
        public async Task OnGet()
        {
            roles= await _roleManager.Roles.ToListAsync();
        }
        public void OnPost() => RedirectToPage();
    }
}   
