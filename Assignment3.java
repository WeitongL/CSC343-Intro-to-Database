import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Assignment3 extends JDBCSubmission {

  public Assignment3() throws ClassNotFoundException {

    Class.forName("org.postgresql.Driver");
  }

  @Override
  public boolean connectDB(String url, String username, String password) {
    //write your code here.
    try{
      connection = DriverManager.getConnection(url, username, password);
      System.out.println("Connected Successfully");
      return true;
    }
    catch (SQLException err) {
      System.out.println("Error connecting.");
      err.printStackTrace();
      return false;
    }
  }

  @Override
  public boolean disconnectDB() {
    //write your code here.
    try {
      connection.close();
      System.out.println("Disconnected Successfully.");
      return true;
    }
    catch (SQLException err){
      System.out.println("Error disconnecting.");
      err.printStackTrace();
      return false;
    }
  }

  @Override
  public ElectionResult presidentSequence(String countryName) {
    //Write your code here.
    //Select from jdbc_demo table
    ResultSet presidents;
    ElectionResult result;
    int temp_id;
    String temp_name;
    List<Integer> president_id = new ArrayList<Integer>();
    List<String> party_name = new ArrayList<String>();
    try{
      String sqlQuery =
      "SELECT politician_president.id as president, party.name as party, start_date " +
      "from politician_president join party " +
      "on politician_president.party_id = party.id join country " +
      "on country.id = politician_president.country_id " +
      "where country.name = ?" +
      "order by politician_president.start_date desc;";
      PreparedStatement president = connection.prepareStatement(sqlQuery);
      president.setString(1, countryName);

      presidents = president.executeQuery();

      while(presidents.next()){
        temp_id = presidents.getInt("president");
        temp_name =presidents.getString("party");
        president_id.add(temp_id);
        party_name.add(temp_name);
      }

      result = new ElectionResult(president_id,party_name);
      return result;

    }catch(SQLException err){
      err.printStackTrace();
      return null;
    }
  }


  @Override
  public List<Integer> findSimilarParties(Integer partyId, Float threshold) {
    List<Integer> result = new ArrayList<Integer>();
    ResultSet curr_party;
    ResultSet not_curr_party;
    String curr_des;
    String other_des;
    int other_id;
    String this_party = "SELECT id, description  from party where id = ?;";
    String other_party = "SELECT id , description  from party where id <> ?;";
    try{

      PreparedStatement given_party = connection.prepareStatement(this_party);

      given_party.setInt(1,partyId);

      curr_party = given_party.executeQuery();

      curr_party.next();
      curr_des = curr_party.getString("description");


      PreparedStatement rest_party =  connection.prepareStatement(other_party);

      rest_party.setInt(1,partyId);
      not_curr_party = rest_party.executeQuery();


      while(not_curr_party.next()){
        other_des = not_curr_party.getString("description");
        other_id = not_curr_party.getInt("id");

        if(similarity(curr_des, other_des) >= threshold){
          result.add(other_id);
        }
      }

      return result;

    }catch(SQLException err){
      err.printStackTrace();
      result.add(err.getErrorCode());
      return result;
    }

  }

  public static void main(String[] args) throws Exception {
    //Write code here.
    System.out.println("Hellow World");
  }

}
