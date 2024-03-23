using Microsoft.AspNetCore.Mvc;
using Weather.NET.Exceptions;
using WeatherAPI.Services.Interfaces;

namespace WeatherAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherController : ControllerBase
    {

        private readonly IWeatherService _weatherService;

        public WeatherController(IWeatherService weatherService)
        {
            _weatherService = weatherService;
        }

        [HttpGet("GetWeather")]
        public async Task<ActionResult> Get([FromQuery] string city)
        {
            try
            {
                var outfit = await _weatherService.GetOutfitForATemperature(city);
                return Ok(outfit);
            }

            catch(HttpNotFoundException ex)
            {
                return BadRequest("Invalid city");
            }
        }
    }
}