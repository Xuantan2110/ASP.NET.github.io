using TopCV.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using static TopCV.Areas.Admin.Pages.User.IndexModel;
using Microsoft.AspNetCore.Authorization;
namespace TopCV.Areas.Admin.Pages.User
{
    // Thêm một thuộc tính mới vào lớp IndexModel để lưu trữ danh sách các vai trò của mỗi người dùng
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public IndexModel(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        [TempData]
        public string StatusMessage { get; set; }

        public List<UserRoleViewModel> UsersWithRoles { get; set; }

        public async Task OnGetAsync()
        {
            UsersWithRoles = new List<UserRoleViewModel>();
            var users = await _userManager.Users.ToListAsync();
            foreach (var user in users)
            {
                var userRoles = await _userManager.GetRolesAsync(user);
                var roleNames = string.Join(", ", userRoles);

                UsersWithRoles.Add(new UserRoleViewModel
                {
                    UserId = user.Id,
                    UserName = user.UserName,
                    PhoneNumber=user.PhoneNumber,
                    RoleNames = roleNames
                });
            }
        }
        public class UserRoleViewModel
        {
            public string UserId { get; set; }
            public string UserName { get; set; }
            public string RoleNames { get; set; }
            public string PhoneNumber { get; set; }
        }
    }

}
