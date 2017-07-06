
package MODEL;


public class Maintenance {
     //Creates attributes
    private int Code_Maintenance;
    private String Date;
    private String Problem;
    private String Solution;
    private String SN_Equipment;
    private String CPF_Employee;
    
     //Creates builders
    public Maintenance(){}
    
    public Maintenance(int Code_Maintenance){
        this.Code_Maintenance=Code_Maintenance;
        
    }
    
    public Maintenance(int Code_Maintenance,String Date,String Problem,String Solution,String SN_Equipment,String CPF_Employee){
        this.Code_Maintenance=Code_Maintenance;
        this.Date=Date;
        this.Problem=Problem;
        this.Solution=Solution;
        this.SN_Equipment=SN_Equipment;
        this.CPF_Employee=CPF_Employee;
    }
    public Maintenance(String Date,String Problem,String Solution,String SN_Equipment,String CPF_Employee){
        this.Date=Date;
        this.Problem=Problem;
        this.Solution=Solution;
        this.SN_Equipment=SN_Equipment;
        this.CPF_Employee=CPF_Employee;
    }

    //Creates basic methods
    public int getCode_Maintenance() {
        return Code_Maintenance;
    }

    public void setCode_Maintenance(int Code_Maintenance) {
        this.Code_Maintenance = Code_Maintenance;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getProblem() {
        return Problem;
    }

    public void setProblem(String Problem) {
        this.Problem = Problem;
    }

    public String getSolution() {
        return Solution;
    }

    public void setSolution(String Solution) {
        this.Solution = Solution;
    }

    public String getSN_Equipment() {
        return SN_Equipment;
    }

    public void setSN_Equipment(String SN_Equipment) {
        this.SN_Equipment = SN_Equipment;
    }

    public String getCPF_Employee() {
        return CPF_Employee;
    }

    public void setCPF_Employee(String CPF_Employee) {
        this.CPF_Employee = CPF_Employee;
    }
}
