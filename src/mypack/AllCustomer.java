package mypack;

public class AllCustomer {
	private int id;
	private String name;
	private String email;
	private String accountno;
	private String balance;
	public AllCustomer()
	{
		
	}
	public AllCustomer(int id, String name, String email, String accountno, String balance) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.accountno = accountno;
		this.balance = balance;
	}
	public AllCustomer(String name, String email, String accountno, String balance) {
		super();
		this.name = name;
		this.email = email;
		this.accountno = accountno;
		this.balance = balance;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	
	
}
