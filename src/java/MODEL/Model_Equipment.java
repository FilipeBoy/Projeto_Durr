
package MODEL;


public class Model_Equipment {
     //Creates attributes
    private String Model_Reference;
    private String Name;
    
     //Creates builders
    public Model_Equipment(){}
    
    public Model_Equipment(String Model_Reference){
        this.Model_Reference=Model_Reference;
    }
        
    public Model_Equipment(String Model_Reference, String Name){
        this.Model_Reference=Model_Reference;
        this.Name=Name;
    }
    
    //Creates basic methods
    public String getModel_Reference() {
        return Model_Reference;
    }

    public void setModel_Reference(String Model_Reference) {
        this.Model_Reference = Model_Reference;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
    
    
}
