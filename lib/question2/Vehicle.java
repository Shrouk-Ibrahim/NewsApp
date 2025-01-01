package question2;

public class Vehicle {
   protected String brand;
  protected   String model;
   protected int year;

    public  Vehicle(String brand,String model ,int year){
        this.brand=brand;
        this.model=model;
        this.year=year;

    }
    public void startEngine() {

        System.out.println("Start the vehicle");
    }


    public void displayInfo() {
        System.out.println("Brand: " + brand + ", Model: " + model + ", Year: " + year);
    }
}
