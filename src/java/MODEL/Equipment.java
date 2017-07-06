
package MODEL;


public class Equipment {
     //Creates attributes
    private String SN_Equipment;
    private String Model_Reference;
    private int Code_Unit;
    
     //Creates builders
    public Equipment(){}
    
    public Equipment(String SN_Equipment){
        this.SN_Equipment=SN_Equipment;
    }
    
    public Equipment(String SN_Equipment,String Model_Reference,int Code_Unit){
        this.SN_Equipment=SN_Equipment;
        this.Model_Reference=Model_Reference;
        this.Code_Unit=Code_Unit;
    }

    //Creates basic methods
    public String getSN_Equipment() {
        return SN_Equipment;
    }

    public void setSN_Equipment(String SN_Equipment) {
        this.SN_Equipment = SN_Equipment;
    }

    public String getModel_Reference() {
        return Model_Reference;
    }

    public void setModel_Reference(String Model_Reference) {
        this.Model_Reference = Model_Reference;
    }

    public int getCode_Unit() {
        return Code_Unit;
    }

    public void setCode_Unit(int Code_Unit) {
        this.Code_Unit = Code_Unit;
    }
}
