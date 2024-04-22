using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace TopCV.Areas.Admin.Pages.Role
{
    public class RolePageModel:PageModel
    {
       protected readonly RoleManager<IdentityRole> _roleManager;
        [TempData]
        public string StatusMessage { get; set; }
        public RolePageModel(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
        }   
    }
}
