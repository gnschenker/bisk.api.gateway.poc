using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace ApplicationManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApplicationsController : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "Application 1", "Application 2", "Application3", "Application 4" };
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return $"Application {id}";
        }
    }
}
