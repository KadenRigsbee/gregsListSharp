namespace gregsListSharp.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HouseController : ControllerBase
{
    private readonly HouseService houseService;

    public HouseController(HouseService houseService)
    {
        this.houseService = houseService;
    }

    [HttpGet]
    public ActionResult<List<House>> GetAllHouses(){
      try
      {
        List<House> houses  = houseService.GetAllHouses();
        return Ok(houses);
      }
      catch (Exception error)
      {
        return BadRequest(error.Message);
      }
    }

    [HttpGet("{houseId}")]
    public ActionResult<House> GetHouseById(int houseId){
      try
      {
        House house = houseService.GetHouseById(houseId);
        return Ok(house);
      }
      catch (Exception error)
      {
        return BadRequest(error.Message);
      }
    }

    [HttpPost]
    public ActionResult<House> CreateHouse([FromBody] House houseData){
      try
      {
        House house = houseService.CreateHouse(houseData);
        return Ok(house);
      }
      catch (Exception error)
      {
        return BadRequest(error.Message);
      }
    }

    [HttpDelete("{houseId}")]
    public ActionResult<string> RemoveHouse(int houseId)
    {
      try
      {
        string message = houseService.RemoveHouse(houseId);
        return Ok(message);
      }
      catch (Exception error)
      {
        return BadRequest(error.Message);
      }
    }

    [HttpPut("{carId}")]
    public ActionResult<House> UpdateHouse([FromBody] House updateData, int houseId)
    {
      try
      {
        updateData.Id = houseId;
        House update = houseService.UpdateHouse(updateData);
        return Ok(update);
      }
        catch (Exception error)
      {
        return BadRequest(error.Message);
      }
    }
}
