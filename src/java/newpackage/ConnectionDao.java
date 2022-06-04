package newpackage;

/**
 *
 * @author Lenovo
 */
import AdminPanel.AddProducts;
import Cart.Cart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConnectionDao {

    private final String dburl = "jdbc:mysql://localhost:3306/hiflydb";
    private final String dbuname = "root";
    private final String dbpassword = "1234";
    private final String dbdriver = "com.mysql.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
        }
        return con;
    }

    /**
     *
     * @param users
     * @return
     */
    public String insert(Users users) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "T";
        String sql = "insert into hiflydb.users values(?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getPhone());
            ps.setString(4, users.getPassword());
            ps.setString(5, null);
            ps.executeUpdate();
        } catch (SQLException e) {
            result = "F";
        }
        return result;
    }

    public void CreateCart(String CartTableName) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = null;
        String sql = "CREATE TABLE hiflydb." + CartTableName + "(\n"
                + "  `pid` INT NOT NULL,\n"
                + "  `ProductName` VARCHAR(45) NOT NULL,\n"
                + "  `ProductPrice` INT NOT NULL,\n"
                + "  `ProductImage` VARCHAR(100) NOT NULL,\n"
                + "  `ProductQuan` INT NOT NULL  DEFAULT 1,\n"
                + "  PRIMARY KEY (`pid`));";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            result = String.valueOf(ps.executeUpdate());
        } catch (SQLException e) {
        }
    }

    public LUsers login(LUsers lusers) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "select * from hiflydb.users where email = ? and password = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lusers.getEmail());
            ps.setString(2, lusers.getPassword());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                lusers.setEmail(rs.getString("email"));
                lusers.setName(rs.getString("name"));
                lusers.setPhone(rs.getString("phone"));
                lusers.setType(rs.getString("Type"));

            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return lusers;
    }

    public String AddProducts(AddProducts addproducts) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "T";
        String sql = "insert into hiflydb.products(ProductName,ProductsDesc,ProductQuantity,ProductPrice,ProductImage)  values(?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, addproducts.getPname());
            ps.setString(2, addproducts.getPdesc());
            ps.setInt(3, addproducts.getPquantity());
            ps.setInt(4, addproducts.getPprice());
            ps.setString(5, addproducts.getPimage());
            ps.executeUpdate();
        } catch (SQLException e) {
            result = "F";
        }
        return result;
    }

    public String about() {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "select * from hiflydb.about";
        String about = null;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                about = rs.getString("about");
                //System.out.println(about);
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return about;
    }

    public List<String> ShowContact() {

        List<String> ShowContact = new ArrayList<>();
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "select * from hiflydb.contact";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ShowContact.add(rs.getString("phone"));
                ShowContact.add(rs.getString("email"));
                ShowContact.add(rs.getString("address"));

                System.out.println(ShowContact);
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return ShowContact;
    }

    public String EditAboutUs(String a) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "UPDATE hiflydb.about SET about=?";
        String result = "T";
        if (a.trim().isEmpty()) {
            result = "F";
        } else {
            try {
                System.out.println("about= " + a);
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, a);
                ps.executeUpdate();

            } catch (SQLException e) {
                printSQLException(e);
                result = "F";
            }
        }
        return result;
    }

    public String EditPhone(String phone) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "UPDATE hiflydb.contact SET phone=?";
        String result = "T";
        if (phone.trim().isEmpty()) {
            result = "F";
        } else {
            try {
                //System.out.println("about= " + phone);
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, phone);
                ps.executeUpdate();

            } catch (SQLException e) {
                printSQLException(e);
                result = "F";
            }
        }
        return result;
    }

    public String EditEmail(String email) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "UPDATE hiflydb.contact SET email=?";
        String result = "T";
        if (email.trim().isEmpty()) {
            result = "F";
        } else {
            try {
                //System.out.println("about= " + email);
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, email);
                ps.executeUpdate();

            } catch (SQLException e) {
                printSQLException(e);
                result = "F";
            }
        }

        return result;
    }

    public String EditAddress(String address) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "UPDATE hiflydb.contact SET address=?";
        String result = "T";
        if (address.trim().isEmpty()) {
            result = "F";
        } else {
            try {
                //System.out.println("about= " + address);
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, address);
                ps.executeUpdate();

            } catch (SQLException e) {
                printSQLException(e);
                result = "F";
            }
        }

        return result;
    }

    public List< AddProducts> selectAllProducts() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List< AddProducts> Products = new ArrayList<>();
        loadDriver(dbdriver);
        // Step 1: Establishing a Connection
        Connection con = getConnection();
        String sql = "SELECT * from  hiflydb.products";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String pname = rs.getString("ProductName");
                int pid = rs.getInt("pid");
                String pdecs = rs.getString("ProductsDesc");
                int pprice = rs.getInt("ProductPrice");
                int pquan = rs.getInt("ProductQuantity");
                String pimage = rs.getString("ProductImage");

                Products.add(new AddProducts(pname, pdecs, pimage, pquan, pprice, pid));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Products;
    }

    public List<Users> selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Users> User = new ArrayList<>();
        loadDriver(dbdriver);
        // Step 1: Establishing a Connection
        Connection con = getConnection();
        String sql = "SELECT * from  hiflydb.users";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                User.add(new Users(name, email, phone));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return User;
    }

    public int DeleteProducts(int id) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        int result = 1;
        String sql = "DELETE FROM hiflydb.products WHERE pid=?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
            System.out.println(result);

        } catch (SQLException e) {

        }
        return result;
    }

    public String CartCheckNull(int pid, String CartID) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String AddToCart = null;
        String sql = "select * from hiflydb." + CartID;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("t");
                AddToCart = FindProduct(pid, CartID);
            } else {
                System.out.println("f");
                AddToCart = AddToCart(pid, CartID);
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return AddToCart;

    }

    public String AddToCart(int pid, String CartID) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = null;
        String sql = "INSERT INTO hiflydb." + CartID + "(pid,ProductName,ProductPrice,ProductImage) SELECT pid,ProductName,ProductPrice,ProductImage  FROM hiflydb.products where pid = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            result = String.valueOf(ps.executeUpdate());
            System.out.println("res" + result);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    public String FindProduct(int pid, String CartID) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        int pQuan = 1;
        String AddToCart = null;
        String sql = "select * from hiflydb." + CartID + " where pid = ?";
        System.out.println(sql);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            System.out.println(CartID);

            if (rs.next()) {
                System.out.println("t2");
                int NewpQuan = rs.getInt("ProductQuan");
                //System.out.println(NewpQuan);
                NewpQuan = NewpQuan + pQuan;
                //System.out.println(NewpQuan);
                AddToCart = AddQuan(pid, CartID, NewpQuan);
            } else {
                System.out.println("f2");
                AddToCart = AddToCart(pid, CartID);
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return AddToCart;
    }

    public String AddQuan(int pid, String CartID, int NewpQuan) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String AddToCart = null;
        String sql = "UPDATE hiflydb." + CartID + " SET ProductQuan = ? where pid = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, NewpQuan);
            ps.setInt(2, pid);
            AddToCart = String.valueOf(ps.executeUpdate());
        } catch (SQLException e) {
            printSQLException(e);
        }
        return AddToCart;
    }

    public List<Cart> ListCart(String CartID) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Cart> cart = new ArrayList<>();
        loadDriver(dbdriver);
        // Step 1: Establishing a Connection
        Connection con = getConnection();
        int TotalPrice=0,TotalQuan=0;
        String sql = "SELECT * from  hiflydb." + CartID;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String ProductName = rs.getString("ProductName");
                String ProductImage = rs.getString("ProductImage");
                int ProductPrice = rs.getInt("ProductPrice");
                int ProductQuan = rs.getInt("ProductQuan");
                TotalPrice = ProductPrice*ProductQuan+TotalPrice;
                TotalQuan = ProductQuan+TotalQuan;
                //System.out.println(TotalQuan);
                //System.out.println(TotalPrice);
                Cart cart1 = new Cart(TotalPrice,TotalQuan);
                cart.add(new Cart(ProductName, ProductImage, ProductPrice, ProductQuan));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cart;
    }

    
    public Cart Total(String CartID) {
            Cart cart1 = new Cart();
        // using try-with-resources to avoid closing resources (boiler plate code)
        loadDriver(dbdriver);
        // Step 1: Establishing a Connection
        Connection con = getConnection();
        int TotalPrice=0,TotalQuan=0;
        String sql = "SELECT * from  hiflydb." + CartID;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int ProductPrice = rs.getInt("ProductPrice");
                int ProductQuan = rs.getInt("ProductQuan");
                TotalPrice = ProductPrice*ProductQuan+TotalPrice;
                TotalQuan = ProductQuan+TotalQuan;
                //System.out.println(TotalQuan);
                //System.out.println(TotalPrice);
                cart1.setTotalPrice(TotalPrice);
                cart1.setTotalQuan(TotalQuan);
                
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cart1;
    }

    private void printSQLException(SQLException e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
