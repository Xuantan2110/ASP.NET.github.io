using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TopCV.Data;
using TopCV.Models;

namespace TopCV.Controllers
{
    public class JobApplicationsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public JobApplicationsController(UserManager<IdentityUser> userManager, ApplicationDbContext context)
        {
            _context = context;
            _userManager = userManager;
        }
        // GET: JobApplications
        public async Task<IActionResult> Index()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return Redirect("/Identity/Account/Login");
            }
            var jobApplications = _context.JobApplication
                .Where(j => j.UserId == user.Id)
                .Include(j => j.JobListing)
                .ToList();

            return View(jobApplications);
        }
        // GET: JobApplications/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.JobApplication == null)
            {
                return NotFound();
            }

            var jobApplication = await _context.JobApplication
                .FirstOrDefaultAsync(m => m.Id == id);
            if (jobApplication == null)
            {
                return NotFound();
            }

            return View(jobApplication);
        }
        public async Task<IActionResult> Download(int id)
        {
            var jobApplication = await _context.JobApplication.FindAsync(id);
            if (jobApplication == null || jobApplication.UploadFile == null)
            {
                return NotFound();
            }
            var fileName = jobApplication.UploadFile;
            var fileBytes = await System.IO.File.ReadAllBytesAsync(jobApplication.UploadFile);
            return File(fileBytes, "application/octet-stream", fileName);
        }
        [Authorize(Roles = "Employee")]
        // GET: JobApplication/Create
        public IActionResult Create(int jobListingId)
        {
            var jobApplication = new JobApplication
            {
                JobListingId = jobListingId
            };
            return View(jobApplication);
        }

        // POST: JobApplication/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(JobApplication jobApplication)
        {
            if (ModelState.IsValid)
            {
                var user = await _userManager.GetUserAsync(User);
                jobApplication.UserId = user.Id;

                _context.JobApplication.Add(jobApplication);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "JobApplications");
            }
            return View(jobApplication);
        }
        [Authorize(Roles = "Employee")]
        // GET: JobApplications/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.JobApplication == null)
            {
                return NotFound();
            }

            var jobApplication = await _context.JobApplication.FindAsync(id);
            if (jobApplication == null)
            {
                return NotFound();
            }
            return View(jobApplication);
        }

        // POST: JobApplications/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,UploadFile,UserId")] JobApplication jobApplication)
        {
            if (id != jobApplication.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(jobApplication);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!JobApplicationExists(jobApplication.Id))
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
            return View(jobApplication);
        }
        [Authorize(Roles = "Employee")]
        // GET: JobApplications/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.JobApplication == null)
            {
                return NotFound();
            }

            var jobApplication = await _context.JobApplication
                .FirstOrDefaultAsync(m => m.Id == id);
            if (jobApplication == null)
            {
                return NotFound();
            }

            return View(jobApplication);
        }

        // POST: JobApplications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.JobApplication == null)
            {
                return Problem("Entity set 'ApplicationDbContext.JobApplication'  is null.");
            }
            var jobApplication = await _context.JobApplication.FindAsync(id);
            if (jobApplication != null)
            {
                _context.JobApplication.Remove(jobApplication);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool JobApplicationExists(int id)
        {
            return (_context.JobApplication?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}