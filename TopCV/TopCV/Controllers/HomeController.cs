using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using TopCV.Data;
using TopCV.Models;
using TopCV.ViewModels;

namespace TopCV.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> Index(string searchString)
        {
            // Lấy danh sách công việc
            var jobListingsQuery = _context.JobListing
                .Include(j => j.Location)
                .Select(j => new Tuple<JobListing, string>(
                    j,
                    _context.Users.Where(u => u.Id == j.UserId).Select(u => u.Email).FirstOrDefault()));

            // Kiểm tra xem có từ khóa tìm kiếm không
            if (!string.IsNullOrEmpty(searchString))
            {
                // Lọc công việc theo từ khóa tìm kiếm sau khi đã truy xuất dữ liệu
                var jobListings = jobListingsQuery.AsEnumerable()
                    .Where(j => j.Item1.Title.Contains(searchString))
                    .ToList();

                var viewModel = new HomeIndexViewModel
                {
                    JobListingsWithUserEmail = jobListings
                };

                return View(viewModel);
            }

            // Không có từ khóa tìm kiếm, trả về danh sách công việc không được lọc
            var allJobListings = await jobListingsQuery.ToListAsync();

            var allViewModel = new HomeIndexViewModel
            {
                JobListingsWithUserEmail = allJobListings
            };

            return View(allViewModel);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}