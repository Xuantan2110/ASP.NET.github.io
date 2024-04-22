namespace TopCV.Models
{
    public class JobListing
    {
        public int Id { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? CompanyName { get; set; }
        public string? Position { get; set; }
        public string? Salary { get; set; }
        public int LocationId { get; set; }
        public string? UserId { get; set; }
        public virtual Location? Location { get; set; }
        public virtual ICollection<JobApplication>? JobApplications { get; set; }
    }
}
