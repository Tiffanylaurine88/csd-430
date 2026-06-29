import java.io.Serializable;

/*
 * Name: Tiffany Davidson
 * Date: June 28, 2026
 * Assignment: Module 4.2 - JavaBean Data Display
 * Course: CSD 430
 *
 * Purpose:
 * This JavaBean stores data about places visited.
 * It implements Serializable as required by the assignment.
 */
public class PlaceBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private String placeName;
    private String location;
    private String visitType;
    private int yearVisited;
    private String favoriteFeature;

    /*
     * Default constructor required for JavaBeans.
     */
    public PlaceBean() {
    }

    /*
     * Constructor used to create a PlaceBean object with data.
     */
    public PlaceBean(String placeName, String location, String visitType, int yearVisited, String favoriteFeature) {
        this.placeName = placeName;
        this.location = location;
        this.visitType = visitType;
        this.yearVisited = yearVisited;
        this.favoriteFeature = favoriteFeature;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getVisitType() {
        return visitType;
    }

    public void setVisitType(String visitType) {
        this.visitType = visitType;
    }

    public int getYearVisited() {
        return yearVisited;
    }

    public void setYearVisited(int yearVisited) {
        this.yearVisited = yearVisited;
    }

    public String getFavoriteFeature() {
        return favoriteFeature;
    }

    public void setFavoriteFeature(String favoriteFeature) {
        this.favoriteFeature = favoriteFeature;
    }
}