using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TopCV.Models;

namespace TopCV.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<TopCV.Models.Location> Location { get; set; } = default!;
        public DbSet<TopCV.Models.JobApplication> JobApplication { get; set; } = default!;
        public DbSet<TopCV.Models.JobListing> JobListing { get; set; } = default!;
    }
}