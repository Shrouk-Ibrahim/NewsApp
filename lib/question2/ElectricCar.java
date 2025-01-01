package question2;

class ElectricCar extends Car implements Electric{
    private int batteryLevel;
    public ElectricCar(String make, String model, int year, int batteryLevel) {
        super(make, model, year);
        this.batteryLevel = batteryLevel;
    }

    @Override
    public void startEngine() {
        if (batteryLevel > 20) {
            System.out.println("Starting the electric car ");
        } else {
            System.out.println(" Please charge the battery.");
        }
    }
}
