
package MODEL;

public class Department {
    //Creates attributes
    private int Code_Department;
    private String Name;
    
     //Creates builders
    public Department(){}
    
    public Department(String Name){
        this.Name=Name;
    }
    
    public Department(int Code_Department){
        this.Code_Department=Code_Department;
    }
    
    public Department(int Code_Department,String Name){
        this.Code_Department=Code_Department;
        this.Name=Name;
    }

    //Creates basic methods
    public int getCode_Department() {
        return Code_Department;
    }

    public void setCode_Department(int Code_Department) {
        this.Code_Department = Code_Department;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
    
    
}
