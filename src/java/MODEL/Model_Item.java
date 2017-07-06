
package MODEL;


public class Model_Item {
     //Creates attributes
    private int Code_Model_Item;
    private String Model_Reference;
    private String Item_Reference;
    
     //Creates builders
    public Model_Item(){}
    
    public Model_Item(int Code_Model_Item){
        this.Code_Model_Item=Code_Model_Item;
    }
    
    public Model_Item(int Code_Model_Item,String Model_Reference,String Item_Reference){
        this.Code_Model_Item=Code_Model_Item;
        this.Model_Reference=Model_Reference;
        this.Item_Reference=Item_Reference;
    }
     public Model_Item(String Model_Reference,String Item_Reference){
        this.Model_Reference=Model_Reference;
        this.Item_Reference=Item_Reference;
    }
      public Model_Item(String Item_Reference){
        this.Item_Reference=Item_Reference;
    }

    //Creates basic methods
    public int getCode_Model_Item() {
        return Code_Model_Item;
    }

    public void setCode_Model_Item(int Code_Model_Item) {
        this.Code_Model_Item = Code_Model_Item;
    }

    public String getModel_Reference() {
        return Model_Reference;
    }

    public void setModel_Reference(String Model_Reference) {
        this.Model_Reference = Model_Reference;
    }

    public String getItem_Reference() {
        return Item_Reference;
    }

    public void setItem_Reference(String Item_Reference) {
        this.Item_Reference = Item_Reference;
    }
}
