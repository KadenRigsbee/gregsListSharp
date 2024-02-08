namespace gregsListSharp.Models;


public class House{
  public int Id { get;  set; }
  public int Sqft { get; set; }
  public int Bedrooms { get; set; }
  public decimal Bathrooms { get; set; } 
  public string ImgUrl { get; set; }
  public string Description { get; set; }
  public int Price { get; set; }
}
