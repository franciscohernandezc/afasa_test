package mx.com.afasa.action;


import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport {
	private static final long serialVersionUID = -3827439829486925185L;
	
        
        public String execute() {
            System.out.println("entra en execute ");
            
            return SUCCESS;
	}

}
