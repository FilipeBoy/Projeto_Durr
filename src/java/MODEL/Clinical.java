
package MODEL;


public class Clinical {
     //Creates attributes
    private String CPF_CNPJ_Clinical;
    private String Name;
    
     //Creates builders
    public Clinical(){}
    
    public Clinical(String CPF_CNPJ_Clinical){
        this.CPF_CNPJ_Clinical=CPF_CNPJ_Clinical;
    }
    
    public Clinical(String CPF_CNPJ_Clinical,String Name){
        this.CPF_CNPJ_Clinical=CPF_CNPJ_Clinical;
        this.Name=Name;
    }

    //Creates basic methods
    public String getCPF_CNPJ_Clinical() {
        return CPF_CNPJ_Clinical;
    }

    public void setCPF_CNPJ_Clinical(String CPF_CNPJ_Clinical) {
        this.CPF_CNPJ_Clinical = CPF_CNPJ_Clinical;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
    
}
