
package MODEL;


public class Item_List {
     //Creates attributes
    private int Code_Item;
    private String Item_Reference;
    private int Code_Maintenance;
    
     //Creates builders
    public Item_List(){}
    
    public Item_List(int Code_Item){
        this.Code_Item=Code_Item;
    }
    
    public Item_List(int Code_Item,String Item_Reference,int Code_Maintenance){
        this.Code_Item=Code_Item;
        this.Item_Reference=Item_Reference;
        this.Code_Maintenance=Code_Maintenance;
    }
    
     public Item_List(String Item_Reference,int Code_Maintenance){
        this.Item_Reference=Item_Reference;
        this.Code_Maintenance=Code_Maintenance;
    }

    //Creates basic methods
    public int getCode_Item() {
        return Code_Item;
    }

    public void setCode_Item(int Code_Item) {
        this.Code_Item = Code_Item;
    }

    public String getItem_Reference() {
        return Item_Reference;
    }

    public void setItem_Reference(String Item_Reference) {
        this.Item_Reference = Item_Reference;
    }

    public int getCode_Maintenance() {
        return Code_Maintenance;
    }

    public void setCode_Maintenance(int Code_Maintenance) {
        this.Code_Maintenance = Code_Maintenance;
    }
    
}
