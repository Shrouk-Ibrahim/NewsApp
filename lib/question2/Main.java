
public class Main {

    public static void main(String[] args) {
       Vehicle car = new Car("Toyota", "r9889", 2022);
       Vehicle bike = new Bike("Honda", "454GG", 2023);
       ElectricCar electricCar = new ElectricCar("Tesla", "YH09S", 2025, 88);
       ElectricBike electricBike = new ElectricBike("BMW", "YHYF", 2024, 10);


       Vehicle[] vehicles = {car, bike, electricCar, electricBike};

       for (Vehicle vehicle : vehicles) {
           vehicle.displayInfo();
           vehicle.startEngine();

       }
  

    }}