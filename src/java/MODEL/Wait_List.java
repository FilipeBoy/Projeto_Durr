
package MODEL;


public class Wait_List {
     //Creates attributes
    private int Code_List;
    private String Arrival_Date;
    private String Problem;
    private String Prognosis;
    private String Status;
    private String SN_Equipment;
    
     //Creates builders
    public Wait_List(){}
    
    public Wait_List(int Code_List){
        this.Code_List=Code_List;
    }
    
    public Wait_List(int Code_List,String Arrival_Date, String Problem,String Prognosis,String Status,String SN_Equipment){
        this.Code_List=Code_List;
        this.Arrival_Date=Arrival_Date;
        this.Problem=Problem;
        this.Prognosis=Prognosis;
        this.Status=Status;
        this.SN_Equipment=SN_Equipment;
    }
    
     public Wait_List(String Arrival_Date, String Problem,String Prognosis,String Status,String SN_Equipment){
        this.Arrival_Date=Arrival_Date;
        this.Problem=Problem;
        this.Prognosis=Prognosis;
        this.Status=Status;
        this.SN_Equipment=SN_Equipment;
    }

    //Creates basic methods
    public int getCode_List() {
        return Code_List;
    }

    public void setCode_List(int Code_List) {
        this.Code_List = Code_List;
    }

    public String getArrival_Date() {
        return Arrival_Date;
    }

    public void setArrival_Date(String Arrival_Date) {
        this.Arrival_Date = Arrival_Date;
    }

    public String getProblem() {
        return Problem;
    }

    public void setProblem(String Problem) {
        this.Problem = Problem;
    }

    public String getPrognosis() {
        return Prognosis;
    }

    public void setPrognosis(String Prognosis) {
        this.Prognosis = Prognosis;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getSN_Equipment() {
        return SN_Equipment;
    }

    public void setSN_Equipment(String SN_Equipment) {
        this.SN_Equipment = SN_Equipment;
    }
}
