package CCStatistics.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import CCStatistics.Domain.Certificate;
import CCStatistics.Domain.Course;
import CCStatistics.Domain.EnumLevel;
import CCStatistics.Domain.Signup;

public class SignupDAO {
    private SQL sql = null;
    private Connection connection = null;

    public SignupDAO() {
        // Pakt de SQL class, deze handelt de verbinding en het sturen en ontvangen van
        // de query's en hun replies
        sql = new SQL();
        // Pakt eerst een connection, deze is nodig om een prepared statement op te
        // maken
        connection = sql.getConnection();
    }

    // De Generic Read Query handelt alle readqueries uiteindelijk af.
    public ArrayList<Signup> genericReadQuery(PreparedStatement preparedStatement) {
        // Geeft de prepared statement mee aan SQL readquery
        ArrayList<ArrayList<String>> tableList = sql.readQuery("Signup", preparedStatement);
        // Slaat de resultaten op in deze Arraylist
        ArrayList<Signup> signUps = new ArrayList<>();
        if (tableList.size() > 0) {
            for (ArrayList<String> row : tableList) {
                // Pakt per rij alle waarden en slaat ze op in de de arraylist als het goede
                // object
                int signupID = Integer.valueOf(row.get(0));
                String signupDate = row.get(1);
                String courseName = row.get(2);
                // Studentemail wordt niet gelezen, die wordt gehandelt bij student
                String certificateID = row.get(4);
                CourseDAO courseDAO = new CourseDAO();
                Course course = courseDAO.read(courseName).get(0);
                Certificate certificate = null;
                if (!certificateID.equals("NULL")) {
                    int intCertificateID = Integer.valueOf(certificateID);
                    CertificateDAO certificateDAO = new CertificateDAO();
                    certificate = certificateDAO.read(intCertificateID).get(0);
                }
                signUps.add(new Signup(signupID, signupDate, course, certificate));
            }
        }
        return signUps;
    }

    // Leest alle Signup (READ)
    public ArrayList<Signup> getAll() {
        // De Query
        String rawquery = "SELECT * FROM Signup";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Omdat dit getAll is wordt er geen waarde in geplaats dus de preparedstatement
            // wordt rechtstreeks doorgestuurd naar genericReadQuery
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

    // Leest een Signup uit voor een bepaalde student (READ), wordt niet meer
    // gebruikt

    // public ArrayList<Signup> readSignupFromStudent(String studentEmail) {
    // // De Query
    // String rawquery = "SELECT * FROM Signup WHERE SignupID = ?";
    // // Probeert het eerste deel van de statement te sturen
    // try (PreparedStatement preparedStatement =
    // connection.prepareStatement(rawquery)) {
    // // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
    // // begint op 1 met tellen
    // preparedStatement.setString(1, studentEmail);
    // return genericReadQuery(preparedStatement);
    // // Omdat de verbinding ook fout kan gaan is hier ook een catch voor
    // SQLexception
    // } catch (SQLException e) {
    // // Als er geen resultaat komt, komt er een bepaalde error (zie
    // // printSQLException), dan vangt dit het af en stuurt een not found
    // resultaat"
    // if (SQL.printSQLException(e)) {
    // return this.nothingFound();
    // }
    // // print SQL exception information
    // SQL.printSQLException(e);
    // }
    // return null;
    // }

    // Maakt een Signup aan (CREATE)
    public void create(Signup signup, String studentEmail) {
        // De query met ? ipv de waarde
        String rawquery = "INSERT INTO Signup (SignupDate, Course, StudentEmail) VALUES (?,?,?);";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setString(1, signup.getSignupDate());
            preparedStatement.setString(2, signup.getCourse().getName());
            preparedStatement.setString(3, studentEmail);
            // Stuur de preparedstatement direct naar de goede methode in SQL
            sql.createQuery(preparedStatement);

            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // print SQL exception information
            SQL.printSQLException(e);
        }

    }

    // Updatet een signup (UPDATE) (werkt niet)
    public void update(String columnToChange, String changeInto, int signupID) {
        // De query met ? ipv de waarde
        String rawquery = "UPDATE Signup SET ? = ? WHERE SignupID = ?;";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setString(1, columnToChange);
            preparedStatement.setString(2, changeInto);
            preparedStatement.setInt(2, signupID);
            // Stuur de preparedstatement direct naar de goede methode in SQL
            sql.updateQuery(preparedStatement);

            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // print SQL exception information
            SQL.printSQLException(e);
        }
    }

    // Deletet een signup (DELETE)
    public int delete(int signupID) {
        // De query met ? ipv de waarde
        String rawquery = "DELETE FROM Signup WHERE SignupID = ?;";
        // Probeert het eerste deel van de statement te sturen
        try (PreparedStatement preparedStatement = connection.prepareStatement(rawquery)) {
            // Stuurt de eerste waarde mee om in de plaats van het vraagteken te zetten,
            // begint op 1 met tellen
            preparedStatement.setInt(1, signupID);
            // Stuur de preparedstatement direct naar de goede methode in SQL
            return sql.deleteQuery(preparedStatement);

            // Omdat de verbinding ook fout kan gaan is hier ook een catch voor SQLexception
        } catch (SQLException e) {
            // print SQL exception information
            SQL.printSQLException(e);
        }
        return 0;
    }

    // Geeft deze waarde terug als er niets gevonden is ipv null om errors te
    // voorkomen
    public ArrayList<Signup> nothingFound() {
        ArrayList<Signup> signups = new ArrayList<>();
        Certificate certificate = new Certificate(0, 0, "null");
        Course course = new Course("null", "null", "null", EnumLevel.Beginner);
        signups.add(new Signup(0, "nothingFound", course, certificate));
        return signups;
    }
}