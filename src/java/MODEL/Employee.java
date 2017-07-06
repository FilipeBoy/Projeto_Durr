
package MODEL;

public class Employee {
     //Creates attributes
    private String CPF_Employee;
    private String Name;
    private String Function;
    private String Password;
    private int Code_Department;
    
     //Creates builders
    public Employee(){}
    
    public Employee(String CPF_Employee){
        this.CPF_Employee=CPF_Employee;
    }
    
    public Employee(String CPF_Employee,String Name,String Function,String Password,int Code_Department){
        this.CPF_Employee=CPF_Employee;
        this.Name=Name;
        this.Function=Function;
        this.Password=Password;
        this.Code_Department=Code_Department;
    }

    //Creates basic methods
    public String getCPF_Employee() {
        return CPF_Employee;
    }

    public void setCPF_Employee(String CPF_Employee) {
        this.CPF_Employee = CPF_Employee;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getFunction() {
        return Function;
    }

    public void setFunction(String Function) {
        this.Function = Function;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getCode_Department() {
        return Code_Department;
    }

    public void setCode_Department(int Code_Department) {
        this.Code_Department = Code_Department;
    }
    
}
