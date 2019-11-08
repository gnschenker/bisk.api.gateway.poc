using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace ProgramSelection.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProgramsController : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "Program 1", "Program 2", "Program 3" };
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return $"Program {id}";
        }
    }
}
