package myserver;
public class Room {
    private int roomID;
    private int roomNumber;
    private int residentID;
    private int unitID;
    private String roomType;
    private String roomStatus;
    private float squareFootage;
    private int monthlyRent;
    private String amenities;

    // Constructors
    public Room() {
    }

    public Room(int roomID, int roomNumber, int residentID, int unitID, String roomType, String roomStatus, float squareFootage, int monthlyRent, String amenities) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.residentID = residentID;
        this.unitID = unitID;
        this.roomType = roomType;
        this.roomStatus = roomStatus;
        this.squareFootage = squareFootage;
        this.monthlyRent = monthlyRent;
        this.amenities = amenities;
    }

    // Getters and Setters
    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getResidentID() {
        return residentID;
    }

    public void setResidentID(int residentID) {
        this.residentID = residentID;
    }

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }

    public float getSquareFootage() {
        return squareFootage;
    }

    public void setSquareFootage(float squareFootage) {
        this.squareFootage = squareFootage;
    }

    public int getMonthlyRent() {
        return monthlyRent;
    }

    public void setMonthlyRent(int monthlyRent) {
        this.monthlyRent = monthlyRent;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }
}
