
package model;

import java.util.List;

public class Cart {
    private List<Item> l;

    public Cart() {
    }

    public Cart(List<Item> l) {
        this.l = l;
    }

    public List<Item> getL() {
        return l;
    }

    public void setL(List<Item> l) {
        this.l = l;
    }
    
    
}
