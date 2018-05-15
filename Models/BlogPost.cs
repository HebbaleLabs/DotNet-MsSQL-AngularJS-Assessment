using System;

namespace Assessment.Models
{
    public class BlogPost
    {
        public long Id { get; set; }
        public String title { get; set; }
        public String author { get; set; }
        public DateTime postedDate { get; set; }
    }
}
