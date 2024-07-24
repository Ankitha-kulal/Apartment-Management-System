package myserver;

public class Unit {
    private int unitID;
    private int floorNumber;
    private int numberOfRooms;
    private String occupancyStatus;
    private String amenities;

    // Constructors, getters, and setters
    // Constructor
    public Unit() {}

    public Unit(int unitID, int floorNumber, int numberOfRooms, String occupancyStatus, String amenities) {
        this.unitID = unitID;
        this.floorNumber = floorNumber;
        this.numberOfRooms = numberOfRooms;
        this.occupancyStatus = occupancyStatus;
        this.amenities = amenities;
    }

    // Getters and Setters
    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public String getOccupancyStatus() {
        return occupancyStatus;
    }

    public void setOccupancyStatus(String occupancyStatus) {
        this.occupancyStatus = occupancyStatus;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }
}
