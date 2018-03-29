package arqsoft.wallet.model;

import javax.persistence.*;

@Entity
@Table(name = "wallets")
@NamedQueries({
  @NamedQuery(name = Wallet.FIND_ALL, query = "SELECT u FROM Wallet u")})
public class Wallet {

    public static final String FIND_ALL = "Wallet.findAll";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long balance;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Long getBalance(){
      return balance;
    }
    public void setBalance(Long balance){
      this.balance += balance;
    }
}
