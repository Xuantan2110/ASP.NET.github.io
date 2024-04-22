using TopCV.Models;

namespace TopCV.ViewModels
{
    public class HomeIndexViewModel
    {
        public IEnumerable<Tuple<JobListing, string>> JobListingsWithUserEmail { get; set; }
    }
}
