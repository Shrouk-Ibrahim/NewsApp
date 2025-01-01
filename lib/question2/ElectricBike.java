package question2;

class ElectricBike extends Bike implements Electric {
    private int batteryLevel;

    public ElectricBike(String make, String model, int year, int batteryLevel) {
        super(make, model, year);
        this.batteryLevel = batteryLevel;
    }

    @Override
    public void startEngine() {
        if (batteryLevel > 20) {
            System.out.println("Starting the electric bike ");
        } else {
            System.out.println(" Please charge the battery");
        }
    }
}