using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TopCV.Data;
using TopCV.Models;
using TopCV.ViewModels;

namespace TopCV.Controllers
{
    public class JobListingsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public JobListingsController(UserManager<IdentityUser> userManager, ApplicationDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }

        // GET: JobListings
        public async Task<IActionResult> Index()
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var jobListings = await _context.JobListing
                .Where(j => j.UserId == userId)
                .Include(j => j.Location)
                .Select(j => new Tuple<JobListing, string>(
                    j,
                    _context.Users.Where(u => u.Id == j.UserId).Select(u => u.Email).FirstOrDefault()))
                .ToListAsync();
            ViewBag.UserId = userId;

            return View(jobListings);
        }

        // GET: JobListings/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.JobListing == null)
            {
                return NotFound();
            }

            var jobListing = await _context.JobListing
                .Include(j => j.Location)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (jobListing == null)
            {
                return NotFound();
            }

            return View(jobListing);
        }
        [Authorize(Roles = "Employer")]
        // GET: JobListings/Create
        public IActionResult Create()
        {
            ViewData["LocationId"] = new SelectList(_context.Location, "Id", "Id");
            return View();
        }

        // POST: JobListings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(JobListing jobListing)
        {
            if (ModelState.IsValid)
            {
                var userId = _userManager.GetUserId(User);
                jobListing.UserId = userId;

                _context.JobListing.Add(jobListing);
                await _context.SaveChangesAsync();

                return RedirectToAction("Index", "JobListings");
            }
            return View(jobListing);
        }
        [Authorize(Roles = "Employer")]
        // GET: JobListings/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.JobListing == null)
            {
                return NotFound();
            }

            var jobListing = await _context.JobListing.FindAsync(id);
            if (jobListing == null)
            {
                return NotFound();
            }
            ViewData["LocationId"] = new SelectList(_context.Location, "Id", "Id", jobListing.LocationId);
            return View(jobListing);
        }

        // POST: JobListings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,Description,CompanyName,Position,Salary,LocationId,UserId")] JobListing jobListing)
        {
            if (id != jobListing.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(jobListing);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!JobListingExists(jobListing.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["LocationId"] = new SelectList(_context.Location, "Id", "Id", jobListing.LocationId);
            return View(jobListing);
        }
        [Authorize(Roles = "Employer")]
        // GET: JobListings/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.JobListing == null)
            {
                return NotFound();
            }

            var jobListing = await _context.JobListing
                .Include(j => j.Location)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (jobListing == null)
            {
                return NotFound();
            }

            return View(jobListing);
        }
        
        // POST: JobListings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.JobListing == null)
            {
                return Problem("Entity set 'ApplicationDbContext.JobListing'  is null.");
            }
            var jobListing = await _context.JobListing.FindAsync(id);
            if (jobListing != null)
            {
                _context.JobListing.Remove(jobListing);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Apply(int jobListingId)
        {
            return RedirectToAction("Create", "JobApplications", new { jobListingId = jobListingId });
        }
        public IActionResult AppliedCandidates(int id)
        {
            var jobApplications = _context.JobApplication
                .Where(j => j.JobListingId == id)
                .Select(j => new AppliedCandidateViewModel
                {
                    JobApplication = j,
                    Email = _context.Users.FirstOrDefault(u => u.Id == j.UserId) != null ? _context.Users.FirstOrDefault(u => u.Id == j.UserId).Email : null,
                    PhoneNumber = _context.Users.FirstOrDefault(u => u.Id == j.UserId) != null ? _context.Users.FirstOrDefault(u => u.Id == j.UserId).PhoneNumber : null,
                    UploadFile = j.UploadFile,
                })
                .ToList();

            return View(jobApplications);
        }
        private bool JobListingExists(int id)
        {
          return (_context.JobListing?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
