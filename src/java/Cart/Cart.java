/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

/**
 *
 * @author Lenovo
 */
public class Cart {
    String ProductName, ProductImage;  
    int ProductPrice,ProductQuan,TotalPrice,TotalQuan;

    public Cart(String ProductName, String ProductImage, int ProductPrice, int ProductQuan) {
        this.ProductName = ProductName;
        this.ProductImage = ProductImage;
        this.ProductPrice = ProductPrice;
        this.ProductQuan = ProductQuan;
    }

    public Cart(int TotalPrice, int TotalQuan) {
        this.TotalPrice = TotalPrice;
        this.TotalQuan = TotalQuan;
    }

    public Cart() {
    }

    
    
    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public int getTotalQuan() {
        return TotalQuan;
    }

    public void setTotalQuan(int TotalQuan) {
        this.TotalQuan = TotalQuan;
    }
    

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }

    public int getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(int ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public int getProductQuan() {
        return ProductQuan;
    }

    public void setProductQuan(int ProductQuan) {
        this.ProductQuan = ProductQuan;
    }

}
