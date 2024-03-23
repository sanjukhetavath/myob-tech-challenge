using WeatherAPI.Enums;

namespace WeatherAPI.DTO
{
    public class WeatherOutfit
    {
        public WeatherOutfit(string city, string temperature, Outfit outfit)
        {
            City = city;
            Temperature = temperature;
            Outfit = outfit.ToString();
        }
        public string City { get; set; }
        public string Temperature { get; set; }
        public string Outfit { get; set; }
    }
}
