package myApp.dao;


import myApp.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountDao extends JpaRepository<Account, Long> {
    Account findByUsername(String username);
}
