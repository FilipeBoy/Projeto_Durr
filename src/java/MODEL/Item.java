
package MODEL;


public class Item {
     //Creates attributes
    private String Item_Reference;
    private String Name;
    private int Amount;
    
     //Creates builders
    public Item(){}
    
    public Item(String Item_Reference){
        this.Item_Reference=Item_Reference;
    }
    
    public Item(String Item_Reference,String Name,int Amount){
        this.Item_Reference=Item_Reference;
        this.Name=Name;
        this.Amount=Amount;
    }

    //Creates basic methods
    public String getItem_Reference() {
        return Item_Reference;
    }

    public void setItem_Reference(String Item_Reference) {
        this.Item_Reference = Item_Reference;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }
}
