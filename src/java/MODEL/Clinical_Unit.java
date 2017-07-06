
package MODEL;


public class Clinical_Unit {
     //Creates attributes
    private int Code_Unit;
    private String Street;
    private String Number;
    private String Complement;
    private String Phone;
    private String Neighborhood;
    private String City;
    private String State;
    private String Zip_Code;
    private String CPF_CNPJ_Clinical;
    
    //Creates builders

    public Clinical_Unit(){}
    
    public Clinical_Unit(int Code_Unit){
        this.Code_Unit=Code_Unit;
    }
    
    public Clinical_Unit(String CPF_CNPJ_Clinical){
        this.CPF_CNPJ_Clinical=CPF_CNPJ_Clinical;
    }
    
    public Clinical_Unit(String Street,String Number,String Complement,
            String Phone,String Neighborhood,String City,String State,String Zip_Code,
            String CPF_CNPJ_Clinical){
        this.Street=Street;
        this.Number=Number;
        this.Complement=Complement;
        this.Phone=Phone;
        this.Neighborhood=Neighborhood;
        this.City=City;
        this.State=State;
        this.Zip_Code=Zip_Code;
        this.CPF_CNPJ_Clinical=CPF_CNPJ_Clinical;
    }
    
    public Clinical_Unit(int Code_Unit,String Street,String Number,String Complement,
            String Phone,String Neighborhood,String City,String State,String Zip_Code,
            String CPF_CNPJ_Clinical){
        this.Code_Unit=Code_Unit;
        this.Street=Street;
        this.Number=Number;
        this.Complement=Complement;
        this.Phone=Phone;
        this.Neighborhood=Neighborhood;
        this.City=City;
        this.State=State;
        this.Zip_Code=Zip_Code;
        this.CPF_CNPJ_Clinical=CPF_CNPJ_Clinical;
    }

    //Creates basic methods
    public int getCode_Unit() {
        return Code_Unit;
    }

    public void setCode_Unit(int Code_Unit) {
        this.Code_Unit = Code_Unit;
    }

    public String getStreet() {
        return Street;
    }

    public void setStreet(String Street) {
        this.Street = Street;
    }

    public String getNumber() {
        return Number;
    }

    public void setNumber(String Number) {
        this.Number = Number;
    }

    public String getComplement() {
        return Complement;
    }

    public void setComplement(String Complement) {
        this.Complement = Complement;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getNeighborhood() {
        return Neighborhood;
    }

    public void setNeighborhood(String Neighborhood) {
        this.Neighborhood = Neighborhood;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getState() {
        return State;
    }

    public void setState(String State) {
        this.State = State;
    }

    public String getZip_Code() {
        return Zip_Code;
    }

    public void setZip_Code(String Zip_Code) {
        this.Zip_Code = Zip_Code;
    }

    public String getCPF_CNPJ_Clinical() {
        return CPF_CNPJ_Clinical;
    }

    public void setCPF_CNPJ_Clinical(String CPF_CNPJ_Clinical) {
        this.CPF_CNPJ_Clinical = CPF_CNPJ_Clinical;
    }
}
