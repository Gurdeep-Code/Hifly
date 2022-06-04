package AdminPanel;

/**
 *
 * @author Lenovo
 */
public class AddProducts {
    String Pname,Pdesc,Pimage;
    int Pquantity,Pprice,Pid;

    public AddProducts(String Pname, String Pdesc, int Pquantity, int Pprice) {
        this.Pname = Pname;
        this.Pdesc = Pdesc;
        this.Pquantity = Pquantity;
        this.Pprice = Pprice;
    }

    public AddProducts(String Pname, String Pdesc, String Pimage, int Pquantity, int Pprice, int Pid) {
        this.Pname = Pname;
        this.Pdesc = Pdesc;
        this.Pimage = Pimage;
        this.Pquantity = Pquantity;
        this.Pprice = Pprice;
        this.Pid = Pid;
    }
    
    

    public AddProducts(String Pname, String Pdesc, String Pimage, int Pquantity, int Pprice) {
        this.Pname = Pname;
        this.Pdesc = Pdesc;
        this.Pimage = Pimage;
        this.Pquantity = Pquantity;
        this.Pprice = Pprice;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }
    

    public String getPname() {
        return Pname;
    }

    public void setPname(String Pname) {
        this.Pname = Pname;
    }

    public String getPdesc() {
        return Pdesc;
    }

    public void setPdesc(String Pdesc) {
        this.Pdesc = Pdesc;
    }

    public String getPimage() {
        return Pimage;
    }

    public void setPimage(String Pimage) {
        this.Pimage = Pimage;
    }

    public int getPquantity() {
        return Pquantity;
    }

    public void setPquantity(int Pquantity) {
        this.Pquantity = Pquantity;
    }

    public int getPprice() {
        return Pprice;
    }

    public void setPprice(int Pprice) {
        this.Pprice = Pprice;
    }
    
}
