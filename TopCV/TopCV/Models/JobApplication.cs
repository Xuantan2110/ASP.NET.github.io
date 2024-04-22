namespace TopCV.Models
{
    public class JobApplication
    {
        public int Id { get; set; }
        public string? UploadFile { get; set; }
        public string? UserId { get; set;}
        public int JobListingId { get; set; }
        public virtual JobListing? JobListing { get; set; }
    }
}
