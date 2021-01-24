package CCStatistics.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import CCStatistics.Domain.Signup;
import CCStatistics.Domain.Student;

public class StudentDAO {
    private SQL sql = null;
    private Connection connection = null;

    public StudentDAO() {
        // Pakt de SQL class, deze handelt de verbinding en het sturen en ontvangen van
        // de query's en hun replies
        sql = new SQL();
        // Pakt eerst een connection, deze is nodig om een prepared statement op te
        // maken
        connection = sql.getConnection();
    }

    public ArrayList<Student> genericReadQuery(PreparedStatement preparedStatement) {
        ArrayList<ArrayList<String>> tableList = sql.readQuery("Student", preparedStatement);
        ArrayList<Student> students = new ArrayList<>();
        SignupDAO signupDAO = new SignupDAO();
        if (tableList.size() > 0) {
            for (ArrayList<String> row : tableList) {
                String email = row.get(0);
                String firstName = row.get(1);
                String lastName = row.get(2);
                String dateOfBirth = row.get(3);
                String gender = row.get(4);
                String street = row.get(5);
                String houseNumber = row.get(6);
                String postalcode = row.get(7);
                String city = row.get(8);
                String country = row.get(9);

                students.add(new Student(email, firstName, lastName, dateOfBirth, gender, street, houseNumber,postalcode, city, country));
            }
        } else {
            return null;
        }
        return students;
    }

    public ArrayList<Student> getAll() {
        String rawquery = "SELECT * FROM Student;";

        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            return genericReadQuery(preparedStatement);
        } catch (SQLException e) {
            // Als er geen resultaat komt, komt er een bepaalde error (zie
            // printSQLException), dan vangt dit het af en stuurt een not found resultaat"
            if (SQL.printSQLException(e)) {
                return this.nothingFound();
            }
            // print SQL exception information
            SQL.printSQLException(e);
        }
        return null;
    }

    // Maakt een certificate aan (CREATE)
    public void create(Student student) {
        // De query met ? ipv de waarde
        String rawquery = "INSERT INTO Student (Email,FirstName,LastName,DateOfBirth,Gender,Street,HouseNr,PostCode,City,Country) VALUES (?,?,?,?,?,?,?,?,?,?);";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setString(1, student.getEmail());
            preparedStatement.setString(2, student.getFirstName());
            preparedStatement.setString(3, student.getLastName());
            preparedStatement.setString(4, student.getDateOfBirth());
            preparedStatement.setString(5, student.getGender());
            preparedStatement.setString(6, student.getStreet());
            preparedStatement.setString(7, student.getHouseNumber());
            preparedStatement.setString(8, student.getPostalCode());
            preparedStatement.setString(9, student.getCity());
            preparedStatement.setString(10, student.getCountry());
            // Stuur de preparedstatement direct naar de goede methode in SQL
            sql.createQuery(preparedStatement);

            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // print SQL exception information
            SQL.printSQLException(e);
        }
    }

    // Leest een student uit (READ)
    public ArrayList<Student> read(String studentEmail) {
        // De query met ? ipv de waarde
        String rawquery = "SELECT * FROM Student WHERE Email = ?";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setString(1, studentEmail);
            // Geeft deze statement mee aan genericreadquery
            return genericReadQuery(preparedStatement);
            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // Als er geen resultaat komt, komt er een bepaalde error (zie
            // printSQLException), dan vangt dit het af en stuurt een not found resultaat"
            if (SQL.printSQLException(e)) {
                return this.nothingFound();
            }
            // print SQL exception information
            SQL.printSQLException(e);
        }
        return null;
    }

    // Updatet een certificaat (UPDATE)
    public void update(String columnToChange, String changeInto, String studentEmail) {
        // De query met ? ipv de waarde
        String rawquery = "UPDATE Certificate SET ? = ? WHERE Email = ?;";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setString(1, columnToChange);
            preparedStatement.setString(2, changeInto);
            preparedStatement.setString(3, studentEmail);
            // Stuur de preparedstatement direct naar de goede methode in SQL
            sql.createQuery(preparedStatement);

            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // print SQL exception information
            SQL.printSQLException(e);
        }
    }

    // delete een bepaalde kolom
    public int delete(String studentEmail) {
        // De query met ? ipv de waarde
        String rawquery = "DELETE FROM Signup WHERE SignupID = ?;";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setString(1, studentEmail);
            // Stuur de preparedstatement direct naar de goede methode in SQL
            return sql.deleteQuery(preparedStatement);

            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // print SQL exception information
            SQL.printSQLException(e);
        }
        return 0;
    }

    public ArrayList<Student> nothingFound() {
        ArrayList<Student> students = new ArrayList<>();
        students.add(new Student("NothingFound", "null", "null", "1-1-1000", "null", "null", "null", "null", "null",
                "null"));
        return students;
    }
}
